import 'package:flutter/material.dart';
import 'package:rickandmorty/data_page/bloc_controller/index.dart';
import 'package:rickandmorty/data_page/models/index.dart';
import 'package:bloc_test/bloc_test.dart';

import 'mock_service_repository.dart';

class MockDataPageBloc extends MockBloc<DataPageBlocEvent, DataPageBlocAction> implements DataPageBloc {
  MockDataPageBloc(DataPageBlocAction<BuildContext> initialState){
    context = initialState.data;
    on<DataPageBlocEvent>(mapEventToState);
    serviceRepository = MockServiceRepository();
  }
}