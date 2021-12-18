import 'package:flutter/material.dart';
import 'package:practice/layouts/default_layout.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          titleSpacing: 0,
          // backgroundColor: Color(0xff1a442b),
          title: Text(
            "설정",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "AppleSDGothicNeo",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Container());
  }
}
