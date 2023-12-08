import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class AppConstants {
  // static const int splashDelay = 2;
  // static const int sliderAnimationDuration = 300;
  static const Size designSize = Size(375, 812);
  static const String logoHeroTag = 'logoTag';
  static const String nameHeroTag = 'nameTag';
  static const String treesHeroTag = 'trees_tag';
  static List<Widget> stackCircles = [
    Positioned(
      width: 321.w,
      height: 321.h,
      top: -53.h,
      left: 241.w,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.lightPinkColor,
        ),
      ),
    ),
    Positioned(
      width: 225.w,
      height: 225.h,
      top: -77.h,
      left: -89.w,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.lightPinkColor,
        ),
      ),
    ),
    Positioned(
      width: 215.w,
      height: 215.h,
      top: 296.h,
      left: -143.w,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.lightPinkColor,
        ),
      ),
    ),
    Positioned(
      width: 225.w,
      height: 225.h,
      top: 671.h,
      left: -187.w,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.lightPinkColor,
        ),
      ),
    ),
    Positioned(
      width: 321.w,
      height: 321.h,
      top: 695.h,
      left: 143.w,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.lightPinkColor,
        ),
      ),
    ),
  ];
}
