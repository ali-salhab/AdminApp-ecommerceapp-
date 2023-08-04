import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/test_data.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';

class Testcontroller extends GetxController {
  TestData testdata = TestData(Get.find());
  List data = [];
  late Statusrequest statusrequest;
  getdata() async {
    statusrequest = Statusrequest.loading;
    var response = await testdata.getdata();

    statusrequest = handlingdata(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
