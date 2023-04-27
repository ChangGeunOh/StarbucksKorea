import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/custom_bloc.dart';
import 'package:starbucks/presentation/screen/pay/bloc/pay_event.dart';

import 'pay_state.dart';

class PayBloc extends CustomBloc<BlocEvent<PayEventType>, PayState> {
  PayBloc(super.context, super.initialState);

  @override
  FutureOr<void> onBlocEvent(BlocEvent<PayEventType> event, Emitter<PayState> emit) {
    // TODO: implement onBlocEvent
    throw UnimplementedError();
  }

}