import 'package:dartz/dartz.dart';

import 'package:e_commerce/domain/entities/authenticationResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';

abstract class AuthenticationRemoteDataSource{
  Future<Either<Failures,AuthenticationResponseEntity>>register(String email,String name,String phoneNumber,String password,String rePassword);
  Future<Either<Failures,AuthenticationResponseEntity>>login(String email,String password);
}