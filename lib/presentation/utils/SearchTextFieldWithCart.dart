import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/presentation/category/view_model/category_states.dart';
import 'package:e_commerce/presentation/category/view_model/category_view_model.dart';
import 'package:e_commerce/presentation/utils/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFieldWithCart extends StatelessWidget {
  SearchTextFieldWithCart({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CategoryViewModel viewModel =BlocProvider.of<CategoryViewModel>(context);

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            style: TextStyle(color: MyColors.primaryColor),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 16.h, bottom: 16.h),
              isCollapsed: true,
              isDense: true,
              filled: true,
              fillColor: MyColors.whiteColor,
              prefixIcon: Icon(Icons.search,size: 24,),
              prefixIconColor: MyColors.primaryColor,
              hintText: MyTexts.whatDoYouSearchFor,
              hintStyle:
                  Styles.textStyle16.copyWith(color: MyColors.descriptionColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: MyColors.primaryColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.primaryColor, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.redColor, width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.redColor, width: 2),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 24.w,
        ),
        BlocBuilder<CategoryViewModel,CategoryStates>(
          builder: (context, state) => Badge(label: Text(viewModel.badgeNumber),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: MyColors.primaryColor,
              size: 24,
            ),
          ),
        ),
        SizedBox(
          width: 17.w,
        ),
      ],
    );
  }
}
