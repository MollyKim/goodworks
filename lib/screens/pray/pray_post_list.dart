import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PrayPostList extends StatefulWidget {
  const PrayPostList({Key? key}) : super(key: key);

  @override
  _PrayPostListState createState() => _PrayPostListState();
}

class _PrayPostListState extends State<PrayPostList> {
  Widget buildBottomSheet(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 20,left: 20),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        GestureDetector(
          onTap: (){
            Get.offNamed("/pray_post_correction");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 159,
              vertical: 24,
            ),
            child: Text(
              "수정",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff2d9067),
                fontSize: 18,
                fontFamily: "Apple SD Gothic Neo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 11,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff2d9067),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 159,
            vertical: 24,
          ),
          child: Text(
            "삭제",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Apple SD Gothic Neo",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 19,
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/ic/ic_photo.svg',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '임지혜',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "AppleSDGothicNeo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '000목장',
                        style: TextStyle(
                          color: Color(0xff929292),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: buildBottomSheet);
                },
                child: SvgPicture.asset(
                  'assets/ic/ic_more_horiz.svg',
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text('2021.12.07'),
          SizedBox(
            height: 20,
          ),
          Text(
            "세움프로젝트를 진행하는 모든 굿웍스 멤버들에게 지혜와 시간과 지치지 않는 인내를 주시도록 / 세움 앱을 통해 교회와 공동체와 개인 신앙이 더 성장하는 일이 일어나도록 / 교회의 목회자가 바뀌는 시기인데 새로운 목회자분이 세움 프로젝트를 지지해주시도록 / 등등 많은 기도제목들",
          ),
        ],
      ),
    );
  }
}
