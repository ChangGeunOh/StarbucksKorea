import 'package:flutter/material.dart';
import 'package:starbucks/common/const/color.dart';

class LoginCard extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onSign;

  const LoginCard({
    Key? key,
    required this.onLogin,
    required this.onSign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 33.0, left: 33.0, bottom: 33.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '스타벅스 리워드 회원\n신규가입 첫 구매 시,\n무료음료 혜택을 드려요!',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 21),
                    Row(
                      children: [
                        FilledButton(
                          onPressed: onSign,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor)),
                          child: const Text(
                            '회원가입',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        OutlinedButton(
                          onPressed: onLogin,
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            side: const BorderSide(color: primaryColor),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                            child: Text(
                              '로그인',
                              style: TextStyle(
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: Image.asset('assets/images/img_login_cup.png',
                    width: 100, height: 114),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
