import 'package:adminapp/view/screens/addcategories.dart';
import 'package:adminapp/view/screens/additem.dart';
import 'package:adminapp/view/screens/categoriespage.dart';
import 'package:adminapp/view/screens/editcat.dart';
import 'package:adminapp/view/screens/edititem.dart';
import 'package:adminapp/view/screens/homepage.dart';
import 'package:adminapp/view/screens/items.dart';
import 'package:adminapp/view/screens/orderspage.dart';

import 'package:get/get.dart';

import 'core/constants/route.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: AppRoutes.editcategorie, page: () => EditCategorie()),
  GetPage(name: AppRoutes.homepage, page: () => HomePage()),
  GetPage(name: AppRoutes.categories, page: () => CategoriesPage()),
  GetPage(name: AppRoutes.addcategorie, page: () => AddCategories()),
  GetPage(name: AppRoutes.item, page: () => ItemsPage()),
  GetPage(name: AppRoutes.additem, page: () => AddItems()),
  GetPage(name: AppRoutes.edititem, page: () => EditItems()),
  GetPage(name: AppRoutes.orderpage, page: () => OrdersPage()),

  // GetPage(name: AppRoutes.test, page: () => Test())
];
