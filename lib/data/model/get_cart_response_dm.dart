import 'package:ecommerce_app/data/model/products_response_dm.dart';
import 'package:ecommerce_app/domain/entities/get_cart_response_entity.dart';

class GetCartResponseDM extends GetCartResponseEntity {
  GetCartResponseDM({
    super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,
    super.statusMsg,
    super.message,
  });

  GetCartResponseDM.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetDataDM.fromJson(json['data']) : null;
  }
}

class GetDataDM extends GetDataEntity {
  GetDataDM({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetDataDM.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductsDM.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetProductsDM extends GetProductsEntity {
  GetProductsDM({super.count, super.id, super.product, super.price});

  GetProductsDM.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? ProductsDataDM.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}