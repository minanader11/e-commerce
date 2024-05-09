import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/domain/entities/productResponseEntity.dart';
import 'package:e_commerce/presentation/auth/login/view_model/login_view_model.dart';
import 'package:e_commerce/presentation/category/view_model/category_states.dart';
import 'package:e_commerce/presentation/category/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowProductItem extends StatelessWidget {
  RowProductItem({required this.productEntity});

  ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    var categoriesCubit=BlocProvider.of<CategoryViewModel>(context);
    var loginCubit=BlocProvider.of<LoginViewModel>(context);
    return Container( margin: EdgeInsets.only(right: 8.w, bottom: 8.h),
      child: Row(
        children: [
          Text(
            'review(4.6)',
            style: Styles.textStyle12.copyWith(color: MyColors.primaryColor),
          ),
          SizedBox(
            width: 4.w,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 16,
          ),
          Spacer(),
          InkWell(onTap: () {
            print(loginCubit.token);
            categoriesCubit.addToCart(
                productEntity.id.toString(), loginCubit.token);
          },
            child: Container(
             // margin: EdgeInsets.only(right: 8.w, bottom: 8.h),
              padding: EdgeInsets.only(right: 2.w, bottom: 2.h,left: 2.w,top: 2.h),
              decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.circular(20.r)),
              child: BlocBuilder<CategoryViewModel,CategoryStates>(builder:(context, state) {
                if(state is AddToCartLoadingState){
                  return CircularProgressIndicator();
                }else{
                  return Icon(
                    Icons.add,
                    color: MyColors.whiteColor,
                    size: 16.w,
                  );
                }
              },
              ),
            ),
          )
        ],
      ),
    );
  }
}
