import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartItemsUseCase {
  GetCartItemsUseCase({required this.cartRepository});

  CartRepository cartRepository;

  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return cartRepository.getCartItems();
  }
}
