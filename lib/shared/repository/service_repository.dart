import 'dart:async';
import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/shared/models/index.dart';

abstract class Repository<T> {
  Future<PaginationModel> getCharacters     (PaginationFilter filter);
  Future<PaginationModel> getNextCharacters (String           uri);
}

class ServiceRepository extends Repository<Character> {
  static const  String      baseUrl     = "https://rickandmortyapi.com/api";
  final         http.Client _clientHttp = GetIt.I.get<http.Client>();

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

    var response  =   await _clientHttp.get(Uri.parse(uri));
    if (response.body == "") {
      return PaginationModel();
    }
    return PaginationModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<PaginationModel> getNextCharacters(String uri) async {
    var response = await _clientHttp.get(Uri.parse(uri));
    if (response.body == "") {
      return PaginationModel();
    }
    return PaginationModel.fromJson(jsonDecode(response.body));
  }
}
