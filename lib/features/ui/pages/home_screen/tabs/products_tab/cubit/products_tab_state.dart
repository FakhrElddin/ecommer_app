import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/add_cart_response_entity.dart';
import 'package:ecommerce_app/domain/entities/products_response_entity.dart';

abstract class ProductsTabStates {}

final class ProductsTabInitialState extends ProductsTabStates {}

final class ProductsTabLoadingState extends ProductsTabStates {}

final class ProductsTabSuccessState extends ProductsTabStates {
  final ProductsResponseEntity productsResponseEntity;

  ProductsTabSuccessState({required this.productsResponseEntity});
}

final class ProductsTabErrorState extends ProductsTabStates {
  final Failures failure;

  ProductsTabErrorState({required this.failure});
}

final class AddToCartLoadingState extends ProductsTabStates {}

final class AddToCartSuccessState extends ProductsTabStates {
  final AddCartResponseEntity addCartResponseEntity;

  AddToCartSuccessState({required this.addCartResponseEntity});
}

final class AddToCartErrorState extends ProductsTabStates {
  final Failures failure;

  AddToCartErrorState({required this.failure});
}
