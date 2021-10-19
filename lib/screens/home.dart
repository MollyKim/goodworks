import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/login_controller.dart';
import 'package:practice/models/login_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

Future<PostLoginInfoModel?> login() async{
  final LoginController loginController = Get.find();
  final PostLoginInfoModel? resp = await loginController.loginInfos(
    uid: 'phil',
    passwd: 'qweqwe123',);
return resp;
}

class _HomeState extends State<Home> {
  PostLoginInfoModel? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('123123'),
              onPressed: () async{
                result = await login();
                setState(() {});
              },
            ),
            Text(result?.RESP_DATA?.session_id ?? "not yet",style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}
