import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/presentation/auth/login/view_model/login_view_model.dart';
import 'package:e_commerce/presentation/profile/view/widgets/customInfoItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginCubit=BlocProvider.of<LoginViewModel>(context);
    return SingleChildScrollView(
        child: Container(padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 50.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(MyTexts.routeIcon),

              SizedBox(height: 24.h,),
              Text('Welcome, ${loginCubit.authenticationResponseEntity.user!.name??''}',
                style: Styles.textStyle18.copyWith(
                    color: MyColors.primaryColor),),
              SizedBox(height: 40.h,),
              CustomInfoItem(text: MyTexts.yourEmail,
                  info:  loginCubit.authenticationResponseEntity.user!.email??""),
              SizedBox(height: 24.h,),
              CustomInfoItem(text: MyTexts.yourUserName,
                  info:  loginCubit.authenticationResponseEntity.user!.name??''),
              SizedBox(height: 24.h,),


            ],
          ),
        )

    );
  }
}
