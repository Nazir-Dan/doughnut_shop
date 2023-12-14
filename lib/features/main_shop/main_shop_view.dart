import 'package:doughnut_shop/app/models/models.dart';
import 'package:doughnut_shop/app/resources/assets_manager.dart';
import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/font_manager.dart';
import 'package:doughnut_shop/app/resources/routes_manager.dart';
import 'package:doughnut_shop/app/resources/strings_manager.dart';
import 'package:doughnut_shop/app/resources/values_manager.dart';
import 'package:doughnut_shop/features/cart/cart_view.dart';
import 'package:doughnut_shop/features/main_shop/widgets/category_item.dart';
import 'package:doughnut_shop/features/main_shop/widgets/shop_item.dart';
import 'package:doughnut_shop/features/main_shop/widgets/shop_search_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainShopView extends StatelessWidget {
  const MainShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              Routes.splashRout,
            );
          },
          icon: Icon(
            Icons.logout,
            color: ColorManager.textColor,
          ),
        ),
        actions: [
          Badge(
            alignment: Alignment.bottomLeft,
            backgroundColor: ColorManager.primary,
            label: Center(
                child: Text(
              '8',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: FontSizeManager.s12.sp),
            )),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartView(items: cartItems),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.bagShopping,
                color: ColorManager.textColor,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const ShopSearchRow(),
          SizedBox(height: AppSize.s20.h),
          SizedBox(
            height: AppSize.s40,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: catagories.length,
              itemBuilder: (ctx, index) {
                return CategoryItem(
                  title: catagories[index],
                  isSelected: index == 0 ? true : false,
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: (itemsDetails.length ~/ 2),
              padding: const EdgeInsets.all(AppPadding.p12),
              itemBuilder: (ctx, index) {
                return SizedBox(
                  height: AppSize.s200,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: ShopItem(
                          itemDetails: itemsDetails[index * 2],
                        ),
                      ),
                      if (((index * 2) + 1) < itemsDetails.length)
                        Expanded(
                          child: ShopItem(
                            itemDetails: itemsDetails[(index * 2) + 1],
                          ),
                        )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final List<String> catagories = const [
    'All',
    'Basic',
    'Frosted',
    'Glazed',
    'Cream-filled',
    'Cruller'
  ];
  final List<ItemDetailsObject> itemsDetails = const [
    ItemDetailsObject(
      itemName: AppStrings.doughnutF1,
      itemDescription: AppStrings.doughnutDescription,
      itemIngredients: AppStrings.doughnutIngredients,
      itemImagePath: ImageAssets.cropedTopViewDoughnut1,
      itemPrice: 3.99,
      isFavorite: true,
    ),
    ItemDetailsObject(
      itemName: AppStrings.doughnutF2,
      itemDescription: AppStrings.doughnutDescription,
      itemIngredients: AppStrings.doughnutIngredients,
      itemImagePath: ImageAssets.cropedTopViewDoughnut2,
      itemPrice: 2.99,
      isFavorite: false,
    ),
    ItemDetailsObject(
      itemName: AppStrings.doughnutF3,
      itemDescription: AppStrings.doughnutDescription,
      itemIngredients: AppStrings.doughnutIngredients,
      itemImagePath: ImageAssets.cropedTopViewDoughnut3,
      itemPrice: 1.99,
      isFavorite: false,
    ),
    ItemDetailsObject(
      itemName: AppStrings.doughnutF4,
      itemDescription: AppStrings.doughnutDescription,
      itemIngredients: AppStrings.doughnutIngredients,
      itemImagePath: ImageAssets.cropedTopViewDoughnut4,
      itemPrice: 4.99,
      isFavorite: false,
    ),
    ItemDetailsObject(
      itemName: AppStrings.doughnutF5,
      itemDescription: AppStrings.doughnutDescription,
      itemIngredients: AppStrings.doughnutIngredients,
      itemImagePath: ImageAssets.cropedTopViewDoughnut5,
      itemPrice: 3.99,
      isFavorite: true,
    ),
    ItemDetailsObject(
      itemName: AppStrings.doughnutF6,
      itemDescription: AppStrings.doughnutDescription,
      itemIngredients: AppStrings.doughnutIngredients,
      itemImagePath: ImageAssets.cropedTopViewDoughnut6,
      itemPrice: 3.99,
      isFavorite: false,
    ),
    ItemDetailsObject(
      itemName: AppStrings.doughnutF4,
      itemDescription: AppStrings.doughnutDescription,
      itemIngredients: AppStrings.doughnutIngredients,
      itemImagePath: ImageAssets.cropedTopViewDoughnut4,
      itemPrice: 4.99,
      isFavorite: false,
    ),
    ItemDetailsObject(
      itemName: AppStrings.doughnutF2,
      itemDescription: AppStrings.doughnutDescription,
      itemIngredients: AppStrings.doughnutIngredients,
      itemImagePath: ImageAssets.cropedTopViewDoughnut2,
      itemPrice: 2.99,
      isFavorite: false,
    ),
  ];

  final List<CartItemObject> cartItems = const [
    CartItemObject(
      itemName: AppStrings.doughnutF1,
      itemImagePath: ImageAssets.cropedTopViewDoughnut1,
      itemPrice: 3.99,
      itemCount: 3,
    ),
    CartItemObject(
      itemName: AppStrings.doughnutF5,
      itemImagePath: ImageAssets.cropedTopViewDoughnut5,
      itemPrice: 2.99,
      itemCount: 1,
    ),
    CartItemObject(
      itemName: AppStrings.doughnutF6,
      itemImagePath: ImageAssets.cropedTopViewDoughnut6,
      itemPrice: 1.99,
      itemCount: 2,
    ),
  ];
}
