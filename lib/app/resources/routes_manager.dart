import 'package:doughnut_shop/app/resources/strings_manager.dart';
import 'package:doughnut_shop/features/auth/splash_view.dart';
import 'package:doughnut_shop/features/details/details_view.dart';
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
      // case Routes.loginRout:
      //   return MaterialPageRoute(builder: (_) => const LoginView());
      // case Routes.registerRout:
      //   return MaterialPageRoute(builder: (_) => RegisterView());
      // case Routes.forgetPasswordRout:
      //   return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.onBoardingRout:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      // case Routes.mainRout:
      //   return MaterialPageRoute(builder: (_) => MainView());
      case Routes.detailsRout:
        return MaterialPageRoute(builder: (_) => const DetailsView());
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
