import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/custom_bloc.dart';
import 'package:starbucks/presentation/screen/shop/bloc/shop_event.dart';

import 'shop_state.dart';

class ShopBloc extends CustomBloc<BlocEvent<ShopEventType>, ShopState> {
  ShopBloc(super.context, super.initialState);

  @override
  FutureOr<void> onBlocEvent(BlocEvent<ShopEventType> event, Emitter<ShopState> emit) {
    switch(event.type) {

      case ShopEventType.init:
        // TODO: Handle this case.
        break;
    }
  }

}