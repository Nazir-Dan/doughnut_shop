import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:doughnut_shop/app/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterWidget extends StatelessWidget {
  final VoidCallback onLoginPress;
  const RegisterWidget({
    super.key,
    required this.onLoginPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 280.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.registerTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                AppStrings.registerSubTitle,
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
              Row(
                children: [
                  Checkbox(
                    visualDensity: VisualDensity.compact,
                    value: true,
                    onChanged: (val) {},
                  ),
                  Text(
                    AppStrings.termsAndConditions,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: ColorManager.textColor,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.register,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  TextButton(
                      onPressed: onLoginPress,
                      child: Text(
                        AppStrings.login,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
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
    );
  }
}
