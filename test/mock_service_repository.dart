import 'package:rickandmorty/domain/models/list/pagination_filter.dart';
import 'package:rickandmorty/domain/models/list/pagination_model.dart';
import 'package:rickandmorty/domain/models/list/pagination_model_info.dart';
import 'package:rickandmorty/infrastructure/service_repository.dart';
import 'mock_static_data.dart';

class MockServiceRepository implements ServiceRepository {
  @override
  Future<PaginationModel> getCharacters(
          int page, PaginationFilter filter) async =>
      Future.delayed(
          const Duration(seconds: 2),
          () => PaginationModel(
              info: PaginationModelInfo(),
              results: [...MockStaticData.mockCharacters()]));
}
