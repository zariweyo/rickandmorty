import 'dart:async';
import 'dart:convert';
import 'package:rickandmorty/shared/models/DataModel.dart';
import 'package:http/http.dart' as http;

import '../models/PaginationModel.dart';

abstract class Repository<T> {
  Future<PaginationModel> getCharacters(PaginationFilter filter);
  Future<PaginationModel> getNextCharacters(String uri);
}

class ServiceRepository extends Repository<Character> {
  static const String BASEURL = "https://rickandmortyapi.com/api";

  @override
  Future<PaginationModel> getCharacters(PaginationFilter filter) async {
    var uri = '$BASEURL/character?';

    if(filter.name != ""){
      uri += '&name=' + filter.name;
    }
    
    if(filter.status != PaginationFilterStatus.none){
      uri += '&status=' + filter.status.name;
    }
    
    if(filter.gender != PaginationFilterGender.all){
      uri += '&gender=' + filter.gender.name;
    }
    
    var response = await http.get(Uri.parse(uri));
    if(response.body == ""){
      return PaginationModel();
    }
    return PaginationModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<PaginationModel> getNextCharacters(String uri) async {    
    var response = await http.get(Uri.parse(uri));
    if(response.body == ""){
      return PaginationModel();
    }
    return PaginationModel.fromJson(jsonDecode(response.body));
  }

}