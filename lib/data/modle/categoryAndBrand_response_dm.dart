import 'package:ecommerce/domain/entities/categoryAndBrand_response_entity.dart';

class CategoryAndBrandResponseDm extends CategoryAndBrandsResponseEntity {
  String? statusMsg;
  String? message;
  CategoryAndBrandResponseDm(
      {super.results,
      super.metadata,
      super.data,
      this.statusMsg,
      this.message});

  CategoryAndBrandResponseDm.fromJson(Map<String, dynamic> json) {
    statusMsg = json["statusMsg"];
    message = json["message"];
    if (json["results"] is int) {
      results = json["results"];
    }
    if (json["metadata"] is Map) {
      metadata =
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  static List<CategoryAndBrandResponseDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(CategoryAndBrandResponseDm.fromJson).toList();
  }
}

class Data extends CategoryAndBrandDataEntity {
  Data(
      {super.id,
      super.name,
      super.slug,
      super.image,
      super.createdAt,
      super.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["image"] = image;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}

class Metadata extends MetadataEntity {
  Metadata({super.currentPage, super.numberOfPages, super.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    if (json["currentPage"] is int) {
      currentPage = json["currentPage"];
    }
    if (json["numberOfPages"] is int) {
      numberOfPages = json["numberOfPages"];
    }
    if (json["limit"] is int) {
      limit = json["limit"];
    }
  }

  static List<Metadata> fromList(List<Map<String, dynamic>> list) {
    return list.map(Metadata.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    return _data;
  }
}
