import 'package:flutter/material.dart';

class GreetingMessage extends StatelessWidget {
  const GreetingMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 40, left: 20),
        child: Text(
          '안녕하세요,\n스타벅스입니다.',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 24, height: 1.5),
        ),
      ),
    );
  }
}
