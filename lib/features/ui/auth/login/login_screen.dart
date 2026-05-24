import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 61.h, bottom: 57.h, left: 97.w, right: 97.w),
                child: Image.asset(
                  AppAssets.appBarLeading,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AutoSizeText(
                      'Welcome Back To Route',
                      style: AppStyles.semi24White,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      'Please sign in with your mail',
                      style: AppStyles.light16White,
                      maxLines: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "User Name",
                              style: AppStyles.medium18White,
                            ),
                            CustomTextFormField(
                                isPassword: false,
                                keyboardType: TextInputType.text,
                                isObscureText: false,
                                hintText: "enter your name",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: userNameController,
                                validator: AppValidators.validateEmail),
                            Text(
                              "Password",
                              style: AppStyles.medium18White,
                            ),
                            CustomTextFormField(
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              isObscureText: true,
                              hintText: "enter your password",
                              hintStyle: AppStyles.light18HintText,
                              filledColor: AppColors.whiteColor,
                              controller: passwordController,
                              validator: AppValidators.validatePassword,
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.visibility_off)),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Forgot Password',
                                style: AppStyles.regular18White,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 35.h),
                              child: CustomElevatedButton(
                                  backgroundColor: AppColors.whiteColor,
                                  textStyle: AppStyles.semi20Primary,
                                  text: "Login",
                                  onPressed: () {
                                    login();
                                  }),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 30.h),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.registerRoute);
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Don’t have an account? Create Account',
                                          style: AppStyles.medium18White,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
      print("login Successfully");
    }
  }
}
