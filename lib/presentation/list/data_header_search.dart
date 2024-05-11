import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/application/list/data_page_bloc.dart';
import 'package:rickandmorty/application/list/data_page_bloc_event.dart';
import 'package:rickandmorty/domain/models/list/pagination_filter.dart';
import 'package:rickandmorty/presentation/common/logo_global.dart';
import 'package:rickandmorty/presentation/list/data_filter_tab.dart';
import 'package:rickandmorty/presentation/list/search_field.dart';

class DataHeaderSearch extends StatelessWidget {
  const DataHeaderSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const LogoGlobal(
        maxWidth: 300,
      ),
      SearchField(onChanged: (String text) {
        BlocProvider.of<DataPageBloc>(context).add(DataPageBlocEvent<String>(
            DataPageBlocEventType.changeFilterName, text));
      }),
      DataFilterTab(
        onChange: (PaginationFilterGender selected) {
          BlocProvider.of<DataPageBloc>(context).add(
              DataPageBlocEvent<PaginationFilterGender>(
                  DataPageBlocEventType.changeFilterGender, selected));
        },
      ),
    ]);
  }
}
