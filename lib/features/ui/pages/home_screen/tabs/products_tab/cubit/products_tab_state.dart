import 'package:ecommerce_app/core/errors/failures.dart';
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
