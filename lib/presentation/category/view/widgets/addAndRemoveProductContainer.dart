import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAndRemoveProductContainer extends StatelessWidget {
  int number;
  void Function()? onTapMinus;
  void Function()? onTapPlus;
  AddAndRemoveProductContainer({this.number=1,this.onTapMinus,this.onTapPlus});
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.symmetric(vertical: 11.h,horizontal: 16.w),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: MyColors.primaryColor),
      child: Row(children: [
        InkWell(onTap: onTapMinus,child: ImageIcon(AssetImage(MyTexts.iconMinus),color: MyColors.whiteColor)),
        SizedBox(width: 22.w,),
        Text(number.toString(),style: Styles.textStyle18,),
        SizedBox(width: 22.w,),
        InkWell(onTap: onTapPlus,child: ImageIcon(AssetImage(MyTexts.iconPlus),color: MyColors.whiteColor)),

      ]),
    );
  }
}
