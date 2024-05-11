enum DataPageBlocActionType {
  initial,
  showHome,
  showLists,
  initialFilter,
  newCharacters,
  newMoreCharacters,
  loagingActionStart,
  loagingMoreActionStart
}

class DataPageBlocAction<T> {
  final DataPageBlocActionType type;
  final T data;

  DataPageBlocAction(this.type, this.data);
}
