import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:rickandmorty/shared/components/index.dart';

import 'CartoonCard.dart';

class SearchField extends StatelessWidget {
  Function(String) onChanged;

  SearchField({
    Key? key,
    required this.onChanged
  }) : super(key: key);

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
        onChanged: onChanged,
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