import 'package:ecommerce_app/domain/entities/products_response_entity.dart';

class GetCartResponseEntity {
  GetCartResponseEntity({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
    this.statusMsg,
    this.message,
  });

  String? status;
  String? statusMsg;
  String? message;
  num? numOfCartItems;
  String? cartId;
  GetDataEntity? data;
}

class GetDataEntity {
  GetDataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<GetProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;
}

class GetProductsEntity {
  GetProductsEntity({this.count, this.id, this.product, this.price});

  num? count;
  String? id;
  ProductsDataEntity? product;
  num? price;
}
