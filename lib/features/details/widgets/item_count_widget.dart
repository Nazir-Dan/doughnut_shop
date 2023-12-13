import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCountWidget extends StatelessWidget {
  const ItemCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 25.h,
          child: IconButton(
            style: IconButton.styleFrom(
                backgroundColor: ColorManager.lightPrimary,
                padding: EdgeInsets.zero),
            onPressed: () {},
            icon: Icon(
              Icons.remove,
              color: ColorManager.textColor,
              size: AppSize.s12,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
          child: Text(
            '1',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          height: 25.h,
          child: IconButton(
            style: IconButton.styleFrom(
                backgroundColor: ColorManager.lightPrimary,
                padding: EdgeInsets.zero),
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: ColorManager.textColor,
              size: AppSize.s12,
            ),
          ),
        ),
      ],
    );
  }
}
