import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerce/presentation/cart/view/cart_screen.dart';
import 'package:e_commerce/presentation/category/view/widgets/productsFilteredByCategoriesScreen.dart';
import 'package:e_commerce/presentation/category/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesAvatarItem extends StatelessWidget {
  CategoriesAvatarItem({required this.cateogryOrBrandDataEntity});

  CateogryOrBrandDataEntity cateogryOrBrandDataEntity;

  @override
  Widget build(BuildContext context) {
    var categoryCubit= BlocProvider.of<CategoryViewModel>(context);
    return InkWell(
      onTap: () {
        categoryCubit.getProducts(cateogryOrBrandDataEntity.id);

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductsFilteredByCategoriesScreen(categoryName:cateogryOrBrandDataEntity.name??'' ),
        ));}
      ,
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 100.h,
              width: 100.h,
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    cateogryOrBrandDataEntity.image ?? '',
                    fit: BoxFit.fill,
                    width: 100.w,
                    height: 100.h,
                  ),
                  // child: CachedNetworkImage(
                  //   imageUrl: cateogryOrBrandDataEntity.image!,
                  //   placeholder: (context, url) =>
                  //   CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) => const Icon(Icons.error),
                  // ),
                ),
                radius: 50.r,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              cateogryOrBrandDataEntity.name ?? '',
              style: Styles.textStyle14.copyWith(color: MyColors.primaryColor),
              softWrap: true,
              textAlign: TextAlign.center,
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ],
        ),
      ),
    );
  }
}
