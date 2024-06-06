import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/entities/productResponseEntity.dart';
import 'package:e_commerce/domain/repository/Home_repository.dart';

class GetProductsUseCase{
  HomeRepository homeRepository;
  GetProductsUseCase({required this.homeRepository});
  Future<Either<Failures,ProductResponseEntity>> invoke([String? categoryId]){
    return homeRepository.getProducts(categoryId);
  }
}