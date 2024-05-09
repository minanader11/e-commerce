import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/repository/Home_repository.dart';

class GetBrandsUseCase{
  HomeRepository homeRepository;
  GetBrandsUseCase({required this.homeRepository});
  Future<Either<Failures,CategoriesOrBrandsResponseEntity>>invoke(){
    return homeRepository.getBrands();
}
}