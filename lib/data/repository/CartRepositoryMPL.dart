import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/get_cart_productsEntity.dart';
import 'package:ecommerce/domain/repositories/CartRepository.dart';
import 'package:ecommerce/domain/repositories/dataSource/remoteDataSource/CartDataSource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Cartrepository)
class Cartrepositorympl extends Cartrepository {
  Cartdatasource cartdatasource;
  Cartrepositorympl({required this.cartdatasource});

  @override
  Future<Either<Faliures, GetCartEntity>> GetCartItems() async {
    var either = await cartdatasource.GetCartItems();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Faliures, GetCartEntity>> DeleteCartItem(String itemID) async {
    var either = await cartdatasource.DeleteCartItem(itemID);
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Faliures, GetCartEntity>> updateCartItem(String itemID ,int count) async {
    var either = await cartdatasource.updateCartItem(itemID ,count);
    return either.fold((error) => left(error), (respons) => right(respons));
  }
}
