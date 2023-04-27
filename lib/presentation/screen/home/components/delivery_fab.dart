import 'package:flutter/material.dart';
import 'package:starbucks/common/const/color.dart';

class DeliveryFab extends StatelessWidget {
  final bool isExtended;
  final VoidCallback onClick;

  const DeliveryFab({
    Key? key,
    required this.isExtended,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = isExtended
        ? Image.asset(
      'assets/icons/ic_delivers.png',
      width: 40,
      height: 40,
    )
        : Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Image.asset(
        'assets/icons/ic_delivers.png',
        width: 40,
        height: 40,
      ),
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
      width: isExtended ? 150 : 50,
      height: 50,
      child: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: onClick,
        icon: icon,
        label: Center(
          child: isExtended
              ? const Text(
            "Delivers",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
            ),
          )
              : null,
        ),
      ),
    );
  }
}