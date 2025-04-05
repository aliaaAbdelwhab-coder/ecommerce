
class CategoryAndBrandsResponseEntity {
  int? results;
  MetadataEntity? metadata;
  List<CategoryAndBrandDataEntity>? data;

  CategoryAndBrandsResponseEntity({this.results, this.metadata, this.data});

}

class CategoryAndBrandDataEntity {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryAndBrandDataEntity({this.id, this.name, this.slug, this.image, this.createdAt, this.updatedAt});




}

class MetadataEntity {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  MetadataEntity({this.currentPage, this.numberOfPages, this.limit});

}