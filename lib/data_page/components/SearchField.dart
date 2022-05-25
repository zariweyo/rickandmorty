import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:rickandmorty/data_page/controllers/DataPageBloc.dart';
import 'package:rickandmorty/shared/components/index.dart';
import 'package:rickandmorty/shared/models/PaginationModel.dart';

import 'CartoonCard.dart';

class SearchField extends StatefulWidget {
  Function(String) onChanged;

  SearchField({
    Key? key,
    required this.onChanged
  }) : super(key: key);

  @override
  _SearchFieldStatus createState() => _SearchFieldStatus();

}

class _SearchFieldStatus extends State<SearchField> {
  late StreamSubscription subscription;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    subscription = BlocProvider.of<DataPageBloc>(context).stream.listen((event) {
      if(event.type == DataPageBlocActionType.initialFilter){
        PaginationFilter currentFilter = event.data as PaginationFilter;
        textEditingController.text = currentFilter.name;
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
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 10),
      constraints: const BoxConstraints(
        minWidth: 300,
        maxWidth: 500
      ),
      decoration: BoxDecoration(
        color:  const Color(0xff081F32),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Colors.white)
      ),
      child: TextField(
        controller: textEditingController,
        onChanged: widget.onChanged,
        decoration: const InputDecoration(
          icon: const Icon(Icons.search, color: Colors.white,),
          hintText: 'Buscar personaje...',
          hintStyle: TextStyle(
            color: Colors.white
          ),
        ),
        style: const TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}