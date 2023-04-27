import 'package:flutter/material.dart';

class CircleLoading extends StatefulWidget {

  const CircleLoading({Key? key}) : super(key: key);

  @override
  State<CircleLoading> createState() => _CircleLoadingState();
}

class _CircleLoadingState extends State<CircleLoading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat();
    return RotationTransition(
      turns: CurvedAnimation(parent: _controller, curve: Curves.linear),
      child: Image.asset(
        'assets/images/img_loading.png',
        width: 38,
        height: 38,
      ),
    );
  }
}