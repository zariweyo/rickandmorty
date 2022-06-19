import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data_page/bloc_controller/index.dart';
import 'package:rickandmorty/data_page/models/index.dart';
import 'package:rickandmorty/shared/extensions/capitalize.dart';
import 'package:rickandmorty/shared/models/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DataFilterTab extends StatefulWidget {
  final Function(PaginationFilterGender) onChange;

  const DataFilterTab({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  State<DataFilterTab> createState() => _DataFilterTabState();
}

class _DataFilterTabState extends State<DataFilterTab>
    with TickerProviderStateMixin {
  late TabController _tabController;
  PaginationFilterGender currentOption = PaginationFilterGender.all;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: PaginationFilterGender.values.length, vsync: this);
    _tabController.addListener(() {
      PaginationFilterGender selectedOption =
          PaginationFilterGender.values[_tabController.index];
      if (currentOption != selectedOption) {
        currentOption = selectedOption;
        widget.onChange(selectedOption);
      }
    });
  }

  blocListener(BuildContext blocContext, DataPageBlocAction action){
    if (action.type == DataPageBlocActionType.initialFilter) {
        PaginationFilter currentFilter = action.data as PaginationFilter;
        _tabController.index = PaginationFilterGender.values
            .indexWhere((element) => element.name == currentFilter.gender.name);
    }
  }

  String getName(PaginationFilterGender genderOption){
    switch(genderOption){
      case PaginationFilterGender.female:
        return AppLocalizations.of(context)!.paginationFilterGenderFemale;

      case PaginationFilterGender.male:
        return AppLocalizations.of(context)!.paginationFilterGenderMale;

      case PaginationFilterGender.genderless:
        return AppLocalizations.of(context)!.paginationFilterGenderGenderless;

      case PaginationFilterGender.unknown:
        return AppLocalizations.of(context)!.paginationFilterGenderUnknown;

      case PaginationFilterGender.all:
      default:
        return AppLocalizations.of(context)!.paginationFilterGenderAll;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DataPageBloc,DataPageBlocAction>(
      listener: blocListener,
      child:Container(
        padding: const EdgeInsets.only(bottom: 1),
        decoration: const BoxDecoration(color: Colors.black),
        child: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xffB2DF28),
          tabs: PaginationFilterGender.values
              .map(
                (option) => Tab(
                  icon: Text(getName(option).capitalize()),
                ),
              )
              .toList(),
        )
      )
    );
  }
}
