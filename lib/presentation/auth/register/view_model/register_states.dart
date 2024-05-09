import 'package:e_commerce/domain/entities/authenticationResponseEntity.dart';

abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  AuthenticationResponseEntity authenticationResponseEntity;
  RegisterSuccessState({required this.authenticationResponseEntity});
}
class RegisterErrorState extends RegisterStates{
  String errorMsg;
  RegisterErrorState({required this.errorMsg});
}