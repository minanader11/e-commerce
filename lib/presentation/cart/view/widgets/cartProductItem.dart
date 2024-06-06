import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/domain/entities/AddOrGetToCartResponseEntity.dart';
import 'package:e_commerce/presentation/auth/login/view_model/login_view_model.dart';
import 'package:e_commerce/presentation/cart/view_model/cart_screen_view_model.dart';
import 'package:e_commerce/presentation/category/view/widgets/addAndRemoveProductContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductItem extends StatelessWidget {
  AddOrGetToCartResponseProductsEntity cartProducts;

  CartProductItem({required this.cartProducts});

  @override
  Widget build(BuildContext context) {
    var loginCubit = BlocProvider.of<LoginViewModel>(context);
    var cartCubit = BlocProvider.of<CartScreenViewModel>(context);
    return Container(
      padding: EdgeInsets.only(right: 5.w),
      height: 113.h,
      width: 398.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border:
              Border.all(width: 1, color: Color(0xff004182).withOpacity(0.6))),
      child: Stack(children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                width: 120.w,
                height: 113.h,
                cartProducts.product!.imageCover!,
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
                    padding: EdgeInsets.only(right: 50.w),
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      cartProducts.product!.title ?? '',
                      style: Styles.textStyle18
                          .copyWith(color: MyColors.primaryColor),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${cartProducts.price} EGP',
                        style: Styles.textStyle18
                            .copyWith(color: MyColors.primaryColor),
                      ),
                      Spacer(),
                      // Container(
                      //   margin: EdgeInsets.only(right: 10.w),
                      //   padding: EdgeInsets.symmetric(
                      //       vertical: 9.h, horizontal: 10.w),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(16.r),
                      //       color: MyColors.primaryColor),
                      //   child: Center(
                      //     child: Text(
                      //       'Add to Cart',
                      //       style: Styles.textStyle14
                      //           .copyWith(color: MyColors.whiteColor),
                      //     ),
                      //   ),
                      // )
                      Container(
                        child: AddAndRemoveProductContainer(
                          onTapMinus: () => cartCubit.updateProductFromCart(
                              loginCubit.token,
                              cartProducts.product!.id!,
                              (cartProducts.count!.toInt() - 1).toString()),
                          number: cartProducts.count!.toInt(),
                          onTapPlus: () => cartCubit.updateProductFromCart(
                              loginCubit.token,
                              cartProducts.product!.id!,
                              (cartProducts.count!.toInt() + 1).toString()),
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
            child: InkWell(
              onTap: () => cartCubit.removeProductFromCart(
                  cartProducts.product!.id!, loginCubit.token),
              child: Icon(
                Icons.delete_rounded,
                color: MyColors.blackColor,
              ),
            )
            // Container(
            //   width: 30.w,
            //   height: 30.h,
            //   decoration: BoxDecoration(boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.withOpacity(0.5),
            //       spreadRadius: 3,
            //       blurRadius: 7,
            //       offset: Offset(0, 3), // changes position of shadow
            //     ),
            //   ], color: Colors.white, borderRadius: BorderRadius.circular(30.r)),
            //   child: Center(
            //     child: Image.asset(
            //       MyTexts.favoriteee,
            //       height: 24.h,
            //       width: 24.w,
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // ),
            ),
      ]),
    );
  }
}
