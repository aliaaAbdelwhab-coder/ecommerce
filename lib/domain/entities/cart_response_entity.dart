class CartResponseEntity {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  CartDataEntity? data;
  String ? statusMsg;
  num ?statusCode;

  CartResponseEntity(
      {this.status, this.message, this.numOfCartItems, this.cartId, this.data , this.statusMsg , this.statusCode});
}

class CartDataEntity {
  String? id;
  String? cartOwner;
  List<CartProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  CartDataEntity(
      {this.id,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.totalCartPrice});
}

class CartProductsEntity {
  int? count;
  String? id;
  String? product;
  int? price;

  CartProductsEntity({this.count, this.id, this.product, this.price});
}
