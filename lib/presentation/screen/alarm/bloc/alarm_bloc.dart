import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/custom_bloc.dart';
import 'package:starbucks/presentation/screen/alarm/bloc/alarm_event.dart';
import 'package:starbucks/presentation/screen/alarm/bloc/alarm_state.dart';

class AlarmBloc extends CustomBloc<BlocEvent<AlarmEventType>, AlarmState> {
  AlarmBloc(super.context, super.initialState);

  @override
  FutureOr<void> onBlocEvent(BlocEvent<AlarmEventType> event, Emitter<AlarmState> emit) {
    // TODO: implement onBlocEvent
    switch(event.type) {

      case AlarmEventType.init:
        // TODO: Handle this case.
        break;
    }
  }
}