import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data_page/components/SearchField.dart';
import 'package:rickandmorty/shared/components/index.dart';
import 'DataFilterTab.dart';
import 'package:rickandmorty/data_page/controllers/DataPageBloc.dart';
import 'package:rickandmorty/shared/models/PaginationModel.dart';

class DataHeaderSearch extends StatelessWidget {
  const DataHeaderSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: LogoGlobal(
              maxWidth: 300,
            )
          ),
          Container(
            child: SearchField(
              onChanged: (String text) { 
                BlocProvider.of<DataPageBloc>(context).add(DataPageBlocEvent(DataPageBlocEventType.changeFilterName,text));
              }
            )
          ),
          DataFilterTab(
            onChange: (PaginationFilterGender selected){
              BlocProvider.of<DataPageBloc>(context).add(DataPageBlocEvent(DataPageBlocEventType.changeFilterGender,selected));
            },
          ),
        ]
      ),
    );
  }
}