
import 'package:ecommerce/domain/entities/get_cart_productsEntity.dart';

class GetCartModle extends GetCartEntity{

  GetCartModle({super.status, super.numOfCartItems, super.cartId, super.data , super.message , super.statusMsg});

  GetCartModle.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    numOfCartItems = json["numOfCartItems"];
    cartId = json["cartId"];
    data = json["data"] == null ? null : GetCartDataModle.fromJson(json["data"]);
  }

  static List<GetCartModle> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetCartModle.fromJson).toList();
  }

}

class GetCartDataModle  extends GetCartDataEntity{


  GetCartDataModle({super.id, super.cartOwner, super.products, super.createdAt, super.updatedAt, super.v, super.totalCartPrice});

  GetCartDataModle.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    cartOwner = json["cartOwner"];
    products = json["products"] == null ? null : (json["products"] as List).map((e) => GetCartProductsModle.fromJson(e)).toList();
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    totalCartPrice = json["totalCartPrice"];
  }

  static List<GetCartDataModle> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetCartDataModle.fromJson).toList();
  }


}

class GetCartProductsModle extends GetCartProductsEntity {


  GetCartProductsModle({super.count, super.id, super.product, super.price});

  GetCartProductsModle.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    id = json["_id"];
    product = json["product"] == null ? null : GetCartProductModle.fromJson(json["product"]);
    price = json["price"];
  }

  static List<GetCartProductsModle> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetCartProductsModle.fromJson).toList();
  }


}

class GetCartProductModle  extends GetCartProductEntity  {



  GetCartProductModle({super.subcategory, super.id, super.title, super.quantity, super.imageCover, super.category, super.brand, super.ratingsAverage});

  GetCartProductModle.fromJson(Map<String, dynamic> json) {
    subcategory = json["subcategory"] == null ? null : (json["subcategory"] as List).map((e) => GetCartSubcategoryModle.fromJson(e)).toList();
    id = json["_id"];
    title = json["title"];
    quantity = json["quantity"];
    imageCover = json["imageCover"];
    category = json["category"] == null ? null : GetCartCategoryModle.fromJson(json["category"]);
    brand = json["brand"] == null ? null : GetCartBrandModle.fromJson(json["brand"]);
    ratingsAverage = json["ratingsAverage"];
    id = json["id"];
  }

  static List<GetCartProductModle> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetCartProductModle.fromJson).toList();
  }

}

class GetCartBrandModle extends GetCartBrandEntity{


  GetCartBrandModle({super.id, super.name, super.slug, super.image});

  GetCartBrandModle.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    image = json["image"];
  }

  static List<GetCartBrandModle> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetCartBrandModle.fromJson).toList();
  }


}

class GetCartCategoryModle extends GetCartCategoryEntity{


  GetCartCategoryModle({super.id, super.name, super.slug, super.image});

  GetCartCategoryModle.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    image = json["image"];
  }

  static List<GetCartCategoryModle> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetCartCategoryModle.fromJson).toList();
  }


}

class GetCartSubcategoryModle extends GetCartSubcategoryEntity {
  GetCartSubcategoryModle({super.id, super.name, super.slug, super.category});

  GetCartSubcategoryModle.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    category = json["category"];
  }

  static List<GetCartSubcategoryModle> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetCartSubcategoryModle.fromJson).toList();
  }


}