import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/data_source/Home_data_source.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/CategoriesOrBrandsResponseEntity.dart';
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
  Future<Either<Failures, ProductResponseEntity>> getProducts() async {
    var either = await apiManager.getProducts();
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId, String token) async {
    var either = await apiManager.addToCart(productId, token);
    return either.fold((l) => Left(l), (r) => Right(r));
  }
}
