import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/presentation/home/view/home_screen.dart';
import 'package:e_commerce/presentation/main/view_model/main_screen_state.dart';
import 'package:e_commerce/presentation/main/view_model/main_screen_view_model.dart';
import 'package:e_commerce/presentation/profile/view/profile_Screen.dart';
import 'package:e_commerce/presentation/utils/custom_buttom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = 'mainScreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenViewModel viewModel = MainScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenViewModel, MainScreenStates>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: MyColors.whiteColor,
            body: viewModel.tabs[viewModel.selectedIndex],
            bottomNavigationBar: CustomBottomNavigationBar(
              onTapFunction: (index) {
                viewModel.changeIndex(index);
              },
              selectedIndex: viewModel.selectedIndex,
            ),
          );
        });
  }
}
