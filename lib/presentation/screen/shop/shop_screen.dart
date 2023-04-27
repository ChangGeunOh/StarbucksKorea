import 'package:flutter/material.dart';
import 'package:starbucks/domain/bloc/bloc_scaffold.dart';
import 'package:starbucks/presentation/components/screen_title.dart';
import 'package:starbucks/presentation/screen/shop/bloc/shop_bloc.dart';

import 'bloc/shop_state.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocScaffold(
      create: (context) => ShopBloc(context, ShopState()),
      builder: (context, bloc, state) {
        return ScreenTitle(title: 'shop screen');
      },
    );
  }
}
