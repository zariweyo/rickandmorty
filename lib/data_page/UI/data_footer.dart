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

  blocListener(BuildContext blocContext, DataPageBlocAction action){
    if (action.type == DataPageBlocActionType.loagingMoreActionStart) {
      loadingMore = true;
    } else if (action.type == DataPageBlocActionType.newMoreCharacters) {
      loadingMore = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataPageBloc,DataPageBlocAction>(
      listener: blocListener,
      builder: (blocContext,blocState) => 
    
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Column(children: [
            loadingMore
                ? const LinearProgressIndicator(
                color: Color(0xff081F32),
                  )
                : Container(),
            const SquadLogoGlobal()
          ])
      )
    );
  }
}
