import 'package:flutter/material.dart';
import 'package:starbucks/domain/bloc/bloc_scaffold.dart';
import 'package:starbucks/presentation/components/screen_title.dart';
import 'package:starbucks/presentation/screen/other/bloc/other_bloc.dart';

import 'bloc/other_state.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocScaffold(
      create: (context) => OtherBloc(context, OtherState()),
      builder: (context, bloc, state) {
        return ScreenTitle(title: 'Other screen');
      },
    );
  }
}
