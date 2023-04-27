import 'package:flutter/material.dart';
import 'package:starbucks/common/const/color.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/bloc_scaffold.dart';
import 'package:starbucks/presentation/components/circle_loading.dart';
import 'package:starbucks/presentation/screen/splash/bloc/splash_bloc.dart';
import 'package:starbucks/presentation/screen/splash/bloc/splash_event.dart';

import 'bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  static String get routeName => 'splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocScaffold<SplashBloc, SplashState>(
      backgroundColor: primaryColor,
      create: (context) => SplashBloc(context, SplashState()),
      builder: (context, bloc, state) {
        // bloc.add(BlocEvent(SplashEventType.init));
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/img_starbucks_logo.png',
                width: 150,
                height: 150,
              ),
              const CircleLoading(),
            ],
          ),
        );
      },
    );
  }
}


