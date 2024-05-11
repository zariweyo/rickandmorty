import 'package:localstorage/localstorage.dart';
import 'package:rickandmorty/domain/models/list/pagination_filter.dart';

class LocalRepository {
  static const String localStorageKey = "local_storage_key";
  static const String filterKey = "local_filters";

  late LocalStorage _storage;

  LocalRepository() {
    _storage = LocalStorage(localStorageKey);
  }

  Future<bool> onReady() {
    return _storage.ready;
  }

  PaginationFilter getFilter() {
    var dataFilter = _storage.getItem(filterKey);

    if (dataFilter != null) {
      return PaginationFilter.fromJson(dataFilter);
    }

    return PaginationFilter();
  }

  Future<void> setFilter(PaginationFilter filter) async {
    await _storage.setItem(filterKey, filter.toMap());
  }
}
