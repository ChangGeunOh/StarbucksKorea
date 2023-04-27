import 'package:flutter/material.dart';
import 'package:starbucks/common/const/color.dart';
import 'package:starbucks/domain/bloc/bloc_event.dart';
import 'package:starbucks/domain/bloc/bloc_layout.dart';
import 'package:starbucks/presentation/screen/home/home_screen.dart';
import 'package:starbucks/presentation/screen/main/bloc/main_bloc.dart';
import 'package:starbucks/presentation/screen/main/bloc/main_event.dart';
import 'package:starbucks/presentation/screen/main/bloc/main_state.dart';
import 'package:starbucks/presentation/screen/order/order_screen.dart';
import 'package:starbucks/presentation/screen/other/other_screen.dart';
import 'package:starbucks/presentation/screen/pay/pay_screen.dart';
import 'package:starbucks/presentation/screen/shop/shop_screen.dart';

class MainScreen extends StatelessWidget {
  static String get routeName => 'main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocLayout<MainBloc, MainState>(
      create: (context) => MainBloc(context, MainState()),
      builder: (context, bloc, state) {
        print('state>${state.index}');
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 18,
            currentIndex: state.index,
            showSelectedLabels: true,
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.black26,
            showUnselectedLabels: true,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: (index) {
              bloc.add(BlocEvent(MainEventType.route, extra: index));
            },
            items: [
              getBarItem('assets/icons/ic_home.png', 'Home'),
              getBarItem('assets/icons/ic_pay.png', 'Pay'),
              getBarItem('assets/icons/ic_order.png', 'Order'),
              getBarItem('assets/icons/ic_shop.png', 'Shop'),
              getBarItem('assets/icons/ic_other.png', 'Other'),
            ],
          ),
          body: renderBody(state.index),
        );
      },
    );
  }

  BottomNavigationBarItem getBarItem(String image, String label) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        image,
        width: 32,
        height: 32,
      ),
      activeIcon: Image.asset(
        image,
        width: 32,
        height: 32,
        color: primaryColor,
      ),
      label: label,
    );
  }

  Widget renderBody(int index) {
    switch (index) {
      case 1 :
        return const PayScreen();
      case 2 :
        return const OrderScreen();
      case 3 :
        return const ShopScreen();
      case 4 :
        return const OtherScreen();
      default:
        return const HomeScreen();
    }
  }
}
