import 'package:ecommerceapp/core/constants/route.dart';
import 'package:get/get.dart';

abstract class SuccessSignupController extends GetxController {
  gotologinpage();
}

class SuccessSignupControllerImp extends SuccessSignupController {
  @override
  gotologinpage() {
    Get.offNamed(
      AppRoutes.login,
    );
  }
}
