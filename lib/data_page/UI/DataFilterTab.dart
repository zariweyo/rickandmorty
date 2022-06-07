import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data_page/bloc_controller/index.dart';
import 'package:rickandmorty/data_page/models/index.dart';
import 'package:rickandmorty/shared/extensions/capitalize.dart';
import 'package:rickandmorty/shared/models/index.dart';

class DataFilterTab extends StatefulWidget {
  Function(PaginationFilterGender) onChange;

  DataFilterTab({
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
  late StreamSubscription subscription;

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

    subscription =
        BlocProvider.of<DataPageBloc>(context).stream.listen((event) {
      if (event.type == DataPageBlocActionType.initialFilter) {
        PaginationFilter currentFilter = event.data as PaginationFilter;
        _tabController.index = PaginationFilterGender.values
            .indexWhere((element) => element.name == currentFilter.gender.name);
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 1),
        decoration: const BoxDecoration(color: Colors.black),
        child: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xffB2DF28),
          tabs: PaginationFilterGender.values
              .map(
                (option) => Tab(
                  icon: Text(option.name.capitalize()),
                ),
              )
              .toList(),
        ));
  }
}
