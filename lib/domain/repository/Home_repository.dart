import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/entities/productResponseEntity.dart';

abstract class HomeRepository{
  Future<Either<Failures,CategoriesOrBrandsResponseEntity>> getCategoires();
  Future<Either<Failures,CategoriesOrBrandsResponseEntity>>getBrands();
  Future<Either<Failures,ProductResponseEntity>>getProducts();
  Future<Either<Failures,AddToCartResponseEntity>>addToCart(String productId,String token);

}