import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/products_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCasse {
  HomeRepository homeRepository;

  GetAllProductsUseCasse({required this.homeRepository});

  Future<Either<Failures, ProductsResponseEntity>> invoke() {
    return homeRepository.getAllProducts();
  }
}
