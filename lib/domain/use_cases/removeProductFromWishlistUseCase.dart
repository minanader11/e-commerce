import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/RemoveProductFromWishlistResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/repository/Home_repository.dart';

class RemoveProductFromWishlistUseCase{
  HomeRepository homeRepository;
  RemoveProductFromWishlistUseCase({required this.homeRepository});
  Future<Either<Failures,RemoveProductFromWishlistResponseEntity>>invoke(String productId,String token){
    return homeRepository.removeFromWishlist(productId, token);
  }
}