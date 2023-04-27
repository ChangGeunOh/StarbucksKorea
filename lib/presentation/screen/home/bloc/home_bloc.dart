import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/custom_bloc.dart';
import 'package:starbucks/domain/model/item_data.dart';
import 'package:starbucks/presentation/screen/food/food_screen.dart';
import 'package:starbucks/presentation/screen/home/bloc/home_event.dart';
import 'package:starbucks/presentation/screen/home/bloc/home_state.dart';
import 'package:starbucks/presentation/screen/webview/webview_screen.dart';

class HomeBloc extends CustomBloc<BlocEvent<HomeEventType>, HomeState> {
  final ScrollController controller = ScrollController();
  double offset = 0;

  HomeBloc(super.context, super.initialState) {
    _init();
    add(BlocEvent(HomeEventType.init));
  }

  void _init() {
    controller.addListener(() {
      if (offset > controller.offset || controller.offset < 30) {
        add(BlocEvent(HomeEventType.fab, extra: false));
      } else {
        add(BlocEvent(HomeEventType.fab, extra: true));
      }
      offset = controller.offset;
    });
  }

  @override
  FutureOr<void> onBlocEvent(
      BlocEvent<HomeEventType> event, Emitter<HomeState> emit) async {
    switch (event.type) {
      case HomeEventType.init:
        final program = await repository.getProgram();
        emit(state.copyWith(program: program));
        break;
      case HomeEventType.login:
        // TODO: Handle this case.
        break;
      case HomeEventType.sign:
        // TODO: Handle this case.
        break;
      case HomeEventType.delivery:
        // TODO: Handle this case.
        break;
      case HomeEventType.fab:
        print(event.extra);
        emit(state.copyWith(isFab: event.extra as bool));
        break;
      case HomeEventType.webview:
        context.pushNamed(WebViewScreen.routeName, extra: event.extra);
        break;
      case HomeEventType.item:
        processItem(event.extra as ItemData);
        break;
    }
  }

  void processItem(ItemData itemData) {
    print(itemData.type.toString());

    switch (itemData.type) {
      case ItemType.news:
        context.pushNamed(WebViewScreen.routeName, extra: itemData.site);
        break;
      case ItemType.food:
        context.pushNamed(FoodScreen.routeName, extra: itemData);
        break;
      case ItemType.store:
        // TODO: Handle this case.
        break;
      case ItemType.story:
        // TODO: Handle this case.
        break;
      case ItemType.title:
        // TODO: Handle this case.
        break;
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
