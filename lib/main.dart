import 'package:e_commerce/domain/di.dart';
import 'package:e_commerce/presentation/auth/login/view/login_Screen.dart';
import 'package:e_commerce/presentation/auth/login/view_model/login_view_model.dart';
import 'package:e_commerce/presentation/auth/register/view/register_Screen.dart';
import 'package:e_commerce/presentation/cart/view_model/cart_screen_view_model.dart';
import 'package:e_commerce/presentation/category/view_model/category_view_model.dart';
import 'package:e_commerce/presentation/favorite/view_model/favorite_screen_view_model.dart';
import 'package:e_commerce/presentation/home/view/home_screen.dart';
import 'package:e_commerce/presentation/main/view/main_screen.dart';
import 'package:e_commerce/presentation/main/view_model/main_screen_view_model.dart';
import 'package:e_commerce/presentation/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginViewModel>(
          create: (context) =>
              LoginViewModel(loginUseCase: injectLoginUseCase()),
        ),
        BlocProvider<CategoryViewModel>(
          create: (context) => CategoryViewModel(getCartUseCase: injectGetCartUseCase(),
              addToCartUseCase: injectAddToCartUseCase(),
              getProductsUseCase: injectGetProductUseCase(),
              addToWishlistUseCase: injectAddToWishlistUseCase()),
        ),
        BlocProvider<MainScreenViewModel>(
          create: (context) => MainScreenViewModel(),
        ),
        BlocProvider<FavoriteScreenViewModel>(
          create: (context) => FavoriteScreenViewModel(
              addToCartUseCase: injectAddToCartUseCase(),
              removeProductFromWishlistUseCase:
                  injectRemoveProductFromWishlistUseCase(),
              getUserWishlistUseCase: injectGetUserWishlistUseCase()),
        ),
        BlocProvider<CartScreenViewModel>(
          create: (context) => CartScreenViewModel(updateProductFromCartUseCase: injectUpdateProductFromCartUseCase(),removeProductFromCartUseCase: injectRemoveProductFromCartUseCase(),
              getUserWishlistUseCase: injectGetCartUseCase()),
        )
      ],
      child: MyApp(),
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
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
