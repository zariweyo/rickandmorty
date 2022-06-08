import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/testing.dart';
import 'package:rickandmorty/shared/repository/index.dart';
import 'package:http/http.dart' as http;
import 'mock_service_repository.dart';
import 'mock_static_data.dart';

class MockStartApp {
  static Future<http.Response> _requestHandler(http.Request request) async {
    if (request.url
        .toString()
        .startsWith("https://rickandmortyapi.com/api/character")) {
      return MockStaticData.characterListData200();
    }

    return http.Response('Not Found', 404);
  }

  static Future<void> registers(BuildContext context) async {
    GetIt.I.registerSingleton<http.Client>(MockClient(_requestHandler));
    GetIt.I.registerSingleton<ServiceRepository>(MockServiceRepository());
  }
}
