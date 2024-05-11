import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/application/list/data_page_bloc.dart';
import 'package:rickandmorty/application/list/data_page_bloc_action.dart';
import 'package:rickandmorty/presentation/list/data_screen.dart';

class DataPage extends StatelessWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DataPageBloc>(
      create: (BuildContext _context) => DataPageBloc(
          DataPageBlocAction<BuildContext>(
              DataPageBlocActionType.initial, context)),
      child: const DataScreen(),
    );
  }
}
