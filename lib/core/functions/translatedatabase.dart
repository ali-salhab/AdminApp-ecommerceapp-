import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

translatedatabase(columnAR, columnEN) {
  var services = Get.find<MyServices>();
  String lan = services.shared.getString('lang').toString();
  if (lan == 'ar') {
    return columnAR;
  } else {
    return columnEN;
  }
}
