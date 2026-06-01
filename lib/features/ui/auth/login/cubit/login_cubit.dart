import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitState());
  LoginUseCase loginUseCase;

  TextEditingController userNameController = TextEditingController(text: 'conas@nuitx.com');
  TextEditingController passwordController = TextEditingController(text: 'Ahmed@123');
  var formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
        email: userNameController.text,
        password: passwordController.text,
      );
      either.fold(
        (failure) => emit(LoginErrorState(failure: failure)),
        (response) => emit(LoginSuccessState(loginResponseEntity: response)),
      );
    }
  }
}
