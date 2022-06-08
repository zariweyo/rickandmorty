import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data_page/bloc_controller/index.dart';
import 'package:rickandmorty/data_page/models/index.dart';
import 'package:rickandmorty/shared/UI/index.dart';

class DataFooter extends StatefulWidget {
  const DataFooter({Key? key}) : super(key: key);

  @override
  _DataFooterState createState() => _DataFooterState();
}

class _DataFooterState extends State<DataFooter> {
  bool loadingMore = false;
  late StreamSubscription subscription;

  @override
  void initState() {
    subscription =
        BlocProvider.of<DataPageBloc>(context).stream.listen((event) {
      if (event.type == DataPageBlocActionType.loagingMoreActionStart) {
        setState(() {
          loadingMore = true;
        });
      } else if (event.type == DataPageBlocActionType.newMoreCharacters) {
        setState(() {
          loadingMore = false;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Column(children: [
        loadingMore
            ? const LinearProgressIndicator(
            color: Color(0xff081F32),
              )
            : Container(),
        const SquadLogoGlobal()
      ]),
    );
  }
}
