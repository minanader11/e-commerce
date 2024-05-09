import 'package:e_commerce/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerce/presentation/utils/categories_avatar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryAndBrandGridView extends StatelessWidget {
   CategoryAndBrandGridView({required this.cateogryOrBrandDataEntityList});
  List<CateogryOrBrandDataEntity> cateogryOrBrandDataEntityList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 326.h,
      child: GridView.builder(padding: EdgeInsets.zero,itemCount: cateogryOrBrandDataEntityList.length,scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return CategoriesAvatarItem(cateogryOrBrandDataEntity: cateogryOrBrandDataEntityList[index],);
          },),
    );
  }
}
