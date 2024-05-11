import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/domain/models/list/character_model.dart';
import 'package:rickandmorty/domain/models/list/pagination_filter.dart';
import 'package:rickandmorty/domain/models/list/pagination_model.dart';
import 'package:rickandmorty/infrastructure/cache_repository.dart';
import 'package:graphql/client.dart';

abstract class Repository<T> {
  Future<PaginationModel> getCharacters(int page, PaginationFilter filter);
}

class ServiceRepository extends Repository<Character> {
  static const String baseUrl = "https://rickandmortyapi.com/graphql";
  final CacheRepository _cacheRepository = GetIt.I.get<CacheRepository>();
  late GraphQLClient _graphqlClient;

  ServiceRepository() {
    final HttpLink httpLink = HttpLink(
      baseUrl,
    );

    _graphqlClient = GraphQLClient(cache: GraphQLCache(), link: httpLink);
  }

  @override
  Future<PaginationModel> getCharacters(
      int page, PaginationFilter filter) async {
    String cacheSavedKey = page.toString() +
        "|" +
        filter.name +
        "|" +
        filter.gender.name +
        "|" +
        filter.status.name;

    PaginationModel? cachedPaginationModel =
        _cacheRepository.getQueryCache(cacheSavedKey);
    if (cachedPaginationModel != null) {
      return cachedPaginationModel;
    }

    String queryString = r'''
      query PaginationModel($page: Int!, $name: String!, $status: String!, $gender: String!){
        characters(page: $page, filter: { 
          name: $name,
          status: $status,
          gender: $gender
        }) {
          info {
            count,prev,next,pages
          }
          results {
            id
            name
            status
            species
            type
            gender
            image
            origin {
              name
            }
            created
            episode {
              id,
              air_date,
              name,
            }
            location {
              name
            }
          }
        }
      }
    ''';

    QueryResult<PaginationModel> dataResult =
        await _graphqlClient.query<PaginationModel>(QueryOptions(
      document: gql(queryString),
      variables: <String, dynamic>{
        'gender': filter.gender != PaginationFilterGender.all
            ? filter.gender.name
            : "",
        'status': filter.status != PaginationFilterStatus.none
            ? filter.status.name
            : "",
        'name': filter.name,
        'page': page,
      },
    ));

    PaginationModel paginationModel =
        PaginationModel.fromJson(dataResult.data!['characters']);

    _cacheRepository.saveQueryCache(cacheSavedKey, paginationModel);

    return paginationModel;
  }
}
