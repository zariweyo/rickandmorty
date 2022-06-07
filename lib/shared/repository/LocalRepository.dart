import 'package:localstorage/localstorage.dart';
import 'package:rickandmorty/shared/models/index.dart';

class LocalRepository {
  static const String LOCAL_STORAGE_KEY = "local_storage_key";
  static const String FILTER_KEY = "local_filters";

  late LocalStorage _storage;

  LocalRepository() {
    _storage = LocalStorage(LOCAL_STORAGE_KEY);
  }

  Future<bool> onReady() {
    return _storage.ready;
  }

  PaginationFilter getFilter() {
    var dataFilter = _storage.getItem(FILTER_KEY);
    if (dataFilter != null) {
      return PaginationFilter.fromJson(dataFilter);
    }

    return PaginationFilter();
  }

  Future<void> setFilter(PaginationFilter filter) async {
    await _storage.setItem(FILTER_KEY, filter.toMap());
  }
}
