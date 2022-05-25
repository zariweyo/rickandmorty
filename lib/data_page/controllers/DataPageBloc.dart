import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/shared/models/PaginationModel.dart';
import 'package:rickandmorty/shared/repository/LocalRepository.dart';
import 'package:rickandmorty/shared/repository/ServiceRepository.dart';

enum DataPageBlocEventType {
  continueEvent,
  backToTitleEvent,
  changeFilterName,
  changeFilterStatus,
  changeFilterGender,
  loadMoreCharacters,
}

enum DataPageBlocActionType {
  initial,
  showHome,
  showLists,
  initialFilter,
  newCharacters,
  newMoreCharacters,
  loagingActionStart,
  loagingMoreActionStart
}

class DataPageBlocEvent {
  final DataPageBlocEventType type;
  final dynamic data;
  DataPageBlocEvent(this.type, this.data);
}

class DataPageBlocAction {
  final DataPageBlocActionType type;
  final dynamic data;
  DataPageBlocAction(this.type, this.data);
}


class DataPageBloc extends Bloc<DataPageBlocEvent, DataPageBlocAction> {

  late BuildContext context;

  late ServiceRepository serviceRepository;
  late LocalRepository localRepository;

  PaginationModel paginationResult = PaginationModel();
  PaginationFilter filter = PaginationFilter();

  DataPageBloc(DataPageBlocAction initialState) : super(initialState){
      context = initialState.data;

      on<DataPageBlocEvent>(mapEventToState);

      serviceRepository = ServiceRepository();
      localRepository = LocalRepository();

      localRepository.onReady().then((isReady){
        if(isReady){
          filter = localRepository.getFilter();
        }
      });
  }

  Future<void> mapEventToState(DataPageBlocEvent event, Emitter<DataPageBlocAction> emit) async {
    switch (event.type) {
      case DataPageBlocEventType.continueEvent:
        emit(DataPageBlocAction(DataPageBlocActionType.showLists, {}));
        await callService();
        emit(DataPageBlocAction(DataPageBlocActionType.initialFilter, filter));
        emit(DataPageBlocAction(DataPageBlocActionType.newCharacters, paginationResult.results));
        break;
      case DataPageBlocEventType.backToTitleEvent:
        emit(DataPageBlocAction(DataPageBlocActionType.showHome, {}));
        break;
      case DataPageBlocEventType.changeFilterGender:
        filter.gender = event.data as PaginationFilterGender;
        emit(DataPageBlocAction(DataPageBlocActionType.loagingActionStart, {}));
        await localRepository.setFilter(filter);
        await callService();
        emit(DataPageBlocAction(DataPageBlocActionType.newCharacters, paginationResult.results));
        break;
      case DataPageBlocEventType.changeFilterName:
        filter.name = event.data as String;
        emit(DataPageBlocAction(DataPageBlocActionType.loagingActionStart, {}));
        await localRepository.setFilter(filter);
        await callService();
        emit(DataPageBlocAction(DataPageBlocActionType.newCharacters, paginationResult.results));
        break;
      case DataPageBlocEventType.changeFilterStatus:
        filter.status = event.data as PaginationFilterStatus;
        emit(DataPageBlocAction(DataPageBlocActionType.loagingActionStart, {}));
        await localRepository.setFilter(filter);
        await callService();
        emit(DataPageBlocAction(DataPageBlocActionType.newCharacters, paginationResult.results));
        break;
      case DataPageBlocEventType.loadMoreCharacters:
        if(paginationResult.info.next != ""){
          emit(DataPageBlocAction(DataPageBlocActionType.loagingMoreActionStart, {}));
          await callMore();
          emit(DataPageBlocAction(DataPageBlocActionType.newMoreCharacters, paginationResult.results));
        }
        break;
    }
  }

  callService() async{
    var _paginationResult  = await serviceRepository.getCharacters(filter);
    paginationResult = _paginationResult;
  }

  callMore() async{
    if(paginationResult.info.next != ""){
      var _paginationResult  = await serviceRepository.getNextCharacters(paginationResult.info.next);
      paginationResult.info = _paginationResult.info;
      paginationResult.results = _paginationResult.results;
    }
  }


  
}