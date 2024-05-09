import 'package:e_commerce/domain/entities/authenticationResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/loginUseCase.dart';
import 'package:e_commerce/presentation/auth/login/view_model/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginStates>{

  TextEditingController emailController = TextEditingController(text: 'nadermina30@gmail.com');
  TextEditingController passwordController = TextEditingController(text: '123456');
  final formKey = GlobalKey<FormState>();
  String token='';
  AuthenticationResponseEntity authenticationResponseEntity=AuthenticationResponseEntity();

  LoginViewModel({required this.loginUseCase}): super(LoginInitialState());
  LoginUseCase loginUseCase;
  void login()async {
    bool validate=  formKey.currentState!.validate();
    if(validate){
      emit(LoginLoadingState());
      var either = await loginUseCase.login(emailController.text, passwordController.text);
      either.fold((l) {
        emit(LoginErrorState(errorMsg: l.errMsg));
      }, (r) {
        token=r.token!;
        authenticationResponseEntity= r;
        emit(LoginSuccessState(authenticationResponseEntity: r));
      });
    }
  }

}