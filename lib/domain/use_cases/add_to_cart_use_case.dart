import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/add_cart_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  AddToCartUseCase({required this.homeRepository});

  HomeRepository homeRepository;

  Future<Either<Failures, AddCartResponseEntity>> invoke({
    required String productId,
  }) {
    return homeRepository.addToCart(productId: productId);
  }
}
