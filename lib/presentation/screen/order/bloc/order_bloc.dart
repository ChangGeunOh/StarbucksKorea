import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/custom_bloc.dart';
import 'package:starbucks/presentation/screen/order/bloc/order_event.dart';
import 'package:starbucks/presentation/screen/order/bloc/order_state.dart';

class OrderBloc extends CustomBloc<BlocEvent<OrderEventType>, OrderState> {
  OrderBloc(super.context, super.initialState);

  @override
  FutureOr<void> onBlocEvent(BlocEvent<OrderEventType> event, Emitter<OrderState> emit) {
    switch(event.type) {

      case OrderEventType.init:
        // TODO: Handle this case.
        break;
    }
  }

}