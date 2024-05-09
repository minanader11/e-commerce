import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/data_source/Home_data_source.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/CategoriesOrBrandsResponseEntity.dart';
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
  Future<Either<Failures, ProductResponseEntity>> getProducts() {
  return homeRemoteDataSource.getProducts();
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId, String token) {
  return homeRemoteDataSource.addToCart(productId, token);
  }

}