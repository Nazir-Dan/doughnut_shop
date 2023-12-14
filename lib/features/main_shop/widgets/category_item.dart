import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  const CategoryItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: AppMargin.m8),
      decoration: BoxDecoration(
          color: isSelected
              ? Colors.white
              : ColorManager.hintColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(AppSize.s16)),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
