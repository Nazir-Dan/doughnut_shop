import 'dart:math' as math;

import 'package:doughnut_shop/app/models/models.dart';
import 'package:doughnut_shop/app/resources/assets_manager.dart';
import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/routes_manager.dart';
import 'package:doughnut_shop/app/resources/strings_manager.dart';
import 'package:doughnut_shop/app/resources/values_manager.dart';
import 'package:doughnut_shop/app/shared/fade_out_builder.dart';
import 'package:doughnut_shop/features/details/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends HookWidget {
  OnboardingView({super.key});
  final _onboardingPageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  int previousPageIndex = 0;

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return Icon(
        Icons.circle,
        size: 12.w,
        color: ColorManager.darkPrimary,
      );
    } else {
      return Icon(
        Icons.circle_outlined,
        size: 12.w,
        color: ColorManager.darkPrimary,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final firstToSecondAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
      initialValue: 0.0,
    );
    final secondToThirdAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
      initialValue: 0.0,
    );
    final d1AngleAnimation = Tween<double>(
      begin: -math.pi / 8,
      end: math.pi / 8,
    ).animate(
      firstToSecondAnimationController,
    );
    final firstToSecondD1SizeAnimation = Tween<Size>(
      begin: Size(895.w, 895.h),
      end: Size(750.w, 750.h),
    ).animate(
      firstToSecondAnimationController,
    );
    final firstToSecondD1PositionAnimation = Tween<Offset>(
      begin: const Offset(-72, -395),
      end: const Offset(-192, -70),
    ).animate(
      firstToSecondAnimationController,
    );
    final firstToSecondD2PositionAnimation = Tween<Offset>(
      begin: const Offset(-382, -43),
      end: const Offset(-950, -250),
    ).animate(
      firstToSecondAnimationController,
    );
    final firstToSecondD3PositionAnimation = Tween<Offset>(
      begin: const Offset(77, 240),
      end: const Offset(390, 220),
    ).animate(
      firstToSecondAnimationController,
    );
    final firstToSecondD4PositionAnimation = Tween<Offset>(
      begin: const Offset(-297, -279),
      end: const Offset(-700, -470),
    ).animate(
      firstToSecondAnimationController,
    );
    final secondToThirdD5SizeAnimation = Tween<Size>(
      begin: Size(665.w, 665.h),
      end: Size(570.w, 570.h),
    ).animate(
      secondToThirdAnimationController,
    );
    final secondToThirdD5PositionAnimation = Tween<Offset>(
      begin: const Offset(117, -345),
      end: const Offset(0, -209),
    ).animate(
      secondToThirdAnimationController,
    );
    final d5AngleAnimation = Tween<double>(
      begin: -3 * math.pi / 8,
      end: 0,
    ).animate(
      secondToThirdAnimationController,
    );
    final secondToThirdD6SizeAnimation = Tween<Size>(
      begin: Size(380.w, 380.h),
      end: Size(540.w, 540.h),
    ).animate(
      secondToThirdAnimationController,
    );
    final secondToThirdD6PositionAnimation = Tween<Offset>(
      begin: const Offset(-280, 416),
      end: const Offset(-159, 165),
    ).animate(
      secondToThirdAnimationController,
    );
    final d6AngleAnimation = Tween<double>(
      begin: 152 * (math.pi / 180),
      end: 52 * (math.pi / 180),
    ).animate(
      secondToThirdAnimationController,
    );
    final secondToThirdD1PositionAnimation = Tween<Offset>(
      begin: const Offset(-192, -70),
      end: const Offset(-630, -155),
    ).animate(
      secondToThirdAnimationController,
    );
    final secondToThirdD1AngleAnimation = Tween<double>(
      begin: math.pi / 8,
      end: math.pi / 3,
    ).animate(
      secondToThirdAnimationController,
    );
    final d1PositionStreamController = useStreamController<Offset>();
    final d1PositionStream = useStream<Offset>(
      d1PositionStreamController.stream,
      initialData: const Offset(-72, -395),
    );
    final d1AngleStreamController = useStreamController<double>();
    final d1AngleStream = useStream<double>(
      d1AngleStreamController.stream,
      initialData: -math.pi / 8,
    );
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: AnimatedBuilder(
                animation: Listenable.merge(
                  [
                    d1AngleAnimation,
                    d5AngleAnimation,
                    d6AngleAnimation,
                    firstToSecondD1SizeAnimation,
                    firstToSecondD1PositionAnimation,
                    firstToSecondD2PositionAnimation,
                    firstToSecondD3PositionAnimation,
                    firstToSecondD4PositionAnimation,
                    secondToThirdD5SizeAnimation,
                    secondToThirdD5PositionAnimation,
                    secondToThirdD6SizeAnimation,
                    secondToThirdD6PositionAnimation,
                    secondToThirdD1PositionAnimation,
                    secondToThirdD1AngleAnimation,
                  ],
                ),
                builder: (context, child) {
                  if ((previousPageIndex == 0 && currentPageIndex == 1) ||
                      (previousPageIndex == 1 && currentPageIndex == 0)) {
                    d1PositionStreamController
                        .add(firstToSecondD1PositionAnimation.value);
                    d1AngleStreamController.add(d1AngleAnimation.value);
                  } else if ((previousPageIndex == 1 &&
                          currentPageIndex == 2) ||
                      (previousPageIndex == 2 && currentPageIndex == 1)) {
                    d1PositionStreamController
                        .add(secondToThirdD1PositionAnimation.value);
                    d1AngleStreamController
                        .add(secondToThirdD1AngleAnimation.value);
                  }
                  return Stack(
                    children: [
                      Positioned(
                        width: firstToSecondD1SizeAnimation.value.width,
                        height: firstToSecondD1SizeAnimation.value.height,
                        child: Transform(
                          alignment: Alignment.center,
                          origin: Offset.zero,
                          transform: Matrix4.identity()
                            ..translate(
                              d1PositionStream.data!.dx.w,
                              d1PositionStream.data!.dy.h,
                            )
                            ..rotateZ(d1AngleStream.data!),
                          child: SvgPicture.asset(
                            ImageAssets.topViewDoughnut1,
                          ),
                        ),
                      ),
                      Positioned(
                        width: 827.w,
                        height: 827.h,
                        child: Transform(
                          alignment: Alignment.center,
                          origin: Offset.zero,
                          transform: Matrix4.identity()
                            ..translate(
                              firstToSecondD2PositionAnimation.value.dx.w,
                              firstToSecondD2PositionAnimation.value.dy.h,
                            ),
                          child: SvgPicture.asset(
                            ImageAssets.topViewDoughnut2,
                          ),
                        ),
                      ),
                      Positioned(
                        width: 660.w,
                        height: 660.h,
                        child: Transform(
                          alignment: Alignment.center,
                          origin: Offset.zero,
                          transform: Matrix4.identity()
                            ..translate(
                              firstToSecondD4PositionAnimation.value.dx.w,
                              firstToSecondD4PositionAnimation.value.dy.h,
                            ),
                          child: SvgPicture.asset(
                            ImageAssets.topViewDoughnut4,
                          ),
                        ),
                      ),
                      Positioned(
                        width: 500.w,
                        height: 500.h,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(
                              firstToSecondD3PositionAnimation.value.dx.w,
                              firstToSecondD3PositionAnimation.value.dy.h,
                            ),
                          child: Image.asset(
                            ImageAssets.topViewDoughnut3,
                          ),
                        ),
                      ),
                      Positioned(
                        width: secondToThirdD5SizeAnimation.value.width,
                        height: secondToThirdD5SizeAnimation.value.height,
                        child: Transform(
                          alignment: Alignment.center,
                          origin: Offset.zero,
                          transform: Matrix4.identity()
                            ..translate(
                              secondToThirdD5PositionAnimation.value.dx.w,
                              secondToThirdD5PositionAnimation.value.dy.h,
                            )
                            ..rotateZ(d5AngleAnimation.value),
                          child: SvgPicture.asset(
                            ImageAssets.topViewDoughnut5,
                          ),
                        ),
                      ),
                      Positioned(
                        width: secondToThirdD6SizeAnimation.value.width,
                        height: secondToThirdD6SizeAnimation.value.height,
                        child: Transform(
                          alignment: Alignment.center,
                          origin: Offset.zero,
                          transform: Matrix4.identity()
                            ..translate(
                              secondToThirdD6PositionAnimation.value.dx.w,
                              secondToThirdD6PositionAnimation.value.dy.h,
                            )
                            ..rotateZ(d6AngleAnimation.value),
                          child: SvgPicture.asset(
                            ImageAssets.topViewDoughnut6,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: PageView.builder(
              controller: _onboardingPageController,
              itemCount: slides.length,
              onPageChanged: (newIndex) {
                if (currentPageIndex == 0) {
                  firstToSecondAnimationController.forward();
                } else if (currentPageIndex == 1 && newIndex == 0) {
                  firstToSecondAnimationController.reverse();
                } else if (currentPageIndex == 1 && newIndex == 2) {
                  secondToThirdAnimationController.forward();
                } else if (currentPageIndex == 2 && newIndex == 1) {
                  secondToThirdAnimationController.reverse();
                }
                previousPageIndex = currentPageIndex;
                currentPageIndex = newIndex;
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 72.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < slides.length; i++)
                              Padding(
                                padding: const EdgeInsets.all(
                                  AppPadding.p8,
                                ),
                                child: _getProperCircle(i, currentPageIndex),
                              )
                          ],
                        ),
                        Text(
                          slides[index].title,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          slides[index].subTitle,
                          style: Theme.of(context).textTheme.displaySmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: currentPageIndex == 0
                      ? null
                      : () {
                          _onboardingPageController.previousPage(
                              duration: const Duration(microseconds: 300),
                              curve: Curves.easeInOut);
                        },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: currentPageIndex == 0
                        ? ColorManager.disabled
                        : ColorManager.darkPrimary,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.detailsRout);
                  },
                  child: Text(
                    'Skip',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                IconButton(
                  onPressed: currentPageIndex == slides.length - 1
                      ? () {
                          Navigator.of(context).push(
                              FadeRouteBuilder(page: const DetailsView()));
                        }
                      : () {
                          _onboardingPageController.nextPage(
                              duration: const Duration(microseconds: 300),
                              curve: Curves.easeInOut);
                        },
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: currentPageIndex == slides.length
                        ? ColorManager.disabled
                        : ColorManager.darkPrimary,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<SliderObject> slides = const [
    SliderObject(
      AppStrings.onBoardingTitle1,
      AppStrings.onBoardingSubTitle1,
    ),
    SliderObject(
      AppStrings.onBoardingTitle2,
      AppStrings.onBoardingSubTitle2,
    ),
    SliderObject(
      AppStrings.onBoardingTitle3,
      AppStrings.onBoardingSubTitle3,
    ),
  ];
}
