
import 'package:ecommerce/domain/entities/productResponseEntity.dart';

class ProductResponseDm extends ProductResponseEntity{


  ProductResponseDm({super.results, super.metadata, super.data ,super.statusMsg ,super.message});

  ProductResponseDm.fromJson(Map<String, dynamic> json) {
    statusMsg = json["statusMsg"];
    message = json["message"];
    results = json["results"];
    metadata = json["metadata"] == null ? null : BroductMetadataDM.fromJson(json["metadata"]);
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  static List<ProductResponseDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductResponseDm.fromJson).toList();
  }


}

class Data extends ProductDataEN{


  Data({super.sold, super.images, super.subcategory, super.ratingsQuantity, super.id, super.title, super.slug, super.description, super.quantity, super.price, super.imageCover, super.category, super.brand, super.ratingsAverage, super.createdAt, super.updatedAt, });

  Data.fromJson(Map<String, dynamic> json) {
    sold = json["sold"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    subcategory = json["subcategory"] == null ? null : (json["subcategory"] as List).map((e) => Subcategory.fromJson(e)).toList();
    ratingsQuantity = json["ratingsQuantity"];
    id = json["_id"];
    title = json["title"];
    slug = json["slug"];
    description = json["description"];
    quantity = json["quantity"];
    price = json["price"];
    imageCover = json["imageCover"];
    category = json["category"] == null ? null : Category.fromJson(json["category"]);
    brand = json["brand"] == null ? null : Brand.fromJson(json["brand"]);
    ratingsAverage = json["ratingsAverage"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    id = json["id"];
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }


}

class Brand extends BroductBrandEN{


  Brand({super.id, super.name, super.slug, super.image});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    image = json["image"];
  }

  static List<Brand> fromList(List<Map<String, dynamic>> list) {
    return list.map(Brand.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["image"] = image;
    return _data;
  }
}

class Category  extends BroductCategoryEN{


  Category({super.id, super.name, super.slug, super.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    image = json["image"];
  }

  static List<Category> fromList(List<Map<String, dynamic>> list) {
    return list.map(Category.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["image"] = image;
    return _data;
  }
}

class Subcategory extends ProductSubcategoryEN{


  Subcategory({super.id, super.name, super.slug, super.category});

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    category = json["category"];
  }

  static List<Subcategory> fromList(List<Map<String, dynamic>> list) {
    return list.map(Subcategory.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["category"] = category;
    return _data;
  }
}

class BroductMetadataDM extends ProductMetadataEN {

  BroductMetadataDM({super.currentPage, super.numberOfPages, super.limit, super.nextPage});

  BroductMetadataDM.fromJson(Map<String, dynamic> json) {
    currentPage = json["currentPage"];
    numberOfPages = json["numberOfPages"];
    limit = json["limit"];
    nextPage = json["nextPage"];
  }

  static List<BroductMetadataDM> fromList(List<Map<String, dynamic>> list) {
    return list.map(BroductMetadataDM.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    _data["nextPage"] = nextPage;
    return _data;
  }
}