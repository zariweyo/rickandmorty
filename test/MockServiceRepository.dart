import 'package:rickandmorty/shared/models/index.dart';
import 'package:rickandmorty/shared/repository/index.dart';
import 'MockStaticData.dart';


class MockServiceRepository implements ServiceRepository {
  @override
  Future<PaginationModel> getCharacters(PaginationFilter filter) async =>
    Future.delayed(Duration(seconds: 2), () => 
      PaginationModel(
        info: PaginationModelInfo(),
        results: [...MockStaticData.mockCharacters()]
      ));

  @override
  Future<PaginationModel> getNextCharacters(String uri) =>
    Future.delayed(Duration(seconds: 2), () => 
      PaginationModel(
        info: PaginationModelInfo(),
        results: [...MockStaticData.mockCharacters()]
      ));


}