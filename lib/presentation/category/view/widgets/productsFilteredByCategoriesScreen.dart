import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/presentation/category/view/widgets/productsGridView.dart';
import 'package:e_commerce/presentation/category/view_model/category_states.dart';
import 'package:e_commerce/presentation/category/view_model/category_view_model.dart';
import 'package:e_commerce/presentation/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsFilteredByCategoriesScreen extends StatelessWidget {
  String categoryName;

  ProductsFilteredByCategoriesScreen({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    var categoryCubit = BlocProvider.of<CategoryViewModel>(context);
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
          iconTheme: IconThemeData(color: MyColors.primaryColor),
          title: Text(
            categoryName,
            style: Styles.textStyle20,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
        child: BlocConsumer<CategoryViewModel, CategoryStates>(
          listener: (context, state) {
            if (state is AddToWishlistLoadingState ||
                state is AddToCartLoadingState) {
              DialogUtils.showLoading(context: context);
            } else if (state is AddToWishlistSuccessState ||
                state is AddToCartSuccessState) {
              DialogUtils.hideLoading(context);
            }
          },
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CategorySuccessState ||
                state is AddToCartSuccessState ||
                state is AddToWishlistSuccessState ||
                state is AddToWishlistLoadingState ||
                state is AddToCartLoadingState) {
              return categoryCubit.filteredProducts.length !=0?ProductsGridView(
                products: categoryCubit.filteredProducts,
              ): Center(child: Text('Sorry, No Products Found For That Category',style: Styles.textStyle20,textAlign: TextAlign.center,),);
            } else if (state is CategoryFailureState) {
              return Center(
                child: Container(color: Colors.red, child: Text(state.errMsg)),
              );
            } else {
              return Container(
                color: Colors.red,
              );
            }
          },
        ),
      ),
    );
  }
}
