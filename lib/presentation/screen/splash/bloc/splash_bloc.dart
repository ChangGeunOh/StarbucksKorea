import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/custom_bloc.dart';
import 'package:starbucks/presentation/screen/main/main_screen.dart';
import 'package:starbucks/presentation/screen/splash/bloc/splash_event.dart';
import 'package:starbucks/presentation/screen/splash/bloc/splash_state.dart';

class SplashBloc extends CustomBloc<BlocEvent<SplashEventType>, SplashState> {
  SplashBloc(super.context, super.initialState) {
    add(BlocEvent(SplashEventType.init));
  }

  @override
  void onBlocEvent(
      BlocEvent<SplashEventType> event, Emitter<SplashState> emit) {
    Future.delayed(const Duration(milliseconds: 1000)).then(
      (value) => context.goNamed(MainScreen.routeName),
    );
  }
}
