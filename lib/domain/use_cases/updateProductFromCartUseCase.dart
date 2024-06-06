import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/AddOrGetToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/repository/Home_repository.dart';

class UpdateProductFromCartUseCase{
  HomeRepository homeRepository;
  UpdateProductFromCartUseCase({required this.homeRepository});
  Future<Either<Failures,AddOrGetToCartResponseEntity>>invoke(String productId,String token,String count){
    return homeRepository.updateProductFromCart(productId, token, count);
  }
}