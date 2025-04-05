import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/faliures.dart';
import 'package:ecommerce/domain/entities/cart_response_entity.dart';
import 'package:ecommerce/domain/entities/categoryAndBrand_response_entity.dart';
import 'package:ecommerce/domain/entities/productResponseEntity.dart';

abstract class Homeremotedatasource {
  Future <Either<Faliures , CategoryAndBrandsResponseEntity>> getAllCatepories();
  Future <Either<Faliures , CategoryAndBrandsResponseEntity>> getAllBrands();
  Future <Either<Faliures , ProductResponseEntity>> getAllProducts();
  Future <Either<Faliures , CartResponseEntity>> addToCart(String productId);
} 