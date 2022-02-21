import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class BaseToast {

  final FToast fToast = FToast();
  final String text;

  BaseToast({required this.text});

  void showToast(BuildContext context){
    String replacedText ="";
    replacedText = text.replaceAll("\\n", "\n");
    fToast.init(context);
    fToast.showToast(
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xcc000000),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 248,
              child: Text(
                replacedText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "AppleSDGothicNeo",
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}