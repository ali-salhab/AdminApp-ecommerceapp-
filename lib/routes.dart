import 'package:adminapp/view/screens/homepage.dart';
import 'package:get/get.dart';

import 'core/constants/route.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: AppRoutes.homepage, page: () => HomePage())
];
