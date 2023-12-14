import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/values_manager.dart';
import 'package:doughnut_shop/app/shared/rect_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopSearchRow extends StatelessWidget {
  const ShopSearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 250.w,
          child: TextField(
            expands: true,
            maxLines: null,
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.labelMedium,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: 'Search...',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: ColorManager.hintColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: AppSize.s8.w),
        RectButton(
          onPressed: () {},
          icon: FontAwesomeIcons.sliders,
          iconColor: ColorManager.grey,
          backgroundColor: ColorManager.lightPrimary,
        ),
      ],
    );
  }
}
