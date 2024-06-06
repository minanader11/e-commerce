import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/RemoveProductFromCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/repository/Home_repository.dart';

class RemoveProductFromCartUseCase{
  HomeRepository homeRepository;
  RemoveProductFromCartUseCase({required this.homeRepository});
  Future<Either<Failures,RemoveProductFromCartResponseEntity>>invoke(String productId,String token) async {
    return homeRepository.removeFromCart(productId, token);
  }
}