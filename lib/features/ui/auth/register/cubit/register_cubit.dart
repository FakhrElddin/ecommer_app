import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/use_cases/register_use_case.dart';
import 'package:ecommerce_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitState());
  RegisterUseCase registerUseCase;
  TextEditingController nameController = TextEditingController(text: 'xyz');
  TextEditingController phoneController = TextEditingController(text: '01010700701');
  TextEditingController emailController = TextEditingController(text: 'conas@nuitx.com');
  TextEditingController passwordController = TextEditingController(text: 'Ahmed@123');
  TextEditingController rePasswordController = TextEditingController(text: 'Ahmed@123');
  var formKey = GlobalKey<FormState>();

  void register() async {
    if(formKey.currentState?.validate() ?? false){
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        rePassword: rePasswordController.text,
        phone: phoneController.text,
      );
      either.fold(
            (failure) => emit(RegisterErrorState(failure: failure)),
            (response) =>
            emit(RegisterSuccessState(registerResponseEntity: response)),
      );
    }
  }
}
