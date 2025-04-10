class GetCartEntity {
  String? status;
  num? numOfCartItems;
  String? cartId;
  GetCartDataEntity? data;
  String? statusMsg;
  String? message;

  GetCartEntity({this.status, this.numOfCartItems, this.cartId, this.data , this.statusMsg ,this.message});
}

class GetCartDataEntity {
  String? id;
  String? cartOwner;
  List<GetCartProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  GetCartDataEntity(
      {this.id,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.totalCartPrice});
}

class GetCartProductsEntity {
  num? count;
  String? id;
  GetCartProductEntity? product;
  num? price;

  GetCartProductsEntity({this.count, this.id, this.product, this.price});
}

class GetCartProductEntity {
  List<GetCartSubcategoryEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  GetCartCategoryEntity? category;
  GetCartBrandEntity? brand;
  double? ratingsAverage;

  GetCartProductEntity(
      {this.subcategory,
      this.id,
      this.title,
      this.quantity,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage});
}

class GetCartBrandEntity {
  String? id;
  String? name;
  String? slug;
  String? image;

  GetCartBrandEntity({this.id, this.name, this.slug, this.image});
}

class GetCartCategoryEntity {
  String? id;
  String? name;
  String? slug;
  String? image;

  GetCartCategoryEntity({this.id, this.name, this.slug, this.image});
}

class GetCartSubcategoryEntity {
  String? id;
  String? name;
  String? slug;
  String? category;

  GetCartSubcategoryEntity({this.id, this.name, this.slug, this.category});
}
