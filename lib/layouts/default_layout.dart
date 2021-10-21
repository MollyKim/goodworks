import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;

  DefaultLayout({
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      // resizeToAvoidBottomInset : false,
      body: SafeArea(
        top: true,
        bottom: true,
        child: body,
      ),
    );
  }
}