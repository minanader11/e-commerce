import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/domain/entities/productResponseEntity.dart';
import 'package:e_commerce/presentation/auth/login/view_model/login_view_model.dart';
import 'package:e_commerce/presentation/category/view_model/category_states.dart';

import 'package:e_commerce/presentation/favorite/view_model/favorite_screen_states.dart';
import 'package:e_commerce/presentation/favorite/view_model/favorite_screen_view_model.dart';
import 'package:e_commerce/presentation/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteProductItem extends StatelessWidget {
  ProductEntity productEntity;

  FavoriteProductItem({required this.productEntity});

  @override
  Widget build(BuildContext context) {
    var loginCubit = BlocProvider.of<LoginViewModel>(context);
    var favoriteCubit = BlocProvider.of<FavoriteScreenViewModel>(context);
    return Container(
      padding: EdgeInsets.only(right: 5.w),
      height: 113.h,
      width: 398.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border:
              Border.all(width: 1, color: Color(0xff004182).withOpacity(0.6))),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  width: 120.w,
                  height: 113.h,
                  productEntity.imageCover!,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: 50.w),
                      child: Text(
                        productEntity.title ?? '',maxLines: 1,overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle18
                            .copyWith(color: MyColors.primaryColor),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${productEntity.price} EGP',maxLines: 1,
                          style: Styles.textStyle18
                              .copyWith(color: MyColors.primaryColor,),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () => favoriteCubit.addToCart(
                              productEntity.id!, loginCubit.token),
                          child: Container(
                            margin: EdgeInsets.only(right: 10.w),
                            padding: EdgeInsets.symmetric(
                                vertical: 9.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: MyColors.primaryColor),
                            child: Center(
                                child: Text(
                              'Add to Cart',
                              style: Styles.textStyle14
                                  .copyWith(color: MyColors.whiteColor),
                            )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            right: 16.w,
            left: 340.w,
            top: 8.h,
            child: InkWell(onTap:() => favoriteCubit.removeProductFromWishlist(productEntity.id!, loginCubit.token),
              child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Center(
                      child: Image.asset(
                    MyTexts.favoriteee,
                    height: 24.h,
                    width: 24.w,
                    fit: BoxFit.contain,
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}
