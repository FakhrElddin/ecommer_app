import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/categories_or_brands_response_entity.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllBrands();
}
