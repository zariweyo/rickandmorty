import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/data_page/models/index.dart';
import 'package:rickandmorty/shared/models/index.dart';
import 'package:rickandmorty/shared/repository/index.dart';

class DataPageBloc extends Bloc<DataPageBlocEvent, DataPageBlocAction> {
  late BuildContext       context;

  late ServiceRepository  serviceRepository   =   GetIt.I.get<ServiceRepository>();
  late LocalRepository    localRepository;

  PaginationModel         paginationResult    =   PaginationModel();
  PaginationFilter        filter              =   PaginationFilter();

  DataPageBloc(DataPageBlocAction<BuildContext> initialState)
      : super(initialState) {
    context = initialState.data;

    on<DataPageBlocEvent>(mapEventToState);

    localRepository = LocalRepository();

    localRepository.onReady().then((isReady) {
      if (isReady) {
        filter = localRepository.getFilter();
      }
    });
  }

  Future<void> mapEventToState(
      DataPageBlocEvent event, Emitter<DataPageBlocAction> emit) async {

    switch (event.type) {
      case DataPageBlocEventType.continueEvent:
        emit(DataPageBlocAction<dynamic>(DataPageBlocActionType.showLists, {}));
        break;

      case DataPageBlocEventType.firstLoadData:
        emit(DataPageBlocAction<PaginationFilter>(DataPageBlocActionType.initialFilter, filter));
        await callService();
        emit(DataPageBlocAction<List<Character>>(DataPageBlocActionType.newCharacters, paginationResult.results));
        break;
      case DataPageBlocEventType.backToTitleEvent:
        emit(DataPageBlocAction<dynamic>(DataPageBlocActionType.showHome, {}));
        break;

      case DataPageBlocEventType.changeFilterGender:
        filter.gender = (event as DataPageBlocEvent<PaginationFilterGender>).data;
        emit(DataPageBlocAction<dynamic>(DataPageBlocActionType.loagingActionStart, {}));
        await localRepository.setFilter(filter);
        await callService();
        emit(DataPageBlocAction<List<Character>>(DataPageBlocActionType.newCharacters, paginationResult.results));
        break;

      case DataPageBlocEventType.changeFilterName:
        filter.name = (event as DataPageBlocEvent<String>).data;
        emit(DataPageBlocAction<dynamic>(DataPageBlocActionType.loagingActionStart, {}));
        await localRepository.setFilter(filter);
        await callService();
        emit(DataPageBlocAction<List<Character>>(DataPageBlocActionType.newCharacters, paginationResult.results));
        break;

      case DataPageBlocEventType.changeFilterStatus:
        filter.status = (event as DataPageBlocEvent<PaginationFilterStatus>).data;
        emit(DataPageBlocAction<dynamic>(DataPageBlocActionType.loagingActionStart, {}));
        await localRepository.setFilter(filter);
        await callService();
        emit(DataPageBlocAction<List<Character>>(DataPageBlocActionType.newCharacters, paginationResult.results));
        break;

      case DataPageBlocEventType.loadMoreCharacters:
        if (paginationResult.info!.next != null && paginationResult.info!.next! > 0) {
          emit(DataPageBlocAction<dynamic>(DataPageBlocActionType.loagingMoreActionStart, {}));
          await callMore();
          emit(DataPageBlocAction<List<Character>>(DataPageBlocActionType.newMoreCharacters,paginationResult.results));
        }
        break;
    }
  }

  callService() async {
    var _paginationResult = await serviceRepository.getCharacters(0,filter);
    paginationResult = _paginationResult;
  }

  callMore() async {
    var _paginationResult =
          await serviceRepository.getCharacters(paginationResult.info!.next!,filter);
    paginationResult.info = _paginationResult.info;
    paginationResult.results = _paginationResult.results;
  }
}
