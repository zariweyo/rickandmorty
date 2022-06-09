import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/shared/repository/index.dart';
import 'package:http/http.dart' as http;

class StartApp {
  static Future<void> registers(BuildContext context,ENV enviroment) async {
    GetIt.I.registerSingleton<ConfigRepository>(ConfigRepository(enviroment: enviroment));
    GetIt.I.registerSingleton<http.Client>(http.Client());
    GetIt.I.registerSingleton<ServiceRepository>(ServiceRepository());
  }
}
