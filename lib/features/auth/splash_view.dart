import 'dart:async';
import 'dart:ui';

import 'package:doughnut_shop/app/resources/assets_manager.dart';
import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/strings_manager.dart';
import 'package:doughnut_shop/app/resources/constants_manager.dart';
import 'package:doughnut_shop/features/auth/login/login_widget.dart';
import 'package:doughnut_shop/features/auth/register/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends HookWidget {
  SplashView({super.key});
  final PageController controller = PageController(initialPage: 1);
  bool isAuthVisible = false;
  bool isFirstBuild = true;
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    final logoSizeAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
      initialValue: 0.0,
    );
    final loginVisibilityAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
      initialValue: 0.0,
    );
    final treesPageChangeAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      initialValue: 0.0,
    );
    final loginVisibilityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      loginVisibilityAnimationController,
    );
    final logoSizeAnimation = Tween<Size>(
      begin: Size(135.w, 135.h),
      end: Size(46.w, 46.h),
    ).animate(
      logoSizeAnimationController,
    );
    final logoPositionAnimation = Tween<Offset>(
      begin: Offset(121.w, 300.h),
      end: Offset(115.w, 80.h),
    ).animate(
      logoSizeAnimationController,
    );
    final logoTextSizeAnimation = Tween<double>(
      begin: 38.sp,
      end: 24.sp,
    ).animate(
      logoSizeAnimationController,
    );
    final logoTextPositionAnimation = Tween<Offset>(
      begin: Offset(100.w, 435.h),
      end: Offset(160.w, 85.h),
    ).animate(
      logoSizeAnimationController,
    );
    final treesPositionAnimation = Tween<Offset>(
      begin: Offset(33.w, 604.h),
      end: Offset(-166.w, 124.h),
    ).animate(
      logoSizeAnimationController,
    );
    final treesToRegisterAnimation = Tween<Offset>(
      begin: Offset(-166.w, 124.h),
      end: Offset(51.w, 124.h),
    ).animate(
      treesPageChangeAnimationController,
    );
    if (isFirstBuild) {
      isFirstBuild = false;
      timer = Timer(
        const Duration(seconds: 1),
        () {
          logoSizeAnimationController.forward().then((_) {
            timer.cancel();
          });
        },
      );
    }
    logoSizeAnimationController.addListener(() {
      if (logoSizeAnimationController.isCompleted && !isAuthVisible) {
        isAuthVisible = true;
        loginVisibilityAnimationController.forward();
      }
    });
    final treesHorizontalMovementStreamController =
        useStreamController<Offset>();
    final treesHorizontalMovementStream =
        useStream<Offset>(treesHorizontalMovementStreamController.stream);
    return Scaffold(
      backgroundColor: ColorManager.silverBGColor,
      body: Stack(
        children: [
          ...AppConstants.stackCircles,
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.silverBGColor.withOpacity(0.65),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: Listenable.merge(
              [
                logoSizeAnimation,
                logoPositionAnimation,
                logoTextPositionAnimation,
                treesPositionAnimation,
                loginVisibilityAnimation,
                treesToRegisterAnimation,
              ],
            ),
            builder: (_, child) {
              if (treesPositionAnimation.isCompleted) {
                treesHorizontalMovementStreamController
                    .add(treesToRegisterAnimation.value);
              } else {
                treesHorizontalMovementStreamController
                    .add(treesPositionAnimation.value);
              }
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Positioned(
                      top: logoPositionAnimation.value.dy,
                      left: logoPositionAnimation.value.dx,
                      child: SvgPicture.asset(
                        ImageAssets.doughnutLogo,
                        width: logoSizeAnimation.value.width,
                        height: logoSizeAnimation.value.height,
                      ),
                    ),
                    Positioned(
                      top: logoTextPositionAnimation.value.dy,
                      left: logoTextPositionAnimation.value.dx,
                      child: Text(
                        AppStrings.appName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: logoTextSizeAnimation.value),
                      ),
                    ),
                    Positioned(
                      width: 527.w,
                      height: 157.h,
                      top: treesHorizontalMovementStream.data?.dy ?? 604,
                      left: treesHorizontalMovementStream.data?.dx ?? 33,
                      child: SvgPicture.asset(
                        ImageAssets.trees,
                      ),
                    ),
                    Opacity(
                      opacity: loginVisibilityAnimation.value,
                      child: SizedBox(
                        height: AppConstants.designSize.height,
                        child: PageView(
                          controller: controller,
                          allowImplicitScrolling: false,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            RegisterWidget(onLoginPress: () {
                              controller.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 350),
                                curve: Curves.easeInOut,
                              );
                              treesPageChangeAnimationController.reverse();
                            }),
                            LoginWidget(
                                loginButtonPress: () {},
                                onRegisterPress: () {
                                  controller.animateToPage(
                                    0,
                                    duration: const Duration(milliseconds: 350),
                                    curve: Curves.easeInOut,
                                  );
                                  treesPageChangeAnimationController.forward();
                                }),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
