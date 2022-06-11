import 'dart:async';
import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/shared/models/index.dart';
import 'package:rickandmorty/shared/repository/cache_repository.dart';

abstract class Repository<T> {
  Future<PaginationModel> getCharacters     (PaginationFilter filter);
  Future<PaginationModel> getNextCharacters (String           uri);
}

class ServiceRepository extends Repository<Character> {
  static const  String          baseUrl           = "https://rickandmortyapi.com/api";
  final         http.Client     _clientHttp       = GetIt.I.get<http.Client>();
  final         CacheRepository _cacheRepository  = GetIt.I.get<CacheRepository>();

  @override
  Future<PaginationModel> getCharacters(PaginationFilter filter) async {
    var uri = '$baseUrl/character?';

    if (filter.name != "") {
      uri += '&name=' + filter.name;
    }

    if (filter.status != PaginationFilterStatus.none) {
      uri += '&status=' + filter.status.name;
    }

    if (filter.gender != PaginationFilterGender.all) {
      uri += '&gender=' + filter.gender.name;
    }

    PaginationModel? cachePaginationModel = _cacheRepository.getQueryCache(uri);
    if(cachePaginationModel!=null){
      return cachePaginationModel;
    }

    var response  =   await _clientHttp.get(Uri.parse(uri));
    if (response.body == "") {
      return PaginationModel();
    }

    PaginationModel result = PaginationModel.fromJson(jsonDecode(response.body));
    _cacheRepository.saveQueryCache(uri, result);

    return result;
  }

  @override
  Future<PaginationModel> getNextCharacters(String uri) async {
    PaginationModel? cachePaginationModel = _cacheRepository.getQueryCache(uri);
    if(cachePaginationModel!=null){
      return cachePaginationModel;
    }

    var response = await _clientHttp.get(Uri.parse(uri));
    if (response.body == "") {
      return PaginationModel();
    }

    PaginationModel result = PaginationModel.fromJson(jsonDecode(response.body));
    _cacheRepository.saveQueryCache(uri, result);

    return result;
  }
}
