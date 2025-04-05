
import 'package:ecommerce/domain/entities/cart_response_entity.dart';

class CartResponseDm extends CartResponseEntity {


  CartResponseDm({super.status, super.message, super.numOfCartItems, super.cartId, super.data , super.statusMsg , super.statusCode });

  CartResponseDm.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    numOfCartItems = json["numOfCartItems"];
    cartId = json["cartId"];
    data = json["data"] == null ? null : CartDataDM.fromJson(json["data"]);
  }

  static List<CartResponseDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartResponseDm.fromJson).toList();
  }


}

class CartDataDM extends CartDataEntity {

  CartDataDM({super.id, super.cartOwner, super.products, super.createdAt, super.updatedAt, super.v, super.totalCartPrice});

  CartDataDM.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    cartOwner = json["cartOwner"];
    products = json["products"] == null ? null : (json["products"] as List).map((e) => CartProductsDM.fromJson(e)).toList();
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    totalCartPrice = json["totalCartPrice"];
  }

  static List<CartDataDM> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartDataDM.fromJson).toList();
  }


}

class CartProductsDM extends CartProductsEntity{


  CartProductsDM({super.count, super.id, super.product, super.price});

  CartProductsDM.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    id = json["_id"];
    product = json["product"];
    price = json["price"];
  }

  static List<CartProductsDM> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartProductsDM.fromJson).toList();
  }

}