import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hint,
      this.keyboardType = TextInputType.text,
      required this.controller,
      required this.validator,
      this.obscureText = false});

  String hint;
  TextInputType keyboardType;
  TextEditingController controller;
  String? Function(String?) validator;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 16.w),
      child: TextFormField(
        style: TextStyle(color: MyColors.primaryColor),
        decoration: InputDecoration(filled: true,fillColor: MyColors.whiteColor,
          hintText: hint,
          hintStyle: Styles.textStyle16.copyWith(color: MyColors.blackColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyColors.whiteColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyColors.primaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyColors.redColor, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color:MyColors.redColor, width: 2),
          ),
        ),
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        obscureText: obscureText,

      ),
    );
  }
}
