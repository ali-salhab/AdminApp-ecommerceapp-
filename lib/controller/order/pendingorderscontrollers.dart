import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/order/checkoutdata.dart';
import 'package:ecommerceapp/data/datasource/remote/order/pendingorderdata.dart';
import 'package:get/get.dart';

class Pendingorderscontroller extends GetxController {
  PendingorderData pendingordersdata = PendingorderData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;
  MyServices ser = Get.find();
  List data = [];
  gotoorderdetails(Map dataa) {
    Get.toNamed(AppRoutes.OderDetails, arguments: {"data": dataa});
  }

  printorderstatus(val) {
    if (val == "0") {
      return "Await approval";
    } else if (val == "1") {
      return "prepare";
    } else if (val == "2") {
      return "on the way";
    } else {
      return "archived";
    }
  }

  printdeliverymethod(val) {
    if (val == "1") {
      return "Cash";
    }
    if (val == "0") {
      return "card";
    }
  }

  printordertype(val) {
    if (val == "1") {
      return "delivery";
    }
    if (val == "0") {
      return "recive";
    }
  }

  refreshpage() {
    getpendingorders();
    update();
  }

  getpendingorders() async {
    statusrequest = Statusrequest.loading;
    update();

    var response =
        await pendingordersdata.getpendingorders(ser.shared.getString("id")!);
    print("sssssssss$response");
    print(response);
    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        // List contain maps
        data = response['data'];
        print(data);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  deleteorder(String orderid) async {
    statusrequest = Statusrequest.loading;
    update();

    var response = await pendingordersdata.deleteorder(orderid);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        data.removeWhere((element) => element['order_id'] == orderid);
        update();
      } else {
        Get.snackbar("error", "canr delete order because its prepared");
      }
    }
    update();
  }

  @override
  void onInit() {
    getpendingorders();
    super.onInit();
  }
}
