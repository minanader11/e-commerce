import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextRow extends StatelessWidget {
  TextRow({required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 17.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Styles.textStyle18.copyWith(color: MyColors.primaryColor),
          ),
          Text(
            MyTexts.viewAll,
            style: Styles.textStyle12.copyWith(color: MyColors.primaryColor),
          )
        ],
      ),
    );
  }
}
