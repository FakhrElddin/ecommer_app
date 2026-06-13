import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/get_cart_response_entity.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getCartItems();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemFromCart({
    required String productId,
  });

  Future<Either<Failures, GetCartResponseEntity>> updateCartItemQuantity({
    required String productId,
    required int count,
  });
}
