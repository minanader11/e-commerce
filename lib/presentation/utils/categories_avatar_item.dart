import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesAvatarItem extends StatelessWidget {
   CategoriesAvatarItem({required this.cateogryOrBrandDataEntity});
CateogryOrBrandDataEntity cateogryOrBrandDataEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Column(mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100.h,
            width: 100.h,
            child: CircleAvatar(
              child:  ClipOval(
                child: Image.network(
                  cateogryOrBrandDataEntity.image??'',fit: BoxFit.fill,width: 100.w,height: 100.h,
                ),
              ),radius: 50.r,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            cateogryOrBrandDataEntity.name??'',
            style: Styles.textStyle14.copyWith(color: MyColors.primaryColor),
            softWrap: true,
           textAlign: TextAlign.center,
            textWidthBasis: TextWidthBasis.longestLine,

          ),
        ],
      ),
    );
  }
}
