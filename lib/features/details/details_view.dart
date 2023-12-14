import 'dart:math' as math;
import 'dart:ui';

import 'package:doughnut_shop/app/models/models.dart';
import 'package:doughnut_shop/app/resources/assets_manager.dart';
import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/font_manager.dart';
import 'package:doughnut_shop/app/resources/strings_manager.dart';
import 'package:doughnut_shop/app/resources/values_manager.dart';
import 'package:doughnut_shop/app/shared/rect_button.dart';
import 'package:doughnut_shop/features/details/widgets/custom_switch.dart';
import 'package:doughnut_shop/features/details/widgets/item_count_widget.dart';
import 'package:doughnut_shop/features/details/widgets/mini_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsView extends HookWidget {
  final ItemDetailsObject itemDetails;
  const DetailsView({super.key, required this.itemDetails});

  @override
  Widget build(BuildContext context) {
    final doughnutAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      initialValue: 0.0,
    );
    final topDoughnutRotateAnimation = Tween<double>(
      begin: (9 * math.pi / 8),
      end: (7 * math.pi / 8),
    ).animate(
      doughnutAnimationController,
    );
    final topDoughnutTranslateAnimation = Tween<Offset>(
      begin: const Offset(20, 80),
      end: const Offset(-20, 80),
    ).animate(
      doughnutAnimationController,
    );
    final topDoughnutOpacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      doughnutAnimationController,
    );
    final bottomDoughnutRotateAnimation = Tween<double>(
      begin: (5 * math.pi / 4),
      end: (math.pi),
    ).animate(
      doughnutAnimationController,
    );
    final bottomDoughnutTranslateAnimation = Tween<Offset>(
      begin: const Offset(80, 20),
      end: const Offset(40, 30),
    ).animate(
      doughnutAnimationController,
    );
    final bottomDoughnutBlurAnimation = Tween<double>(
      begin: 3.0,
      end: 0.0,
    ).animate(
      doughnutAnimationController,
    );
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RectButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icons.arrow_back_ios_new_outlined,
                      iconColor: ColorManager.textColor,
                      backgroundColor: ColorManager.silverBGColor,
                    ),
                    CustomSwitch(
                      onTap: () {
                        if (doughnutAnimationController.isCompleted) {
                          doughnutAnimationController.reverse();
                        } else {
                          doughnutAnimationController.forward();
                        }
                      },
                    ),
                  ],
                ),
              ),
              const Expanded(flex: 2, child: SizedBox()),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppPadding.p12),
                  decoration: BoxDecoration(
                    color: ColorManager.silverBGColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(
                        AppSize.s80,
                        AppSize.s40,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSize.s20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              itemDetails.itemName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: FontSizeManager.s40,
                                  ),
                            ),
                            SizedBox(
                              height: 30.h,
                              width: 30.w,
                              child: IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: ColorManager.lightPrimary,
                                  padding: EdgeInsets.zero
                                ),
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesomeIcons.solidHeart,
                                  color: itemDetails.isFavorite
                                      ? ColorManager.darkPrimary
                                      : ColorManager.lightTextColor.withOpacity(0.4),
                                  size: AppSize.s16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: '\$ ',
                                style: GoogleFonts.sourceSans3(
                                  color: ColorManager.primary,
                                  fontSize: FontSizeManager.s24,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                      text: itemDetails.itemPrice.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium)
                                ],
                              ),
                            ),
                            const ItemCountWidget(),
                          ],
                        ),
                        SizedBox(height: AppSize.s10.h),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    MiniInfoRow(
                                      value: '4.9',
                                      icon: FontAwesomeIcons.solidStar,
                                    ),
                                    MiniInfoRow(
                                      value: '10 min',
                                      icon: FontAwesomeIcons.solidClock,
                                    ),
                                    MiniInfoRow(
                                      value: '328 kcal',
                                      icon: FontAwesomeIcons.fire,
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppSize.s20.h),
                                Text(
                                  'Description',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  itemDetails.itemDescription,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                SizedBox(height: AppSize.s20.h),
                                Text(
                                  'Ingredients',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  itemDetails.itemIngredients,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.s8.h),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              AppStrings.addToBag,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: ColorManager.lightTextColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedBuilder(
              animation: Listenable.merge([
                bottomDoughnutBlurAnimation,
                bottomDoughnutRotateAnimation,
                bottomDoughnutTranslateAnimation,
              ]),
              builder: (context, child) {
                return Positioned(
                  width: 300.w,
                  height: 300.h,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..translate(
                        bottomDoughnutTranslateAnimation.value.dx.w,
                        bottomDoughnutTranslateAnimation.value.dy.h,
                      )
                      ..rotateZ(
                        bottomDoughnutRotateAnimation.value,
                      ),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                          sigmaX: bottomDoughnutBlurAnimation.value,
                          sigmaY: bottomDoughnutBlurAnimation.value),
                      child: SvgPicture.asset(
                        itemDetails.itemImagePath,
                      ),
                    ),
                  ),
                );
              }),
          AnimatedBuilder(
              animation: Listenable.merge([
                topDoughnutOpacityAnimation,
                topDoughnutRotateAnimation,
                topDoughnutTranslateAnimation,
              ]),
              builder: (context, child) {
                return Positioned(
                  width: 250.w,
                  height: 250.h,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..translate(
                        topDoughnutTranslateAnimation.value.dx.w,
                        topDoughnutTranslateAnimation.value.dy.h,
                      )
                      ..rotateZ(
                        topDoughnutRotateAnimation.value,
                      ),
                    child: Opacity(
                      opacity: topDoughnutOpacityAnimation.value,
                      child: SvgPicture.asset(
                        itemDetails.itemImagePath,
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
