import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/screens/community/post_list.dart';

class Community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("청년부",style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 20,
          fontFamily: "AppleSDGothicNeo",
          color: Color(0xff2d9067),
        ),),
        elevation: 0,
      ),
        body: SafeArea(
            top: true,
            bottom: true,
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) {
                return Divider(thickness: 2.0,);
              },
              itemBuilder: (BuildContext context, int index) {
                return CommunityPostList();
              },),
        ),
      floatingActionButton: GestureDetector(
        onTap: (){

        },
        child: SvgPicture.asset(
          'assets/ic/ic_write.svg',
        ),
      ),
    );
  }
}
