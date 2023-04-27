import 'package:flutter/cupertino.dart';
import 'package:starbucks/domain/model/item_data.dart';

class HomeState {
  final bool isFab;
  final List<Object> program;

  HomeState({bool? isFab, List<Object>? program})
      : isFab = isFab ?? false,
        program = program ?? List.empty();

  HomeState copyWith({
    bool? isFab,
    List<Object>? program,
  }) {
    // print(this.program.toString());
    return HomeState(
      isFab: isFab ?? this.isFab,
      program: program ?? this.program,
    );
  }
}
