import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:ecommerce_app/domain/repositories/data_sources/remote_data_sources/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl({required this.remoteDataSource});

  CartRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCartItems() async {
    var either = await remoteDataSource.getCartItems();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemFromCart({
    required String productId,
  }) async {
    var either = await remoteDataSource.deleteItemFromCart(
      productId: productId,
    );
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCartItemQuantity({
    required String productId,
    required int count,
  }) async {
    var either = await remoteDataSource.updateCartItemQuantity(
      productId: productId,
      count: count,
    );
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
