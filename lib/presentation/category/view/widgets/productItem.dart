import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/domain/entities/productResponseEntity.dart';
import 'package:e_commerce/presentation/auth/login/view_model/login_view_model.dart';
import 'package:e_commerce/presentation/category/view/widgets/product_details_screen.dart';
import 'package:e_commerce/presentation/category/view/widgets/rowProductITem.dart';
import 'package:e_commerce/presentation/category/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  ProductItem({required this.productEntity});

  ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    var loginCubit=BlocProvider.of<LoginViewModel>(context);
    var categoriesCubit=BlocProvider.of<CategoryViewModel>(context);
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(width: 1, color: Color(0xff004182).withOpacity(0.6)),
          borderRadius: BorderRadius.circular(13.r)),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(13.r),topLeft: Radius.circular(13.r)),
              child: Image.network(
                productEntity.imageCover ?? "",
                height: 128.h,
                width: 191.w,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(productEntity.title ?? '',
                        style: Styles.textStyle12
                            .copyWith(color: MyColors.primaryColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    Text('EGP ${productEntity.price}',
                        style: Styles.textStyle12
                            .copyWith(color: MyColors.primaryColor)),
                    Expanded(
                        child: RowProductItem(
                      productEntity: productEntity,
                    )),
                  ],
                ),
              ),
            ),

          ],
        ),
        Positioned(
          right: 8.w,
          top: 8.h,
          left: 160.w,
          child: InkWell(onTap: () {
            categoriesCubit.addToWishlist(productEntity.id!, loginCubit.token);

          },
            child: Container(

              decoration: BoxDecoration( boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
                  color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
              child: ImageIcon(
                color: MyColors.primaryColor,
                AssetImage(
                  MyTexts.favoriteActiveIcon,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
