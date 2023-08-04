import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//evey thing will start with starting application Secondary Side Bar.
//any thing needed to start when application started will added to this file

class MyServices extends GetxService {
  late SharedPreferences shared;
  Future<MyServices> init() async {
    await Firebase.initializeApp();
    shared = await SharedPreferences.getInstance();
    return this;
  }
}

initialservizes() async {
  await Get.putAsync(() => MyServices().init());
}
