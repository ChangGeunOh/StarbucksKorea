class MainState {
  final int index;

  MainState({
    int? index,
  }) : index = index ?? 0;

  MainState copyWith({int? index}) {
    return MainState(index: index ?? this.index);
  }
}
