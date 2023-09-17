import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData getThemeData() => ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.fillColor,
          selectedItemColor: AppColors.greenLight,
          unselectedItemColor: AppColors.green,
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: false,
          focusColor: AppColors.greenLight,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelStyle: AppTextStyle.subTitleStyle1,
          labelStyle: AppTextStyle.subTitleStyle0.copyWith(
            color: AppColors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.dotColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.dotColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.greenLight,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      );
}
