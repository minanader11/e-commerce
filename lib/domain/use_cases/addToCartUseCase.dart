import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/AddOrGetToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/repository/Home_repository.dart';

class AddToCartUseCase{
  HomeRepository homeRepository;
  AddToCartUseCase({required this.homeRepository});
  Future<Either<Failures, AddToCartResponseEntity>>invoke(
      String productId, String token) {
    return homeRepository.addToCart(productId, token);
  }
}