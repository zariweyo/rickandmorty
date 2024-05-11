import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/infrastructure/cache_repository.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/infrastructure/config_repository.dart';
import 'package:rickandmorty/infrastructure/service_repository.dart';

class StartApp {
  static Future<void> registers(BuildContext context, ENV enviroment) async {
    if (!GetIt.I.isRegistered(instance: CacheRepository)) {
      GetIt.I.registerSingleton<CacheRepository>(CacheRepository());
    }
    if (!GetIt.I.isRegistered(instance: ConfigRepository)) {
      GetIt.I.registerSingleton<ConfigRepository>(
          ConfigRepository(enviroment: enviroment));
    }
    if (!GetIt.I.isRegistered(instance: http.Client)) {
      GetIt.I.registerSingleton<http.Client>(http.Client());
    }
    if (!GetIt.I.isRegistered(instance: ServiceRepository)) {
      GetIt.I.registerSingleton<ServiceRepository>(ServiceRepository());
    }
  }
}
