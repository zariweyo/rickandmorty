import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data_page/components/DataHeaderSearch.dart';
import 'package:rickandmorty/data_page/controllers/DataPageBloc.dart';

import '../components/DataFooter.dart';
import '../components/DataListResponsive.dart';

class DataScreenList extends StatelessWidget {
  late ScrollController _controller;
  late BuildContext _context;

  DataScreenList({Key? key}) : super(key: key) {
    _controller = ScrollController();

    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
        BlocProvider.of<DataPageBloc>(_context).add(DataPageBlocEvent(DataPageBlocEventType.loadMoreCharacters,{}));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      child: ListView(
        controller: _controller,
        children:[
          const DataHeaderSearch(),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: const DataListResponsive()
            )
          ),
          const DataFooter()
        ]
      )
    );
  }
}