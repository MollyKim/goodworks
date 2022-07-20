import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 4,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffcdcdcd), Color(0xffeeeeee)],
            ),
          ),
        ),
      ),
    );
  }
}
