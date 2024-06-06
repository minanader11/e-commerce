import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/domain/di.dart';
import 'package:e_commerce/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerce/presentation/auth/login/view_model/login_view_model.dart';
import 'package:e_commerce/presentation/category/view_model/category_view_model.dart';
import 'package:e_commerce/presentation/home/view/widgets/category_and_brand_grid_view.dart';
import 'package:e_commerce/presentation/home/view_model/home_states.dart';
import 'package:e_commerce/presentation/home/view_model/home_view_model.dart';
import 'package:e_commerce/presentation/utils/SearchTextFieldWithCart.dart';
import 'package:e_commerce/presentation/utils/imageSlider.dart';
import 'package:e_commerce/presentation/utils/textRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = HomeViewModel(
      getCategoriesUseCase: injectGetCategoriesUseCase(),
      getSubCategoriesUseCase: injectGetSubCategoriesUseCase());

  @override
  Widget build(BuildContext context) {
    var loginCubit=BlocProvider.of<LoginViewModel>(context);
    CategoryViewModel categoryCubit =BlocProvider.of<CategoryViewModel>(context);
    if(categoryCubit.badgeNumber=='0'){
      categoryCubit.getCart(loginCubit.token);
    }
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: viewModel..getCategories()..getSubCategories(),
      builder: (context, state) => Padding(
        padding: EdgeInsets.only(top: 50.h, left: 16.w),
        child: SingleChildScrollView(
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
                height: 16.h,
              ),
              const ImageSlider(),
              SizedBox(
                height: 24.h,
              ),
              TextRow(text: MyTexts.categories),
              SizedBox(
                height: 16.h,
              ),
              state is SubCategoriesLoadingState
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CategoryAndBrandGridView(
                      cateogryOrBrandDataEntityList: viewModel.categoriesList),
              TextRow(text: MyTexts.brands),
              SizedBox(
                height: 16.h,
              ),
              state is SubCategoriesLoadingState
                  ?
              Center(
                child: CircularProgressIndicator(),
              )
                  : state is SubCategoriesFailureState ?
              Center(
                child: Text(state.errMsg,),
              )
              :
              CategoryAndBrandGridView(
                cateogryOrBrandDataEntityList: viewModel.subCategoriesList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
