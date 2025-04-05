import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/domain/useCasese/AddToCartUseCase.dart';
import 'package:ecommerce/domain/useCasese/getProductsUseCase.dart';
import 'package:ecommerce/ui/categoryTab/cubit/CategoryTabStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class Categorytabviewmodle extends Cubit<Categorytabstates> {
  Getproductsusecase getproductsusecase;
  Addtocartusecase addtocartusecase;

  Categorytabviewmodle(
      {required this.getproductsusecase, required this.addtocartusecase})
      : super(CategoryTabeLoadingState());
  static Categorytabviewmodle getBolc(context) =>
      BlocProvider.of<Categorytabviewmodle>(context);

  int numberOfCartItem = 0;

  getProducts() async {
    emit(CategoryTabeLoadingState());
    var either = await getproductsusecase.invok();
    either.fold((error) => {emit(CategoryTabeErrorState(error: error))},
        (Response) {
      emit(CategoryTabeSuccessState(categoryResponseEntity: Response));
    });
  }

  addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addtocartusecase.invok(productId);
    either.fold((error) => {emit(AddToCartErrorState(error: error))},
        (Response) {
      numberOfCartItem = Response.numOfCartItems!.toInt();
      print("numberOfCartItem = $numberOfCartItem");
      emit(AddToCartSuccessState(cartResponseEntity: Response));
    });
  }
}
