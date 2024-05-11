import 'package:flutter/material.dart';
import 'package:rickandmorty/application/list/data_page_bloc.dart';
import 'package:rickandmorty/application/list/data_page_bloc_action.dart';
import 'package:rickandmorty/application/list/data_page_bloc_event.dart';
import 'package:bloc_test/bloc_test.dart';

import 'mock_service_repository.dart';

class MockDataPageBloc extends MockBloc<DataPageBlocEvent, DataPageBlocAction>
    implements DataPageBloc {
  MockDataPageBloc(DataPageBlocAction<BuildContext> initialState) {
    context = initialState.data;
    on<DataPageBlocEvent>(mapEventToState);
    serviceRepository = MockServiceRepository();
  }
}
