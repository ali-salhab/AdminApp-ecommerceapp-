import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/initialbinding.dart';
import 'core/localization/changelocale.dart';
import 'core/localization/translation.dart';

void main() async {
  // AndroidYandexMap.useAndroidViewSurface = false;

  WidgetsFlutterBinding.ensureInitialized();
  await initialservizes();

  runApp(const MyApp());
}

// all to done

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Localcontroller controller = Get.put(Localcontroller());
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
