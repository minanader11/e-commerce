import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/domain/di.dart';
import 'package:e_commerce/presentation/auth/login/view/login_Screen.dart';
import 'package:e_commerce/presentation/auth/register/view_model/register_states.dart';
import 'package:e_commerce/presentation/auth/register/view_model/register_view_model.dart';
import 'package:e_commerce/presentation/utils/custom_text_field.dart';
import 'package:e_commerce/presentation/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static const String routeName = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel viewModel =
      RegisterViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context);
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.errorMsg,
              actionName: 'ok',
              posActionFun: () {
                Navigator.of(context).pop();
              });
        } else if(state is RegisterSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Register Successfully',
              actionName: 'ok',
              posActionFun: () {
                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              });
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Form(
            key: viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 91.h, left: 97.w, right: 96.w, bottom: 46.h),
                    child: Image.asset(
                      MyTexts.routeImage,
                    ),
                  ),
                  Text(
                    MyTexts.fullName,
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                      hint: MyTexts.enterYourFullName,
                      controller: viewModel.fullNameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Name';
                        }
                        return null;
                      },),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    MyTexts.mobileNumber,
                    style: Styles.textStyle18,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                      hint: MyTexts.enterYourMobileNo,
                      controller: viewModel.mobileNumberController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Password';
                        }
                        if (text.trim().length < 11) {
                          return 'phone number must contains at least 11 number';
                        }
                        return null;
                      },),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    MyTexts.email,
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                      hint: MyTexts.enterYourEmailAddress,
                      controller: viewModel.emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Email';
                        }
                        bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return 'Please enter Valid Email';
                        }
                        return null;
                      },),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    MyTexts.password,
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                      hint: MyTexts.password,
                      controller: viewModel.passwordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Password';
                        }
                        if (text.trim().length < 6) {
                          return 'Password must contains at least 6 characters';
                        }
                        return null;
                      },),
                  SizedBox(
                    height: 56.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.register();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 23.h, bottom: 23.h),
                        child: Text(
                          MyTexts.signUP,
                          style: Styles.textStyle20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
