import 'package:dartz/dartz.dart';
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
import 'package:e_commerce/domain/repository/Home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getCategoires() {
    return homeRemoteDataSource.getCategoires();
  }

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getBrands() {
   return homeRemoteDataSource.getBrands();
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts([String? categoryId]) {
  return homeRemoteDataSource.getProducts(categoryId);
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId, String token) {
  return homeRemoteDataSource.addToCart(productId, token);
  }

  @override
  Future<Either<Failures, AddToWishlistResponseEntity>> addToWishlist(String productId, String token) {
    return homeRemoteDataSource.addToWishlist(productId, token);
  }

  @override
  Future<Either<Failures, GetUserWishlistResponseEntity>> getWishlist(String token) {
 return homeRemoteDataSource.getWishlist(token);
  }

  @override
  Future<Either<Failures, GetUserCartResponseEntity>> getCart(String token) {
   return homeRemoteDataSource.getCart(token);
  }

  @override
  Future<Either<Failures, RemoveProductFromWishlistResponseEntity>> removeFromWishlist(String productId, String token) {
    return homeRemoteDataSource.removeFromWishlist(productId, token);
  }

  @override
  Future<Either<Failures, RemoveProductFromCartResponseEntity>> removeFromCart(String productId, String token) {
return homeRemoteDataSource.removeFromCart(productId, token);
  }

  @override
  Future<Either<Failures, AddOrGetToCartResponseEntity>> updateProductFromCart(String productId, String token, String count) {
    return homeRemoteDataSource.updateProductFromCart(productId, token, count);
  }

}