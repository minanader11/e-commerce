import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/authenticationResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/repository/Authentication_repository.dart';

class LoginUseCase{
  AuthenticationRepository authenticationRepository;
  LoginUseCase({required this.authenticationRepository});
  Future<Either<Failures,AuthenticationResponseEntity>> login(String email,String password){
    return authenticationRepository.login(email, password);
  }
}