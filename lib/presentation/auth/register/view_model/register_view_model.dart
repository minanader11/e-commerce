import 'package:e_commerce/domain/use_cases/registerUseCase.dart';
import 'package:e_commerce/presentation/auth/register/view_model/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<RegisterStates>{
  RegisterViewModel({required this.registerUseCase}):super(RegisterInitialState());
  RegisterUseCase registerUseCase;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void register()async {
  bool validate=  formKey.currentState!.validate();
  if(validate){
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(emailController.text, fullNameController.text, mobileNumberController.text, passwordController.text, passwordController.text);
    either.fold((l) {
      emit(RegisterErrorState(errorMsg: l.errMsg));
    }, (r) {
      emit(RegisterSuccessState(authenticationResponseEntity: r));
    });
  }
  }
}