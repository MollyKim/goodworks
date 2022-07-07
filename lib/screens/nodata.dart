import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/themes/extensions.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/img_nodata.png'),
            Text(
              "현재 작성된 게시물이 없습니다.",
              style: context.textStyleCustom.copyWith(
                  fontSize: 24,
                  color: context.forest80,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
