import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:practice/components/baseToast.dart';
import 'package:practice/controllers/church_controller.dart';
import 'package:practice/controllers/community_controller.dart';
import 'package:practice/controllers/write_community_controller.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/themes/extensions.dart';
import 'package:image_picker/image_picker.dart';

class WriteCommunityPost extends StatefulWidget {
  @override
  _WriteCommunityPostState createState() => _WriteCommunityPostState();
}

class _WriteCommunityPostState extends State<WriteCommunityPost> {
  @override
  Widget build(BuildContext context) {
    CommunityController communityController = Get.find();
    ChurchController churchController = Get.find();

    final ImagePicker _picker = ImagePicker();

    return GetBuilder<WriteCommunityController>(
        init: WriteCommunityController(),
        builder: (wrightCommunityController) {
          return DefaultLayout(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                title: Text(
                  "게시글 작성",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: "AppleSDGothicNeo",
                    color: context.forest100,
                  ),
                ),
                elevation: 0.5,
                leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: context.forest80,
                    )),
                centerTitle: true,
                actions: [
                  GestureDetector(
                    onTap: () async {

                      List<String> path = [];
                      wrightCommunityController.images?.forEach((element) {path.add(element.path);});

                      FormData formData = FormData.fromMap({
                        'title': wrightCommunityController
                            .titleTextEditingController.text,
                        'type': 1,
                        'content': wrightCommunityController
                            .contentTextEditingController.text,
                        'attachTypes': "image",
                        'attachments': await MultipartFile.fromFile(path[0]),
                        'attachTypes': "image",
                        'attachments': await MultipartFile.fromFile(path[1]),
                      });
                      String? respCode;
                      try {
                        respCode = await communityController.postCommunityPost(
                          churchController.churchModel.resultData?.id ?? 1,
                          formData,
                        );
                      } catch (e) {
                        print("error!! in post community : $e");
                      }

                      if (respCode == '0000') {
                        try {
                          communityController.getCommunityListData(
                              churchId:
                                  churchController.churchModel.resultData?.id.toString() ??
                                      "1");
                        } catch (e) {
                          print("error!! in rebuild community : $e");
                        }
                        Get.back();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Center(
                          child: Text(
                        "완료",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "AppleSDGothicNeo",
                          color: Color(0xff2d9067),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 20, right: 20, bottom: 15),
                    child: TextField(
                      controller:
                          wrightCommunityController.titleTextEditingController,
                      decoration: new InputDecoration.collapsed(
                          hintText: "제목",
                          hintStyle: TextStyle(
                            color: context.gray04,
                            fontSize: 18,
                            fontFamily: "AppleSDGothicNeo",
                          )),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                      child: TextField(
                        controller: wrightCommunityController
                            .contentTextEditingController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            hintText: "공동체와 나누도 싶은 이야기를 작성 해보세요.",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15)),
                      ),
                    ),
                  ),
                  wrightCommunityController.images != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox(
                            height: 72,
                            child: ListView.builder(
                              itemCount:
                                  wrightCommunityController.images!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder:
                                  (BuildContext context, int imageIndex) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Stack(
                                    children: [
                                      Image.file(
                                        File(wrightCommunityController
                                            .images![imageIndex].path),
                                        width: 72,
                                        height: 72,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            wrightCommunityController.images!
                                                .removeAt(imageIndex);
                                            communityController.update();
                                          },
                                          child: Image.asset(
                                            'assets/ic/ic_delete.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Divider(
                      thickness: 1.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      List<XFile>? selectedPic = await _picker.pickMultiImage();
                      if (selectedPic != null &&
                          wrightCommunityController.images!.length +
                                  selectedPic.length >
                              10) {
                        BaseToast(text: '사진은 10개 이하로 선택해주세요.')
                            .showToast(context);
                      } else {
                        wrightCommunityController.images!.addAll(selectedPic!);
                        wrightCommunityController.update();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/ic/ic_gallery.svg"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "사진 등록 ${wrightCommunityController.images?.length ?? 0}/10",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: context.forest100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
