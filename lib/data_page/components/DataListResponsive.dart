import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:rickandmorty/data_page/controllers/DataPageBloc.dart';
import 'package:rickandmorty/shared/models/DataModel.dart';

import 'CartoonCard.dart';

class DataListResponsive extends StatefulWidget {
  const DataListResponsive({Key? key}) : super(key: key);

  @override
  _DataListResponsiveState createState() => _DataListResponsiveState();

}

class _DataListResponsiveState extends State<DataListResponsive> {

  late StreamSubscription subscription;
  List<Character> characters = [];
  bool loading = true;
  
  @override
  void initState() {
    subscription = BlocProvider.of<DataPageBloc>(context).stream.listen((event) {
      if(event.type == DataPageBlocActionType.newCharacters){
        setState(() {
          characters = event.data as List<Character>;
          loading = false;
        });
      }else if(event.type == DataPageBlocActionType.loagingActionStart){
        setState(() {
          loading = true;
        });
      }else if(event.type == DataPageBlocActionType.newMoreCharacters){
        setState(() {
          var _charactersAdded = event.data as List<Character>;
          characters = [...characters, ..._charactersAdded];
          loading = false;
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
    if(loading){
      return Container(
        padding: const EdgeInsets.all(50),
        child: const Center(
          child: CircularProgressIndicator(color: Color(0xff081F32),)
        )
      );
    }

    return ResponsiveGridList(
        horizontalGridSpacing: 16,
        horizontalGridMargin: 50,
        verticalGridMargin: 50, 
        minItemWidth: 360, 
        minItemsPerRow: 1, 
        maxItemsPerRow: 5, 
        shrinkWrap: true, 
        children: characters.map(
          (character) => CartoonCard(
            character: character,
          )
        ).toList(), // The list of widgets in the list
    );
  }
}