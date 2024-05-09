import 'package:dartz/dartz.dart';

import 'package:e_commerce/domain/data_source/AuthenticationDataSource.dart';
import 'package:e_commerce/domain/entities/authenticationResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/repository/Authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository{
  AuthenticationRemoteDataSource authenticationRemoteDataSource;
  AuthenticationRepositoryImpl({required this.authenticationRemoteDataSource});
  @override
  Future<Either<Failures, AuthenticationResponseEntity>> register(String email, String name, String phoneNumber, String password, String rePassword) {
    return  authenticationRemoteDataSource.register(email, name, phoneNumber, password, rePassword);
  }

  @override
  Future<Either<Failures, AuthenticationResponseEntity>> login(String email, String password) {
    return authenticationRemoteDataSource.login(email, password);
  }
}