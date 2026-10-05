import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/categories_or_brands_response_entity.dart';

abstract class HomeTabStates {}

class HomeTabInitState extends HomeTabStates {}

class HomeTabCategoriesLoadingState extends HomeTabStates {}

class HomeTabCategoriesSuccessState extends HomeTabStates {
  final CategoriesOrBrandsResponseEntity categoriesResponseEntity;

  HomeTabCategoriesSuccessState({required this.categoriesResponseEntity});
}

class HomeTabCategoriesErrorState extends HomeTabStates {
  final Failures failure;

  HomeTabCategoriesErrorState({required this.failure});
}

class HomeTabBrandsLoadingState extends HomeTabStates {}

class HomeTabBrandsSuccessState extends HomeTabStates {
  final CategoriesOrBrandsResponseEntity brandsResponseEntity ;

  HomeTabBrandsSuccessState({required this.brandsResponseEntity});
}

class HomeTabBrandsErrorState extends HomeTabStates {
  final Failures failure;

  HomeTabBrandsErrorState({required this.failure});
}