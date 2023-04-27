import 'package:flutter/material.dart';
import 'package:starbucks/presentation/components/screen_title.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTitle(title: 'order screen');
  }
}
