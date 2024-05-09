import 'package:e_commerce/domain/di.dart';
import 'package:e_commerce/presentation/auth/login/view/login_Screen.dart';
import 'package:e_commerce/presentation/auth/login/view_model/login_view_model.dart';
import 'package:e_commerce/presentation/auth/register/view/register_Screen.dart';
import 'package:e_commerce/presentation/category/view_model/category_view_model.dart';
import 'package:e_commerce/presentation/home/view/home_screen.dart';
import 'package:e_commerce/presentation/main/view/main_screen.dart';
import 'package:e_commerce/presentation/main/view_model/main_screen_view_model.dart';
import 'package:e_commerce/presentation/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: [...DevicePreview.defaultTools],
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider<LoginViewModel>(
            create: (context) =>
                LoginViewModel(loginUseCase: injectLoginUseCase()),
          ),
          BlocProvider<CategoryViewModel>(
            create: (context) => CategoryViewModel(
                addToCartUseCase: injectAddToCartUseCase(),
                getProductsUseCase: injectGetProductUseCase()),
          ),
          BlocProvider<MainScreenViewModel>(
            create: (context) => MainScreenViewModel(),
          )
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          MainScreen.routeName: (context) => MainScreen(),
        },
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}
