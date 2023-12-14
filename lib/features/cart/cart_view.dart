import 'dart:ui';

import 'package:doughnut_shop/app/models/models.dart';
import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/font_manager.dart';
import 'package:doughnut_shop/app/resources/values_manager.dart';
import 'package:doughnut_shop/app/shared/rect_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CartView extends StatelessWidget {
  final List<CartItemObject> items;
  const CartView({super.key, required this.items});

  double getTotalBill() {
    double subtotal = 0.0;
    for (var i = 0; i < items.length; i++) {
      subtotal += (items[i].itemPrice * items[i].itemCount);
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Row(
                      children: [
                        RectButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icons.arrow_back_ios_new_outlined,
                          iconColor: ColorManager.textColor,
                          backgroundColor: ColorManager.silverBGColor,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(
                      AppPadding.p8.h,
                    ),
                    padding: EdgeInsets.all(
                      AppPadding.p4.h,
                    ),
                    decoration: BoxDecoration(
                        color: ColorManager.silverBGColor,
                        borderRadius: BorderRadius.circular(AppSize.s20)),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            CartItem(item: items[index]),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p40),
                              child: Divider(
                                color: ColorManager.hintColor,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(
                      AppPadding.p8.h,
                    ),
                    padding: EdgeInsets.all(
                      AppPadding.p4.h,
                    ),
                    decoration: BoxDecoration(
                        color: ColorManager.silverBGColor,
                        borderRadius: BorderRadius.circular(AppSize.s20)),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Subtotal:',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          trailing: RichText(
                            text: TextSpan(
                              text: '\$ ',
                              style: GoogleFonts.sourceSans3(
                                color: ColorManager.darkPrimary,
                                fontSize: FontSizeManager.s14,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: '${getTotalBill()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: FontSizeManager.s20,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Tax:',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          trailing: RichText(
                            text: TextSpan(
                              text: '% ',
                              style: GoogleFonts.sourceSans3(
                                color: ColorManager.darkPrimary,
                                fontSize: FontSizeManager.s14,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: '0.0',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: FontSizeManager.s20,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Grand total:',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          trailing: RichText(
                            text: TextSpan(
                              text: '\$ ',
                              style: GoogleFonts.sourceSans3(
                                color: ColorManager.darkPrimary,
                                fontSize: FontSizeManager.s14,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: '${getTotalBill()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: FontSizeManager.s20,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p40.w,
              vertical: AppPadding.p4.h,
            ),
            width: double.infinity,
            color: ColorManager.silverBGColor,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.bagShopping,
                    color: ColorManager.lightTextColor,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'Checkout',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final CartItemObject item;
  const CartItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppMargin.m8, vertical: AppMargin.m4),
      decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(AppSize.s16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(AppMargin.m8),
            decoration: BoxDecoration(
              color: ColorManager.itemBGColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppSize.s16),
                topLeft: Radius.circular(AppSize.s16),
              ),
            ),
            child: SizedBox(
              child: SvgPicture.asset(
                item.itemImagePath,
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.itemName,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                RichText(
                  text: TextSpan(
                    text: '\$ ',
                    style: GoogleFonts.sourceSans3(
                      color: ColorManager.darkPrimary,
                      fontSize: FontSizeManager.s14,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '${item.itemPrice} Each',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: FontSizeManager.s20,
                            ),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '\$ ',
                    style: GoogleFonts.sourceSans3(
                      color: ColorManager.darkPrimary,
                      fontSize: FontSizeManager.s14,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '${item.itemPrice * item.itemCount} total',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: FontSizeManager.s20,
                            ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_circle_outline_sharp,
                    color: ColorManager.darkPrimary,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(AppPadding.p4),
                  decoration: BoxDecoration(
                    color: ColorManager.silverBGColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(AppSize.s16),
                      topLeft: Radius.circular(AppSize.s16),
                    ),
                  ),
                  child: Text(
                    item.itemCount.toString(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: FontSizeManager.s20,
                        ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
