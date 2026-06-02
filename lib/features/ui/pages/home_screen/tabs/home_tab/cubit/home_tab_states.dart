import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/categories_response_entity.dart';

abstract class HomeTabStates {}

class HomeTabInitState extends HomeTabStates {}

class HomeTabCategoriesLoadingState extends HomeTabStates {}

class HomeTabCategoriesSuccessState extends HomeTabStates {
  final CategoriesResponseEntity categoriesResponseEntity;

  HomeTabCategoriesSuccessState({required this.categoriesResponseEntity});
}

class HomeTabCategoriesErrorState extends HomeTabStates {
  final Failures failure;

  HomeTabCategoriesErrorState({required this.failure});
}
