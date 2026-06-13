import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/get_cart_response_entity.dart';

abstract class CartStates {}

final class CartInitialState extends CartStates {}

final class GetCartItemsLoadingState extends CartStates {}

final class GetCartItemsSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  GetCartItemsSuccessState({required this.getCartResponseEntity});
}

final class GetCartItemsErrorState extends CartStates {
  Failures failure;

  GetCartItemsErrorState({required this.failure});
}

final class DeleteCartItemLoadingState extends CartStates {}

final class DeleteCartItemSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  DeleteCartItemSuccessState({required this.getCartResponseEntity});
}

final class DeleteCartItemErrorState extends CartStates {
  Failures failure;

  DeleteCartItemErrorState({required this.failure});
}
