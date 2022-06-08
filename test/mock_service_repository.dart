import 'package:rickandmorty/shared/models/index.dart';
import 'package:rickandmorty/shared/repository/index.dart';
import 'mock_static_data.dart';


class MockServiceRepository implements ServiceRepository {
  @override
  Future<PaginationModel> getCharacters(PaginationFilter filter) async =>
    Future.delayed(const Duration(seconds: 2), () => 
      PaginationModel(
        info: const PaginationModelInfo(),
        results: [...MockStaticData.mockCharacters()]
      ));

  @override
  Future<PaginationModel> getNextCharacters(String uri) =>
    Future.delayed(const Duration(seconds: 2), () => 
      PaginationModel(
        info: const PaginationModelInfo(),
        results: [...MockStaticData.mockCharacters()]
      ));


}