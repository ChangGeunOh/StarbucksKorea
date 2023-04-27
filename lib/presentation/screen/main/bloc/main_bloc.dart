import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/custom_bloc.dart';
import 'package:starbucks/presentation/screen/main/bloc/main_event.dart';
import 'package:starbucks/presentation/screen/main/bloc/main_state.dart';

class MainBloc extends CustomBloc<BlocEvent<MainEventType>, MainState>{

  MainBloc(super.context, super.initialState);

  @override
  FutureOr<void> onBlocEvent(BlocEvent<MainEventType> event, Emitter<MainState> emit) {
      emit(state.copyWith(index: event.extra as int));
  }

}