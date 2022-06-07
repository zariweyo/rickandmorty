import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data_page/UI/index.dart';
import 'package:rickandmorty/shared/UI/index.dart';
import 'package:rickandmorty/data_page/bloc_controller/index.dart';
import 'package:rickandmorty/shared/models/index.dart';
import 'package:rickandmorty/data_page/models/index.dart';

class DataHeaderSearch extends StatelessWidget {
  const DataHeaderSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
            child: LogoGlobal(
          maxWidth: 300,
        )),
        Container(child: SearchField(onChanged: (String text) {
          BlocProvider.of<DataPageBloc>(context).add(DataPageBlocEvent<String>(
              DataPageBlocEventType.changeFilterName, text));
        })),
        DataFilterTab(
          onChange: (PaginationFilterGender selected) {
            BlocProvider.of<DataPageBloc>(context).add(
                DataPageBlocEvent<PaginationFilterGender>(
                    DataPageBlocEventType.changeFilterGender, selected));
          },
        ),
      ]),
    );
  }
}
