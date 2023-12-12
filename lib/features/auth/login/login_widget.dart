import 'package:flutter/material.dart';

import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/strings_manager.dart';
import 'package:doughnut_shop/app/shared/fade_out_builder.dart';
import 'package:doughnut_shop/app/shared/ripple_widget.dart';
import 'package:doughnut_shop/features/onboarding/onboarding_view.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rect_getter/rect_getter.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onRegisterPress;
  final VoidCallback loginButtonPress;
  LoginWidget({
    super.key,
    required this.onRegisterPress,
    required this.loginButtonPress,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final Duration animationDuration = const Duration(milliseconds: 300);
  final Duration delay = const Duration(milliseconds: 300);
  final rectGetterKey = GlobalKey<RectGetterState>();
  Rect? rect;

  void _onTap() async {
    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() =>
          rect = rect!.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(animationDuration + delay, _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context).pushReplacement(
      FadeRouteBuilder(page: OnboardingView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 280.h),
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
                    child: RectGetter(
                      key: rectGetterKey,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.loginButtonPress();
                          _onTap();
                        },
                        child: Text(
                          AppStrings.login,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
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
                          onPressed: widget.onRegisterPress,
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
        RippleWidget(
          animationDuration: animationDuration,
          rect: rect,
        )
      ],
    );
  }
}
