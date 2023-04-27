import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:starbucks/common/const/database.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/custom_bloc.dart';
import 'package:starbucks/domain/model/food_data.dart';
import 'package:starbucks/domain/model/item_data.dart';
import 'package:starbucks/presentation/screen/food/bloc/food_event.dart';

import 'food_state.dart';

class FoodBloc extends CustomBloc<BlocEvent<FoodEventType>, FoodState> {
  final ItemData itemData;

  FoodBloc(super.context, super.initialState, this.itemData) {
    add(BlocEvent(FoodEventType.init, extra: itemData));
  }

  @override
  FutureOr<void> onBlocEvent(
      BlocEvent<FoodEventType> event, Emitter<FoodState> emit) async {
    switch (event.type) {
      case FoodEventType.init:
        final itemData = event.extra as ItemData;
        final foodData = await repository.getFoodItem(itemData.id);
        emit(state.copyWith(foodData: foodData));
        break;
      case FoodEventType.order:
        // TODO: Handle this case.
        break;
      case FoodEventType.close:
        emit(state.copyWith(sheetState: SheetState.none));
        break;
      case FoodEventType.nurition:
        emit(state.copyWith(sheetState: SheetState.open));
        break;
    }
  }
}
