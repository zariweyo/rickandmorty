enum DataPageBlocEventType {
  firstLoadData,
  continueEvent,
  backToTitleEvent,
  changeFilterName,
  changeFilterStatus,
  changeFilterGender,
  loadMoreCharacters,
}

class DataPageBlocEvent<T> {
  final DataPageBlocEventType type;
  final T data;

  DataPageBlocEvent(this.type, this.data);
}
