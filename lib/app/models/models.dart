import 'package:flutter/material.dart';

@immutable
class SliderObject {
  final String title;
  final String subTitle;
  const SliderObject(this.title, this.subTitle);
}

@immutable
class ItemDetailsObject {
  final String itemName;
  final String itemDescription;
  final String itemIngredients;
  final String itemImagePath;
  final double itemPrice;
  final bool isFavorite;
  const ItemDetailsObject({
    required this.itemName,
    required this.itemDescription,
    required this.itemIngredients,
    required this.itemImagePath,
    required this.itemPrice,
    required this.isFavorite,
  });
}

@immutable
class CartItemObject {
  final String itemName;
  final String itemImagePath;
  final double itemPrice;
  final int itemCount;
  const CartItemObject({
    required this.itemName,
    required this.itemImagePath,
    required this.itemPrice,
    required this.itemCount,
  });
}
