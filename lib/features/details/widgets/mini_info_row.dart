import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiniInfoRow extends StatelessWidget {
  final String value;
  final IconData icon;
  const MiniInfoRow({
    super.key,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: ColorManager.darkPrimary,
          size: AppSize.s18,
        ),
        SizedBox(width: AppSize.s6.w),
        Text(
          value,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
