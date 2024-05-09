import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/data_source/AuthenticationDataSourceImpl.dart';
import 'package:e_commerce/data/data_source/Home_data_source_impl.dart';
import 'package:e_commerce/data/repository/AuthenticationRepositoryImpl.dart';
import 'package:e_commerce/data/repository/Home_repository_impl.dart';
import 'package:e_commerce/domain/data_source/AuthenticationDataSource.dart';
import 'package:e_commerce/domain/data_source/Home_data_source.dart';
import 'package:e_commerce/domain/repository/Authentication_repository.dart';
import 'package:e_commerce/domain/repository/Home_repository.dart';
import 'package:e_commerce/domain/use_cases/addToCartUseCase.dart';
import 'package:e_commerce/domain/use_cases/getCategoriesUseCase.dart';
import 'package:e_commerce/domain/use_cases/getProductsUseCase.dart';
import 'package:e_commerce/domain/use_cases/getSubCategoriesUseCase.dart';
import 'package:e_commerce/domain/use_cases/loginUseCase.dart';
import 'package:e_commerce/domain/use_cases/registerUseCase.dart';

RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(authenticationRepository: injectAuthenticationRepository());
}
AuthenticationRepository injectAuthenticationRepository(){
  return AuthenticationRepositoryImpl(authenticationRemoteDataSource: injectAuthenticationRemoteDataSource());
}
AuthenticationRemoteDataSource injectAuthenticationRemoteDataSource(){
  return AuthenticationDataSourceimpl(apiManager: ApiManager.getInstance());
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(authenticationRepository: injectAuthenticationRepository());
}
GetCategoriesUseCase injectGetCategoriesUseCase(){
  return GetCategoriesUseCase(homeRepository: injectHomeRepository());

}
HomeRepository injectHomeRepository(){
  return HomeRepositoryImpl(homeRemoteDataSource: injectHomeRemoteDataSource());

}
HomeRemoteDataSource injectHomeRemoteDataSource(){
  return HomeRemoteDataSourceimpl(apiManager: ApiManager.getInstance());
}
GetBrandsUseCase injectGetSubCategoriesUseCase(){
  return GetBrandsUseCase(homeRepository: injectHomeRepository());

}
GetProductsUseCase injectGetProductUseCase(){
  return GetProductsUseCase(homeRepository: injectHomeRepository());
}
AddToCartUseCase injectAddToCartUseCase(){
  return AddToCartUseCase(homeRepository: injectHomeRepository());
}