import 'package:ecommerce_app/domain/entities/categories_response_entity.dart';

class CategoriesResponseDm extends CategoriesResponseEntity{
  CategoriesResponseDm({
      super.results,
      super.metadata,
      super.data,
      super.statusMsg,
      super.message,
  });

  CategoriesResponseDm.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata = json['metadata'] != null ? MetadataDM.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDataDM.fromJson(v));
      });
    }
  }

}

class CategoryDataDM extends CategoryDataEntity{
  CategoryDataDM({
      super.id,
      super.name,
      super.slug,
      super.image,
      this.createdAt, 
      this.updatedAt,
  });

  CategoryDataDM.fromJson(dynamic json) {
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