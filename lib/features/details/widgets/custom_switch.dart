import 'dart:math' as math;

import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/font_manager.dart';
import 'package:doughnut_shop/app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSwitch extends HookWidget {
  final VoidCallback onTap;
  CustomSwitch({
    super.key,
    required this.onTap,
  });
  final double switchWidth = 60.w;
  final double switchButtonWidth = 30.w;

  @override
  Widget build(BuildContext context) {
    final switchAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      initialValue: 0.0,
    );
    final switchRotateAnimation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(
      switchAnimationController,
    );
    final switchTransitionAnimation = Tween<double>(
      begin: -1,
      end: 29.w,
    ).animate(
      switchAnimationController,
    );
    final switchIconAnimation = Tween<String>(
      begin: 'S',
      end: 'L',
    ).animate(
      switchAnimationController,
    );
    final switchColorAnimation = TweenSequence<Color>([
      TweenSequenceItem(
          tween: Tween<Color>(
            begin: ColorManager.primary,
            end: ColorManager.darkPrimary,
          ),
          weight: 0.5),
      TweenSequenceItem(
          tween: Tween<Color>(
            begin: ColorManager.darkPrimary,
            end: ColorManager.primary,
          ),
          weight: 0.5),
    ]).animate(
      switchAnimationController,
    );
    return InkWell(
      onTap: () {
        if (switchAnimationController.isCompleted) {
          switchAnimationController.reverse();
        } else {
          switchAnimationController.forward();
        }
        onTap();
      },
      child: Stack(
        children: [
          Container(
            height: 32,
            width: switchWidth,
            decoration: BoxDecoration(
              color: ColorManager.silverBGColor,
              borderRadius: BorderRadius.circular(AppSize.s20),
              border: Border.all(
                color: ColorManager.darkPrimary,
                width: AppSize.s1_5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'S',
                    style: GoogleFonts.sourceSans3(
                      fontSize: FontSizeManager.s20,
                      color: ColorManager.lightTextColor.withOpacity(0.3),
                    ),
                  ),
                  Text(
                    'L',
                    style: GoogleFonts.sourceSans3(
                      fontSize: FontSizeManager.s20,
                      color: ColorManager.lightTextColor.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: Listenable.merge([
              switchRotateAnimation,
              switchTransitionAnimation,
              switchIconAnimation,
              switchColorAnimation
            ]),
            builder: (context, child) {
              return Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..translate(switchTransitionAnimation.value)
                      ..rotateZ(switchRotateAnimation.value),
                    child: SizedBox(
                        height: 30,
                        width: switchButtonWidth,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              switchAnimationController.isCompleted ? 'L' : 'S',
                              style: GoogleFonts.sourceSans3(
                                fontSize: FontSizeManager.s20,
                                color: ColorManager.textColor,
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
