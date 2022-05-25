import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/data_page/screens/DataScreen.dart';
import 'controllers/DataPageBloc.dart';

class DataPage extends StatelessWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DataPageBloc>(
      create: (BuildContext _context) => DataPageBloc(DataPageBlocAction(DataPageBlocActionType.initial,context)),
      child: const DataScreen(),
    );
  }
}