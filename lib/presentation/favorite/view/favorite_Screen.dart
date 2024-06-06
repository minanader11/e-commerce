import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/presentation/auth/login/view_model/login_view_model.dart';
import 'package:e_commerce/presentation/cart/view_model/cart_screen_view_model.dart';
import 'package:e_commerce/presentation/favorite/view/widgets/favorite_product_item.dart';
import 'package:e_commerce/presentation/favorite/view_model/favorite_screen_states.dart';
import 'package:e_commerce/presentation/favorite/view_model/favorite_screen_view_model.dart';
import 'package:e_commerce/presentation/utils/SearchTextFieldWithCart.dart';
import 'package:e_commerce/presentation/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginCubit = BlocProvider.of<LoginViewModel>(context);
    var favoriteScreenViewModel =
    BlocProvider.of<FavoriteScreenViewModel>(context)
      ..getUserWishlist(loginCubit.token);
    return BlocConsumer<FavoriteScreenViewModel, FavoriteScreenStates>(
        listener: (context, state) {
          if (state is AddToCartInFavoriteLoadingState || state is RemoveProductLoadingState) {
            DialogUtils.showLoading(context: context);
          } else if (state is AddToCartInFavoriteFailureState) {
            DialogUtils.showMessage(
                context: context, message: state.errMsg, actionName: 'ok');
          }
          else if (state is AddToCartInFavoriteSuccessState||state is RemoveProductSuccessState){
            DialogUtils.hideLoading(context);
          } else if(state is RemoveProductFailureState){
            DialogUtils.showMessage(
                context: context, message: state.errMsg, actionName: 'ok');
          }
          ;
        },
        builder: (context, state)
    {
      if (state is GetWishlistLoadingState ) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is GetWishlistFailureState) {
        return Center(
          child: Text(state.errMsg),
        );
      } else {
        return Padding(
          padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22.h,
                width: 66.w,
                child: Image.asset(MyTexts.routeIcon),
              ),
              SizedBox(
                height: 18.h,
              ),
              SearchTextFieldWithCart(),
              SizedBox(
                height: 24.h,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 8.h,),
                  padding: EdgeInsets.zero,
                  itemCount: favoriteScreenViewModel.favProducts.length,
                  itemBuilder: (context, index) =>
                      FavoriteProductItem(
                          productEntity:
                          favoriteScreenViewModel.favProducts[index]),
                ),
              ),
              SizedBox(height: 20.h,)
            ],
          ),
        );
      }
    },

    );

  }
}
