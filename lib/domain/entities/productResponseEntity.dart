class ProductResponseEntity {
  num? results;
  ProductMetadataEN? metadata;
  List<ProductDataEN>? data;
  String? statusMsg;
  String? message;
  ProductResponseEntity({this.results, this.metadata, this.data , this.statusMsg , this.message});
}

class ProductDataEN {
  num? sold;
  List<String>? images;
  List<ProductSubcategoryEN>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  BroductCategoryEN? category;
  BroductBrandEN? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  ProductDataEN(
      {this.sold,
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
      this.createdAt,
      this.updatedAt,
      });
}

class BroductBrandEN {
  String? id;
  String? name;
  String? slug;
  String? image;

  BroductBrandEN({this.id, this.name, this.slug, this.image});
}

class BroductCategoryEN {
  String? id;
  String? name;
  String? slug;
  String? image;

  BroductCategoryEN({this.id, this.name, this.slug, this.image});
}

class ProductSubcategoryEN {
  String? id;
  String? name;
  String? slug;
  String? category;

  ProductSubcategoryEN({this.id, this.name, this.slug, this.category});
}

class ProductMetadataEN {
  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

  ProductMetadataEN({this.currentPage, this.numberOfPages, this.limit, this.nextPage});
}
