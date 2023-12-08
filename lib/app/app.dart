import 'package:doughnut_shop/app/resources/constants_manager.dart';
import 'package:doughnut_shop/app/resources/routes_manager.dart';
import 'package:doughnut_shop/app/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConstants.designSize,
      builder: (_, child) => MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        onGenerateRoute: RoutesGenerator.getRout,
        initialRoute: Routes.splashRout,
      ),
    );
  }
}
