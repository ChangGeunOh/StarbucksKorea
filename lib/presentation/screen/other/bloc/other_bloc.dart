import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/custom_bloc.dart';
import 'package:starbucks/presentation/screen/other/bloc/other_event.dart';
import 'package:starbucks/presentation/screen/other/bloc/other_state.dart';

class OtherBloc extends CustomBloc<BlocEvent<OtherEventType>, OtherState> {
  OtherBloc(super.context, super.initialState);

  @override
  FutureOr<void> onBlocEvent(BlocEvent<OtherEventType> event, Emitter<OtherState> emit) {
    // TODO: implement onBlocEvent
    throw UnimplementedError();
  }

}