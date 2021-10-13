import 'package:get/get.dart';
import 'package:practice/root_service.dart';

abstract class BaseController extends GetxController{
  final RootService rootService;

  BaseController(RootService rootService) : this.rootService = rootService;


}