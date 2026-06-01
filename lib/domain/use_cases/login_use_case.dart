import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/login_response_entity.dart.dart';
import 'package:ecommerce_app/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failures, LoginResponseEntity>> invoke({
    required String email,
    required String password,
  }) {
    return authRepository.login(email: email, password: password);
  }
}
