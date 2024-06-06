import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/GetUserCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/repository/Home_repository.dart';

class GetCartUseCase{
  HomeRepository homeRepository;
  GetCartUseCase({required this.homeRepository});
  Future<Either<Failures,GetUserCartResponseEntity>>invoke(String token){
    return homeRepository.getCart(token);
  }
}