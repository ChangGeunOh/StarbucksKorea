import 'package:flutter/material.dart';
import 'package:starbucks/domain/bloc/bloc_scaffold.dart';
import 'package:starbucks/presentation/components/screen_title.dart';
import 'package:starbucks/presentation/screen/pay/bloc/pay_bloc.dart';
import 'package:starbucks/presentation/screen/pay/bloc/pay_state.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocScaffold(create: (context) => PayBloc(context, PayState()), builder: (context, bloc, state) {
      return ScreenTitle(title: 'pay screen');
    },);
  }
}
