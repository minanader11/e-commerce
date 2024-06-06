import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/data_source/Home_data_source.dart';
import 'package:e_commerce/domain/entities/AddOrGetToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/AddToWishlistResponseEntity.dart';
import 'package:e_commerce/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerce/domain/entities/GetUserCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/GetUserWishlistResponseEntity.dart';
import 'package:e_commerce/domain/entities/RemoveProductFromCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/RemoveProductFromWishlistResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/entities/productResponseEntity.dart';

class HomeRemoteDataSourceimpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceimpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>>
      getCategoires() async {
    var either = await apiManager.getCategories();
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getBrands() async {
    var either = await apiManager.getBrands();
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts([String? categoryId]) async {
    var either = await apiManager.getProducts(categoryId);

    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId, String token) async {
    var either = await apiManager.addToCart(productId, token);
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, AddToWishlistResponseEntity>> addToWishlist(String productId, String token) async{
    var either = await apiManager.addToWishlist(productId, token);
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, GetUserWishlistResponseEntity>> getWishlist(String token) async {
  var either = await apiManager.getWishlist(token);
  return either.fold((failure) {
    return Left(failure);
  }, (response) {
    return Right(response);
  });
  }

  @override
  Future<Either<Failures, GetUserCartResponseEntity>> getCart(String token) async{
   var either= await apiManager.getCart(token);
   return either.fold((failure) {
     return Left(failure);
   }, (response) {
     return Right(response);
   });
  }

  @override
  Future<Either<Failures, RemoveProductFromWishlistResponseEntity>> removeFromWishlist(String productId, String token) async{
   var either =await apiManager.removeFromWishlist(productId, token);
   return either.fold((failure) {
     return Left(failure);
   }, (response) {
     return Right(response);
   });
  }

  @override
  Future<Either<Failures, RemoveProductFromCartResponseEntity>> removeFromCart(String productId, String token) async{
   var either= await apiManager.removeFromCart(productId, token);
   return either.fold((failure) {
     return Left(failure);
   }, (response) {
     return Right(response);
   });
  }

  @override
  Future<Either<Failures, AddOrGetToCartResponseEntity>> updateProductFromCart(String productId, String token, String count) async{
   var either = await apiManager.updateProductFromCart(productId, token, count);
   return either.fold((failure) {
     return Left(failure);
   }, (response) {
     return Right(response);
   });
  }
}
