import 'package:doughnut_shop/app/resources/assets_manager.dart';
import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/constants_manager.dart';
import 'package:doughnut_shop/app/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 124.h,
              right: 14.w,
              width: 527.w,
              height: 157.h,
              child: SvgPicture.asset(
                ImageAssets.trees,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 87.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.doughnutLogo,
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      AppStrings.appName,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
                SizedBox(height: 180.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.loginTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        AppStrings.loginSubTitle,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 60.h,
                        child: TextField(
                          expands: true,
                          maxLines: null,
                          keyboardType: TextInputType.emailAddress,
                          style: Theme.of(context).textTheme.labelMedium,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            hintText: AppStrings.emailHint,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 60.h,
                        child: TextField(
                          expands: true,
                          maxLines: null,
                          keyboardType: TextInputType.text,
                          style: Theme.of(context).textTheme.labelMedium,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: AppStrings.passwordHint,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: ColorManager.hintColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        AppStrings.forgetPassword,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: ColorManager.textColor,
                            ),
                      ),
                      SizedBox(height: 30.h),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.login,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Register',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: Colors.blue[400],
                                      decoration: TextDecoration.underline,
                                      decorationColor: ColorManager.textColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
