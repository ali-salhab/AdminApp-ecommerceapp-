import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData appthemEN = ThemeData(
    appBarTheme: AppBarTheme(color: AppColors.primarycolor),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: AppColors.primarycolor),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            fontSize: 16,
            fontFamily: 'Playfair',
            fontWeight: FontWeight.bold,
            wordSpacing: 2,
            height: 1.5),
        displayLarge: TextStyle(
            fontSize: 25,
            fontFamily: 'Playfair',
            fontWeight: FontWeight.bold,
            color: AppColors.black)));

ThemeData appthemAR = ThemeData(
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            fontSize: 16,
            fontFamily: 'Playfair',
            fontWeight: FontWeight.bold,
            wordSpacing: 2,
            height: 1.5),
        displayLarge: TextStyle(
            fontSize: 25,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            color: AppColors.black)));
