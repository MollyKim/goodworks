import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ThemeColor on BuildContext {
  Color? dynamicColor({Color? light, Color? dark}) {
    if ((MediaQuery.of(this).platformBrightness == Brightness.light)) {
      return light;
    } else {
      return light;
    }
  }

  String? dynamicString({String? light, String? dark}) {
    if ((MediaQuery.of(this).platformBrightness == Brightness.light)) {
      return light;
    } else {
      return light; // return dark;
    }
  }

  TextStyle get textStyleCustom => TextStyle(
    fontSize: 20, fontWeight: FontWeight.normal,
    color: forest100, fontFamily: "AppleSDGothicNeo",
    height: 1.19,
  );

  /// the white background
  Color? get bgWhite => dynamicColor(light: Colors.red, dark: Colors.green);

  Color? get uiBackground =>
      dynamicColor(light: const Color(0xFFFFFFFF), dark: const Color(0xFF171717));

  Color? get primary =>
      dynamicColor(light: const Color(0xFFFFEB60), dark: const Color(0xFFFEF08C));

  Color? get danger =>
      dynamicColor(light: const Color(0xFFDF1D1D), dark: const Color(0xFFF5511D));

  Color? get gray02 =>
      dynamicColor(light: const Color(0xFF929292), dark: const Color(0xFF6F6F6F));

  Color? get gray04 =>
      dynamicColor(light: const Color(0xFF7C7C7C), dark: const Color(0xFF7C7C7C));

  Color? get success =>
      dynamicColor(light: const Color(0xFF0073CB), dark: const Color(0xFF6AB6F0));

  Color? get error =>
      dynamicColor(light: const Color(0xFFF05C2E), dark: const Color(0xFFFF784D));

  Color? get forest100 =>
      dynamicColor(light: const Color(0xFF1B442B), dark: const Color(0xFFFFFFFF));

  Color? get forest90 =>
      dynamicColor(light: const Color(0xFF245D3A), dark: const Color(0xFFFFFFFF));

  Color? get forest80 =>
      dynamicColor(light: const Color(0xFF2E9067), dark: const Color(0xFFFFFFFF));

  Color? get forest70 =>
      dynamicColor(light: const Color(0xFF629777), dark: const Color(0xFFFFFFFF));

  Color? get forest60 =>
      dynamicColor(light: const Color(0xFF90C79C), dark: const Color(0xFFFFFFFF));

  Color? get forest50 =>
      dynamicColor(light: const Color(0xFFCDE3D6), dark: const Color(0xFFFFFFFF));
}
