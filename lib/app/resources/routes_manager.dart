import 'package:doughnut_shop/app/resources/strings_manager.dart';
import 'package:doughnut_shop/features/auth/splash_view.dart';
import 'package:doughnut_shop/features/cart/cart_view.dart';
import 'package:doughnut_shop/features/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRout = '/splash';
  static const String loginRout = '/login';
  static const String registerRout = '/register';
  static const String onBoardingRout = '/onBoarding';
  static const String mainShopRout = '/mainShop';
  static const String detailsRout = 'details';
  static const String cartRout = 'cart';
}

class RoutesGenerator {
  static Route<dynamic> getRout(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRout:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.onBoardingRout:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
