import 'package:e_commerce/domain/entities/authenticationResponseEntity.dart';

abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  AuthenticationResponseEntity authenticationResponseEntity;
  LoginSuccessState({required this.authenticationResponseEntity});
}
class LoginErrorState extends LoginStates{
  String errorMsg;
  LoginErrorState({required this.errorMsg});
}