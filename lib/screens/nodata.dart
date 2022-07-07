import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/themes/extensions.dart';

class NoData extends StatelessWidget {
  final String title;
  final String content;
  const NoData({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/img_nodata.png'),
            Text(
              title,
              style: context.textStyleCustom.copyWith(
                  fontSize: 24,
                  color: Colors.black,//context.forest80,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 7),
            Text(
              content,
              style: context.textStyleCustom.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
