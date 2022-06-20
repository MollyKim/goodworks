import 'package:get/get.dart';

class BottomNaviController extends GetxController {

 int selectedIndex = 0;

  onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}