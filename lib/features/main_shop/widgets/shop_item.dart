import 'package:doughnut_shop/app/models/models.dart';
import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/values_manager.dart';
import 'package:doughnut_shop/features/details/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopItem extends StatelessWidget {
  final ItemDetailsObject itemDetails;
  const ShopItem({
    super.key,
    required this.itemDetails,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsView(itemDetails: itemDetails),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p4),
        margin: const EdgeInsets.all(AppMargin.m4),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(
            AppSize.s12,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppPadding.p4),
                  decoration: BoxDecoration(
                    color: ColorManager.lightPrimary,
                    borderRadius: BorderRadius.circular(AppSize.s10),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: '\$ ',
                      style: GoogleFonts.sourceSans3(
                        color: ColorManager.darkPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: itemDetails.itemPrice.toString(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: ColorManager.silverBGColor,
                      padding: EdgeInsets.zero
                    ),
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.solidHeart,
                      color: itemDetails.isFavorite
                          ? ColorManager.darkPrimary
                          : ColorManager.hintColor,
                      size: AppSize.s16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: SvgPicture.asset(
                itemDetails.itemImagePath,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
              child: Text(
                itemDetails.itemName,
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ElevatedButton(
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Icon(
                FontAwesomeIcons.plus,
                color: ColorManager.lightTextColor,
                size: AppSize.s14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
