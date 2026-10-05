import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCartItemQuantityUseCase {
  UpdateCartItemQuantityUseCase({required this.cartRepository});

  CartRepository cartRepository;

  Future<Either<Failures, GetCartResponseEntity>> invoke({
    required String productId,
    required int count,
  }) {
    return cartRepository.updateCartItemQuantity(
      productId: productId,
      count: count,
    );
  }
}
