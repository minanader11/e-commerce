import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/presentation/auth/login/view_model/login_view_model.dart';
import 'package:e_commerce/presentation/cart/view/widgets/cartProductItem.dart';
import 'package:e_commerce/presentation/cart/view_model/cart_screen_states.dart';
import 'package:e_commerce/presentation/cart/view_model/cart_screen_view_model.dart';
import 'package:e_commerce/presentation/favorite/view/widgets/favorite_product_item.dart';
import 'package:e_commerce/presentation/utils/SearchTextFieldWithCart.dart';
import 'package:e_commerce/presentation/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loginCubit = BlocProvider.of<LoginViewModel>(context);
    var cartScreenViewModel = BlocProvider.of<CartScreenViewModel>(context)
      ..getCart(loginCubit.token);
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          MyTexts.cart,
          style: Styles.textStyle20,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: MyColors.primaryColor),
      ),
      body: BlocConsumer<CartScreenViewModel, CartScreenStates>(
        builder: (context, state) {
          if (state is GetCartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetCartFailureState) {
            return Center(
              child: Text(state.errMsg),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(top: 27.h, left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              height: 8.h,
                            ),
                        padding: EdgeInsets.zero,
                        itemCount: cartScreenViewModel.cartProducts.length,
                        itemBuilder: (context, index) => CartProductItem(
                            cartProducts:
                                cartScreenViewModel.cartProducts[index])),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total Price',
                            style: Styles.textStyle20.copyWith(
                                color: Color(0xff06004F).withOpacity(0.6)),
                          ),
                          Text(
                            '${cartScreenViewModel.cartPrice!.toString()} EGP',
                            style: Styles.textStyle20,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 33.w,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 11.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: MyColors.primaryColor),
                          child: Center(
                            child: Text(
                              'Check Out',
                              style: Styles.textStyle20
                                  .copyWith(color: MyColors.whiteColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 98.h,
                  ),
                ],
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is RemoveProductFromCartLoadingState ||
              state is UpdateProductFromCartLoadingState) {
            DialogUtils.showLoading(context: context);
          } else if (state is RemoveProductFromCartFailureState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context, message: state.errMsg, actionName: 'ok');
          } else if (state is UpdateProductFromCartFailureState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context, message: state.errMsg, actionName: 'ok');
          } else if (state is RemoveProductFromCartSuccessState ||
              state is UpdateProductFromCartSuccessState) {
            DialogUtils.hideLoading(context);
          }
        },
      ),
    );
  }
}
