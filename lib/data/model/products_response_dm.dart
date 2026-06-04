import 'package:ecommerce_app/domain/entities/products_response_entity.dart';

class ProductsResponseDM extends ProductsResponseEntity {
  ProductsResponseDM({
    super.results,
    super.metadata,
    super.data,
    super.statusMsg,
    super.message,
  });

  ProductsResponseDM.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? ProductsMetadataDM.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductsDataDM.fromJson(v));
      });
    }
  }
}

class ProductsDataDM extends ProductsDataEntity {
  ProductsDataDM({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  ProductsDataDM.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(ProductsSubcategoryDM.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? ProductsCategoryDM.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? ProductsBrandDM.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  String? createdAt;
  String? updatedAt;
}

class ProductsBrandDM extends ProductsBrandEntity {
  ProductsBrandDM({super.id, super.name, super.slug, super.image});

  ProductsBrandDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class ProductsCategoryDM extends ProductsCategoryEntity {
  ProductsCategoryDM({super.id, super.name, super.slug, super.image});

  ProductsCategoryDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class ProductsSubcategoryDM extends ProductsSubcategoryEntity {
  ProductsSubcategoryDM({super.id, super.name, super.slug, super.category});

  ProductsSubcategoryDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class ProductsMetadataDM extends ProductsMetadataEntity {
  ProductsMetadataDM({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  ProductsMetadataDM.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
}
