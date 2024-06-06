import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/AddToWishlistResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/repository/Home_repository.dart';

class AddToWishlistUseCase{
  HomeRepository homeRepository;
  AddToWishlistUseCase({required this.homeRepository});
  Future<Either<Failures,AddToWishlistResponseEntity>>invoke(String productId,String token){
    return homeRepository.addToWishlist(productId, token);
  }
}