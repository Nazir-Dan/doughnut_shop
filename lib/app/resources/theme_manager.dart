import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/font_manager.dart';
import 'package:doughnut_shop/app/resources/styles_manager.dart';
import 'package:doughnut_shop/app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
//main theme
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    disabledColor: ColorManager.disabled,
    splashColor: ColorManager.lightPrimary, //ripple effect
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorManager.primary,
      onPrimary: ColorManager.textColor,
      secondary: ColorManager.lightPrimary,
      onSecondary: ColorManager.lightPrimary,
      error: ColorManager.error,
      onError: ColorManager.error,
      background: ColorManager.silverBGColor,
      onBackground: ColorManager.silverBGColor,
      surface: ColorManager.white,
      onSurface: ColorManager.white,
    ),
//cardveiw theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
//appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s0,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s16,
      ),
    ),
//button theme
    buttonTheme: ButtonThemeData(
      //shape: StadiumBorder(),
      disabledColor: ColorManager.disabled,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 55.w, vertical: 14.h),
        textStyle: getBoldStyle(
          color: ColorManager.textColor,
          fontSize: FontSizeManager.s24.sp,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s30),
        ),
      ),
    ),
//text theme
    textTheme: TextTheme(
      bodyLarge: getLightStyle(
        color: ColorManager.textColor,
        fontSize: FontSizeManager.s38.sp,
      ),
      bodySmall: getLightStyle(
        color: ColorManager.textColor,
        fontSize: FontSizeManager.s24.sp,
      ),
      titleLarge: getBoldStyle(
        color: ColorManager.textColor,
        fontSize: FontSizeManager.s40.sp,
      ),
      labelLarge: getBoldStyle(
        color: ColorManager.textColor,
        fontSize: FontSizeManager.s24.sp,
      ),
      labelMedium: getRegularStyle(
        color: ColorManager.textColor,
        fontSize: FontSizeManager.s18.sp,
      ),
      labelSmall: getRegularStyle(
        color: ColorManager.textColor,
        fontSize: FontSizeManager.s12.sp,
      ),
    ),
//input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.only(
        top: 25.h,
        left: 20.w,
        right: 20.w,
      ),
      hintStyle: getRegularStyle(
        color: ColorManager.hintColor,
        fontSize: FontSizeManager.s16.sp,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.hintColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s30.r)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s30.r)),
      ),
    ),
  );
}
