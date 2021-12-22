import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2d9067),
      body: Center(
        child: SvgPicture.asset(
          'assets/ic/ic_splash.svg',
          //color: Colors.white,
        ),
      ),
    );
  }
}
