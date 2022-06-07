import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data_page/UI/index.dart';
import 'package:rickandmorty/data_page/bloc_controller/index.dart';
import 'package:rickandmorty/data_page/models/index.dart';

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
