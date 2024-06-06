import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/GetUserWishlistResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/repository/Home_repository.dart';

class GetUserWishlistUseCase{
  HomeRepository homeRepository;
  GetUserWishlistUseCase({required this.homeRepository});
  Future<Either<Failures,GetUserWishlistResponseEntity>>invoke(String token){
    return homeRepository.getWishlist(token);
  }
}