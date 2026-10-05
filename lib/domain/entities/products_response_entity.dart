class ProductsResponseEntity {
  ProductsResponseEntity({
    this.results,
    this.metadata,
    this.data,
    this.statusMsg,
    this.message,
  });

  num? results;
  ProductsMetadataEntity? metadata;
  List<ProductsDataEntity>? data;
  String? statusMsg;
  String? message;
}

class ProductsDataEntity {
  ProductsDataEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  num? sold;
  List<String>? images;
  List<ProductsSubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  ProductsCategoryEntity? category;
  ProductsBrandEntity? brand;
  num? ratingsAverage;
}

class ProductsBrandEntity {
  ProductsBrandEntity({this.id, this.name, this.slug, this.image});

  String? id;
  String? name;
  String? slug;
  String? image;
}

class ProductsCategoryEntity {
  ProductsCategoryEntity({this.id, this.name, this.slug, this.image});

  String? id;
  String? name;
  String? slug;
  String? image;
}

class ProductsSubcategoryEntity {
  ProductsSubcategoryEntity({this.id, this.name, this.slug, this.category});

  String? id;
  String? name;
  String? slug;
  String? category;
}

class ProductsMetadataEntity {
  ProductsMetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;
}
