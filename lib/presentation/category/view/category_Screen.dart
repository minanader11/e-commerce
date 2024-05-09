import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/domain/di.dart';
import 'package:e_commerce/presentation/category/view/widgets/productsGridView.dart';
import 'package:e_commerce/presentation/category/view_model/category_states.dart';
import 'package:e_commerce/presentation/category/view_model/category_view_model.dart';
import 'package:e_commerce/presentation/utils/SearchTextFieldWithCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryViewModel viewModel =BlocProvider.of<CategoryViewModel>(context)..getProducts();
    return Padding(
      padding: EdgeInsets.only(top: 50.h, left: 16.w),
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
          BlocBuilder<CategoryViewModel,CategoryStates>(builder: (context, state) {
            if(state is CategoryLoadingState|| state is AddToCartLoadingState){
              return Center(child: CircularProgressIndicator(),);
            } else if (state is CategorySuccessState || state is AddToCartSuccessState){
              return  Expanded(child: ProductsGridView(products: viewModel.products,));
            } else if (state is CategoryFailureState ){
              return Center(child: Container(color: Colors.red,child: Text(state.errMsg)),);
            } else {
              return Container(color: Colors.red,);
            }
          },)

        ],
      ),
    );
  }
}