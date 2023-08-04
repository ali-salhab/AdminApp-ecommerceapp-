import 'package:ecommerceapp/controller/test_controller.dart';
import 'package:ecommerceapp/core/class/crud.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
