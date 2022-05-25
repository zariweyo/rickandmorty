import 'package:flutter/material.dart';
import 'package:rickandmorty/shared/models/PaginationModel.dart';
import "../../shared/extensions/capitalize.dart";


class DataFilterTab extends StatefulWidget {

  Function(PaginationFilterGender) onChange;

  DataFilterTab({
    Key? key,
    required this.onChange
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
    _tabController = TabController(length: PaginationFilterGender.values.length, vsync: this);
    _tabController.addListener(() {
      PaginationFilterGender selectedOption = PaginationFilterGender.values[_tabController.index];
      if(currentOption != selectedOption){
        currentOption = selectedOption;
        widget.onChange(selectedOption);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 1),
      decoration: const BoxDecoration(
        color: Colors.black
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: const Color(0xffB2DF28),
        tabs: 
          PaginationFilterGender.values.map((option) => 
            Tab(
              icon: Text(option.name.capitalize()),
            ),
          ).toList()
        ,
      )
    );
  }
}