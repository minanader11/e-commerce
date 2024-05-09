import 'package:e_commerce/presentation/category/view/category_Screen.dart';
import 'package:e_commerce/presentation/favorite/view/favorite_Screen.dart';
import 'package:e_commerce/presentation/home/view/home_screen.dart';
import 'package:e_commerce/presentation/main/view_model/main_screen_state.dart';
import 'package:e_commerce/presentation/profile/view/profile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenViewModel extends Cubit<MainScreenStates>{
  MainScreenViewModel(): super(MainScreenInitialState());
  List<Widget> tabs=[HomeScreen(),CategoryScreen(),FavoriteScreen(),ProfileScreen()];
  int selectedIndex=0;
  void changeIndex(int newIndex){
    emit(MainScreenInitialState());
   selectedIndex = newIndex;
   emit(ChangeNavigationBarIndex());
  }

}