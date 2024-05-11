import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/application/list/data_page_bloc.dart';
import 'package:rickandmorty/application/list/data_page_bloc_action.dart';
import 'package:rickandmorty/presentation/list/data_screen_home.dart';
import 'package:rickandmorty/presentation/list/data_screen_list.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  bool showHome = true;

  Widget body() {
    if (!showHome) {
      return const DataScreenList();
    }

    return const DataScreenHome(key: Key('DataScreenHome'));
  }

  blocListener(BuildContext blocContext, DataPageBlocAction action) {
    if (action.type == DataPageBlocActionType.showHome) {
      showHome = true;
    } else if (action.type == DataPageBlocActionType.showLists) {
      showHome = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataPageBloc, DataPageBlocAction>(
        listener: blocListener, builder: (blocContext, blocState) => body());
  }
}
