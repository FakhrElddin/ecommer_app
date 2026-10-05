import 'package:ecommerce_app/domain/entities/categories_or_brands_response_entity.dart';

class CategoriesOrBrandsResponseDm extends CategoriesOrBrandsResponseEntity{
  CategoriesOrBrandsResponseDm({
      super.results,
      super.metadata,
      super.data,
      super.statusMsg,
      super.message,
  });

  CategoriesOrBrandsResponseDm.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata = json['metadata'] != null ? MetadataDM.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandsDataDM.fromJson(v));
      });
    }
  }

}

class CategoryOrBrandsDataDM extends CategoryOrBrandsDataEntity{
  CategoryOrBrandsDataDM({
      super.id,
      super.name,
      super.slug,
      super.image,
      this.createdAt, 
      this.updatedAt,
  });

  CategoryOrBrandsDataDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? createdAt;
  String? updatedAt;

}

class MetadataDM extends MetadataEntity{
  MetadataDM({
      super.currentPage,
      super.numberOfPages,
      super.limit,
  });

  MetadataDM.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

}