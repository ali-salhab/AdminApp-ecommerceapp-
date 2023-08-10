import 'package:adminapp/controller/tracking_controller.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'bindings/initialbinding.dart';
import 'core/localization/changelocale.dart';
import 'core/localization/translation.dart';

void main() async {
  // AndroidYandexMap.useAndroidViewSurface = false;

  WidgetsFlutterBinding.ensureInitialized();
  await initialservizes();
  await Firebase.initializeApp();
  var a = await FirebaseMessaging.instance.getToken();
  print(a);

  runApp(const MyApp());
}

// all to done

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Localcontroller controller = Get.put(Localcontroller());
    // TrackingController cc = Get.put(TrackingController());
    return GetMaterialApp(
      locale: controller.languageofdevice,
      translations: MyTranslation(),
      initialRoute: "/",
      // routes: routes,
      getPages: getPages,
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      // home: const LanguagePage(),
      theme: controller.appthem,
    );
  }
}
