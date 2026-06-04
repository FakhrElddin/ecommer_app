import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/data/model/categories_or_brands_response_dm.dart';
import 'package:ecommerce_app/data/model/products_response_dm.dart';
import 'package:ecommerce_app/domain/repositories/data_sources/remote_data_sources/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseDm>>
  getAllCategories() async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllCategoriesEndPoint,
        );
        var categoriesResponse = CategoriesOrBrandsResponseDm.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoriesResponse);
        } else {
          return Left(ServerError(errorMessage: categoriesResponse.message!));
        }
      } else {
        return Left(NetworkError());
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioException(e));
      } else {
        return Left(Failures(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseDm>> getAllBrands() async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllBrandsEndPoint,
          queryParameters: {'limit': 50},
        );
        var brandsResponse = CategoriesOrBrandsResponseDm.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandsResponse);
        } else {
          return Left(ServerError(errorMessage: brandsResponse.message!));
        }
      } else {
        return Left(NetworkError());
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioException(e));
      } else {
        return Left(Failures(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, ProductsResponseDM>> getAllProducts() async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllProductsEndPoint,
          // queryParameters: {
          //   'limit': ,
          //   'sort': ,
          //   'fields': ,
          //   'price[gte]': ,
          //   'page': ,
          //   'keyword': ,
          //   'brand': ,
          //   'price[lte]': ,
          //   'category[in]': ,
          // },
        );
        var productsResponse = ProductsResponseDM.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productsResponse);
        } else {
          return Left(ServerError(errorMessage: productsResponse.message!));
        }
      } else {
        return Left(NetworkError());
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioException(e));
      } else {
        return Left(Failures(errorMessage: e.toString()));
      }
    }
  }
}
