import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/authenticationResponseEntity.dart';
import 'package:e_commerce/domain/entities/failure.dart';
import 'package:e_commerce/domain/repository/Authentication_repository.dart';

class RegisterUseCase{
  AuthenticationRepository authenticationRepository;
  RegisterUseCase({required this.authenticationRepository});

  Future<Either<Failures,AuthenticationResponseEntity>> invoke(String email,String name,String phoneNumber,String password,String rePassword){
   return authenticationRepository.register(email, name, phoneNumber, password, rePassword);
  }

}