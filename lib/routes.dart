import 'package:ecommerceapp/core/middleware/mymiddleware.dart';
import 'package:ecommerceapp/test.dart';
import 'package:ecommerceapp/view/screens/address/add.dart';
import 'package:ecommerceapp/view/screens/address/addaddresssectiontwo.dart';
import 'package:ecommerceapp/view/screens/address/yandexmaptest.dart';
import 'package:ecommerceapp/view/screens/address/view.dart';
import 'package:ecommerceapp/view/screens/order/archievedorder.dart';
import 'package:ecommerceapp/view/screens/order/checkout.dart';
import 'package:ecommerceapp/view/screens/cart.dart';
import 'package:ecommerceapp/view/screens/favoritepage.dart';
import 'package:ecommerceapp/view/screens/forgetpassword/forgetpassword.dart';
import 'package:ecommerceapp/view/screens/forgetpassword/resetpassword.dart';
import 'package:ecommerceapp/view/screens/auth/successsignup.dart';
import 'package:ecommerceapp/view/screens/forgetpassword/verifycodeforgetpassword.dart';

import 'package:ecommerceapp/view/screens/homescreen.dart';
import 'package:ecommerceapp/view/screens/items.dart';
import 'package:ecommerceapp/view/screens/languagepage.dart';
import 'package:ecommerceapp/view/screens/onboarding.dart';
import 'package:ecommerceapp/view/screens/auth/login.dart';
import 'package:ecommerceapp/view/screens/auth/signup.dart';
import 'package:ecommerceapp/view/screens/order/orderdetails.dart';
import 'package:ecommerceapp/view/screens/order/pendingorders.dart';
import 'package:ecommerceapp/view/screens/products_details.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/route.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (context) => const Login(),
  AppRoutes.onboarding: (context) => const Onboarding(),
  AppRoutes.signup: (contex) => const Signup(),
  AppRoutes.forgetpassword: (context) => const Forgetpassword(),
  AppRoutes.verifycodeforgetpassword: (context) =>
      const VerifycodeForgetpassword(),
  AppRoutes.resetpassword: (context) => const ResetPasswrd(),
  AppRoutes.successsignup: (context) => const SuccessSignup()
};
List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: '/',
      page: () => const LanguagePage(),
      middlewares: [MyMiddleware()]),
  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
  ),
  GetPage(name: AppRoutes.onboarding, page: () => const Onboarding()),
  GetPage(name: AppRoutes.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.signup, page: () => const Signup()),
  GetPage(name: AppRoutes.forgetpassword, page: () => const Forgetpassword()),
  GetPage(
      name: AppRoutes.verifycodeforgetpassword,
      page: () => const VerifycodeForgetpassword()),
  GetPage(name: AppRoutes.resetpassword, page: () => const ResetPasswrd()),
  GetPage(name: AppRoutes.successsignup, page: () => const SuccessSignup()),
  GetPage(name: AppRoutes.items, page: () => const ItemsPage()),
  GetPage(name: AppRoutes.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoutes.favorite, page: () => const FavoritePage()),
  GetPage(name: AppRoutes.cart, page: () => const Cart()),
  // GetPage(name: AppRoutes.AddAdress, page: () => const MapControlsPage()),
  GetPage(name: AppRoutes.AddressView, page: () => const AddressView()),
  GetPage(name: AppRoutes.AddressAdd, page: () => const AddressAdd()),
  GetPage(
      name: AppRoutes.AddressSectionTwo, page: () => const AddressSectionTwo()),

  GetPage(name: AppRoutes.Checkout, page: () => const Checkout()),
  GetPage(name: AppRoutes.pendingorder, page: () => const Pendingorders()),
  GetPage(name: AppRoutes.archivedorder, page: () => const Archievedorder()),
  GetPage(name: AppRoutes.OderDetails, page: () => const OderDetails())
];
