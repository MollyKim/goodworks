import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:practice/layouts/default_layout.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  showDialog() {
    showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 287,
              height: 192,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 146,
                    width: 287,
                    child: Center(
                      child: Text(
                        "로그아웃 하시겠습니까?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff2d9067),
                          fontSize: 14,
                          fontFamily: "AppleSDGothicNeo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Color(0xff2d9067), width: 0.5))),
                          child: Center(
                              child: Text(
                            '취소',
                            style: TextStyle(
                              color: Color(0xff2d9067),
                              fontSize: 18,
                              fontFamily: "Apple SD Gothic Neo",
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Color(0xff2d9067), width: 0.5),
                                  left: BorderSide(
                                      color: Color(0xff2d9067), width: 0.5))),
                          child: Center(
                              child: Text(
                            '로그아웃',
                            style: TextStyle(
                              color: Color(0xff2d9067),
                              fontSize: 18,
                              fontFamily: "Apple SD Gothic Neo",
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
    );
  }

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
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.50,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "약관 및 정책",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "AppleSDGothicNeo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      "서비스 이용약관",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      "개인정보 처리방침",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                  ],
                ),
              ),
              Container(
                // width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.30,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "기타",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "AppleSDGothicNeo",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "1.0.0",
                            style: TextStyle(
                              color: Color(0xff2d9067),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Text(
                        "앱 버전",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog();
                        },
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            "로그아웃",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ));
  }
}
