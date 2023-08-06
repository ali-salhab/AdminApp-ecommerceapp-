import 'package:adminapp/view/screens/addcategories.dart';
import 'package:adminapp/view/screens/categoriespage.dart';
import 'package:adminapp/view/screens/editcat.dart';
import 'package:adminapp/view/screens/homepage.dart';
import 'package:get/get.dart';

import 'core/constants/route.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: AppRoutes.editcategorie, page: () => EditCategorie()),
  GetPage(name: AppRoutes.homepage, page: () => HomePage()),
  GetPage(name: AppRoutes.categories, page: () => CategoriesPage()),
  GetPage(name: AppRoutes.addcategorie, page: () => AddCategories())
];
