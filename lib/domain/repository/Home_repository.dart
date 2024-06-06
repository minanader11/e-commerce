import 'package:dartz/dartz.dart';
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

abstract class HomeRepository{
  Future<Either<Failures,CategoriesOrBrandsResponseEntity>> getCategoires();
  Future<Either<Failures,CategoriesOrBrandsResponseEntity>>getBrands();
  Future<Either<Failures,ProductResponseEntity>>getProducts([String? categoryId]);
  Future<Either<Failures,AddToCartResponseEntity>>addToCart(String productId,String token);
  Future<Either<Failures,AddToWishlistResponseEntity>>addToWishlist(String productId,String token);
  Future<Either<Failures,GetUserWishlistResponseEntity>>getWishlist(String token);
  Future<Either<Failures,GetUserCartResponseEntity>>getCart(String token);
  Future<Either<Failures,RemoveProductFromWishlistResponseEntity>>removeFromWishlist(String productId,String token);
  Future<Either<Failures,RemoveProductFromCartResponseEntity>>removeFromCart(String productId,String token);
  Future<Either<Failures,AddOrGetToCartResponseEntity>>updateProductFromCart(String productId,String token,String count);
}