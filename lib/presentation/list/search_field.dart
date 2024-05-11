import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rickandmorty/application/list/data_page_bloc.dart';
import 'package:rickandmorty/application/list/data_page_bloc_action.dart';
import 'package:rickandmorty/domain/models/list/pagination_filter.dart';

class SearchField extends StatefulWidget {
  final Function(String) onChanged;

  const SearchField({Key? key, required this.onChanged}) : super(key: key);

  @override
  _SearchFieldStatus createState() => _SearchFieldStatus();
}

class _SearchFieldStatus extends State<SearchField> {
  TextEditingController textEditingController = TextEditingController();

  blocListener(BuildContext blocContext, DataPageBlocAction action) {
    if (action.type == DataPageBlocActionType.initialFilter) {
      PaginationFilter currentFilter = action.data as PaginationFilter;
      textEditingController.text = currentFilter.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DataPageBloc, DataPageBlocAction>(
        listener: blocListener,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left: 10),
          constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
          decoration: BoxDecoration(
              color: const Color(0xff081F32),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.white)),
          child: TextField(
            controller: textEditingController,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: AppLocalizations.of(context)!.searchCharacter,
              hintStyle: const TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}
