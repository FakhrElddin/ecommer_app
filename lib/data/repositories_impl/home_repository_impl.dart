import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/categories_or_brands_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/data_sources/remote_data_sources/home_remote_data_source.dart';
import 'package:ecommerce_app/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllCategories() async {
    var either = await remoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllBrands() async {
    var either = await remoteDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
