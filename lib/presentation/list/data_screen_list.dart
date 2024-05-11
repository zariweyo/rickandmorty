import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/application/list/data_page_bloc.dart';
import 'package:rickandmorty/application/list/data_page_bloc_event.dart';
import 'package:rickandmorty/presentation/list/data_footer.dart';
import 'package:rickandmorty/presentation/list/data_header_search.dart';
import 'package:rickandmorty/presentation/list/data_list_responsive.dart';

class DataScreenList extends StatefulWidget {
  const DataScreenList({Key? key}) : super(key: key);

  @override
  State<DataScreenList> createState() => _DataScreenListState();
}

class _DataScreenListState extends State<DataScreenList> {
  late BuildContext _context;
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();

    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        BlocProvider.of<DataPageBloc>(_context).add(DataPageBlocEvent<dynamic>(
            DataPageBlocEventType.loadMoreCharacters, {}));
      }
    });

    BlocProvider.of<DataPageBloc>(context).add(
        DataPageBlocEvent<dynamic>(DataPageBlocEventType.firstLoadData, {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return ListView(controller: _controller, children: [
      const DataHeaderSearch(key: Key('DataHeaderSearch')),
      Center(
          child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: const DataListResponsive())),
      const DataFooter()
    ]);
  }
}
