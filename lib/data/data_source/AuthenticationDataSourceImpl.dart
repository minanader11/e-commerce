import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/model/response/authenticationResponseDto.dart';
import 'package:e_commerce/domain/data_source/AuthenticationDataSource.dart';
import 'package:e_commerce/domain/entities/authenticationResponseEntity.dart';

import 'package:e_commerce/domain/entities/failure.dart';

class AuthenticationDataSourceimpl implements AuthenticationRemoteDataSource {
  ApiManager apiManager;

  AuthenticationDataSourceimpl({required this.apiManager});

  @override
  Future<Either<Failures, AuthenticationResponseDto>> register(
      String email,
      String name,
      String phoneNumber,
      String password,
      String rePassword) async {
    var either = await apiManager.register(
        email, name, phoneNumber, password, rePassword);
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AuthenticationResponseEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(email, password);
    return either.fold((l) => Left(l), (r) => Right(r));
  }
}
