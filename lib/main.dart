import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/bottomNavigationBarController.dart';
import 'package:practice/controllers/login_controller.dart';
import 'package:practice/services/root_service.dart';
import 'package:practice/screens/home.dart';

void main() {
  runApp(Root());
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {

  @override
  void initState() {
    super.initState();

    initControllers();
  }

  initControllers(){
    final service = initService();
    Get.put(LoginController(service));
    Get.put(BottomNaviController());
  }

  initService() {
    RootService rootService = RootService();
    return rootService;
  }

  List<GetPage> renderPages() {
    final services = initService();

    return [
      GetPage(
        name: '/',
        page: () => Home(),
        transition: Transition.noTransition,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FlutterStudy',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      getPages: renderPages(),
    );
  }
}
