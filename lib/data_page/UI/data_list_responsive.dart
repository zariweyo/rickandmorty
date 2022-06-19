import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:rickandmorty/data_page/bloc_controller/index.dart';
import 'package:rickandmorty/shared/models/character_model.dart';
import 'package:rickandmorty/data_page/models/index.dart';

import 'cartoon_card.dart';

class DataListResponsive extends StatefulWidget {
  const DataListResponsive({Key? key}) : super(key: key);

  @override
  _DataListResponsiveState createState() => _DataListResponsiveState();
}

class _DataListResponsiveState extends State<DataListResponsive> {
  List<Character> characters = [];
  bool loading = true;

  blocListener(BuildContext blocContext, DataPageBlocAction action){
    if (action.type == DataPageBlocActionType.newCharacters) {
        characters = action.data as List<Character>;
        loading = false;
    } else if (action.type == DataPageBlocActionType.loagingActionStart) {
        loading = true;
    } else if (action.type == DataPageBlocActionType.newMoreCharacters) {
        var _charactersAdded = action.data as List<Character>;
        characters = [...characters, ..._charactersAdded];
        loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataPageBloc,DataPageBlocAction>(
      listener: blocListener,
      builder: (blocContext,blocState) {
        if (loading) {
          return Container(
              padding: const EdgeInsets.all(50),
              child: const Center(
                  child: CircularProgressIndicator(
                color: Color(0xff081F32),
              )));
        }

        return ResponsiveGridRow(
          children: characters
              .map((character) => ResponsiveGridCol(
                  xs: 12,
                  md: 6,
                  lg: 4,
                  xl: 3,
                  child: CartoonCard(
                    character: character,
                  )))
              .toList(), // The list of widgets in the list
        );
      }
    );
  }
}
