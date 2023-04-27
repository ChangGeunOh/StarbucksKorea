import 'package:flutter/material.dart';

class WhatsNewsBell extends StatelessWidget {
  final VoidCallback onClickBell;

  const WhatsNewsBell({
    Key? key,
    required this.onClickBell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/icons/ic_email.png',
                height: 32,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'What\'s New',
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                  color: Colors.black),
            ),
            const Spacer(),
            InkWell(
              onTap: onClickBell,
              child: Image.asset(
                'assets/icons/ic_bell.png',
                height: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
