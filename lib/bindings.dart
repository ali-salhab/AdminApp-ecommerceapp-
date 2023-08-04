import 'package:ecommerceapp/controller/auth/signupcontroller.dart';
import 'package:ecommerceapp/controller/home_page_controller.dart';
import 'package:get/get.dart';

class Mybinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupcontrollerImp());
  }
}
