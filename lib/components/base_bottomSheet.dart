import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/components/baseToast.dart';
import 'package:share/share.dart';

Widget BaseBottomSheet(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      GestureDetector(
        onTap: (){
          Share.share('check out my website https://example.com');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff2d9067),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.share,size: 18,color: Colors.white,),
              SizedBox(width: 10,),
              Text(
                "공유",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Apple SD Gothic Neo",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 19,
      ),
      GestureDetector(
        onTap: (){
          BaseToast(text: '신고되었습니다.').showToast(context);
          Get.back();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFE8E8E8),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flag,size: 18, color: Color(0xFFB7B7B7),),
              SizedBox(width: 10,),
              Text(
                "신고",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFB7B7B7),
                  fontSize: 18,
                  fontFamily: "Apple SD Gothic Neo",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 11,
      ),
    ]),
  );
}
