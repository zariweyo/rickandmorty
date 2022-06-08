import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data_page/UI/index.dart';
import 'package:rickandmorty/data_page/bloc_controller/index.dart';
import 'package:rickandmorty/data_page/models/index.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  bool showHome = true;

  late StreamSubscription subscription;

  @override
  void initState() {
    subscription =
        BlocProvider.of<DataPageBloc>(context).stream.listen((event) {
      if (event.type == DataPageBlocActionType.showHome) {
        setState(() {
          showHome = true;
        });
      } else if (event.type == DataPageBlocActionType.showLists) {
        setState(() {
          showHome = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Widget body() {
    if (!showHome) {
      return const DataScreenList();
    }

    return const DataScreenHome(key: Key('DataScreenHome'));
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }
}
