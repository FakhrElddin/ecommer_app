import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/categories_response_entity.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoriesResponseEntity>> getAllCategories();
}