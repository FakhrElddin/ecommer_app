class CategoriesResponseEntity {
  CategoriesResponseEntity({
      this.results, 
      this.metadata, 
      this.data,
      this.statusMsg,
      this.message,
  });

  int? results;
  MetadataEntity? metadata;
  List<CategoryDataEntity>? data;
  String? statusMsg;
  String? message;

}

class CategoryDataEntity {
  CategoryDataEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;

}

class MetadataEntity {
  MetadataEntity({
      this.currentPage, 
      this.numberOfPages, 
      this.limit,
  });

  int? currentPage;
  int? numberOfPages;
  int? limit;

}