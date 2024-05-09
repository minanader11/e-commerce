import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/presentation/main/view_model/main_screen_state.dart';
import 'package:e_commerce/presentation/main/view_model/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({required this.selectedIndex,required this.onTapFunction});
  int selectedIndex;
  void Function(int)? onTapFunction;
  @override
  Widget build(BuildContext context) {
     var mainScreenCubit = BlocProvider.of<MainScreenViewModel>(context);
    return BlocBuilder<MainScreenViewModel,MainScreenStates>(
      builder: (context, state) => Theme(
        data: Theme.of(context).copyWith(canvasColor: MyColors.primaryColor),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              10.r,
            ),
            topLeft: Radius.circular(
              10.r,
            ),
          ),
          child: BottomNavigationBar(
              currentIndex:selectedIndex,
              onTap: onTapFunction,
              showSelectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20.r)),
                    child: ImageIcon(color: MyColors.primaryColor,
                      AssetImage(
                        MyTexts.homeActiveIcon,
                      ),
                    ),
                  ),
                  label: 'home',
                  icon: ImageIcon(
                    AssetImage(
                      MyTexts.homeIcon,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon:  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20.r)),
                    child: ImageIcon(color: MyColors.primaryColor,
                      AssetImage(
                        MyTexts.categoryActiveIcon,
                      ),
                    ),
                  ),
                  label: 'category',
                  icon: ImageIcon(
                    AssetImage(
                      MyTexts.categoryIcon,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20.r)),
                    child: ImageIcon(color: MyColors.primaryColor,
                      AssetImage(
                        MyTexts.favoriteActiveIcon,
                      ),
                    ),
                  ),
                  label: 'favorite',
                  icon: ImageIcon(
                    AssetImage(
                      MyTexts.favoriteIcon,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon:  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20.r)),
                    child: ImageIcon(color: MyColors.primaryColor,
                      AssetImage(
                        MyTexts.profileActiveIcon,
                      ),
                    ),
                  ),
                  label: 'profile',
                  icon: ImageIcon(
                    AssetImage(
                      MyTexts.profileIcon,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
