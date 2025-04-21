import 'package:dio/dio.dart';
import 'package:ecommerce/domain/useCasese/GetCartUseCase.dart';
import 'package:ecommerce/domain/useCasese/UpdateCartItemUseCase.dart';
import 'package:ecommerce/domain/useCasese/deleteCartItemUseCase.dart';
import 'package:ecommerce/ui/card/cubit/CartStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class Cartviewmodle extends Cubit<Cartstates> {
  Getcartusecase getcartusecase;
  Deletecartitemusecase deletecartitemusecase;
  Updatecartitemusecase updatecartitemusecase;
  Cartviewmodle(
      {required this.getcartusecase,
      required this.deletecartitemusecase,
      required this.updatecartitemusecase})
      : super(CartLoadingState());

  getCart() async {
    emit(CartLoadingState());
    var either = await getcartusecase.invok();
    either.fold(((error) => emit(CartErrorState(error: error))),
        ((response) => emit(CartSuccessState(cartResponseEntity: response))));
  }

  deleteCartItem(String itemID) async {
    print("item id in delete cart item funtion is $itemID");
    // emit(CartLoadingState());
    var either = await deletecartitemusecase.invok(itemID);
    either.fold(
        ((error) => emit(deleteCartItmeErrorState(error: error))),
        ((response) =>
            emit(deleteCartItmeSuccessState(cartResponseEntity: response))));
    getCart();
  }

  updateCartItem(String itemID, int count) async {
    var either = await updatecartitemusecase.invok(itemID, count);
    either.fold(
        ((error) => emit(UpdateCartItmeErrorState(error: error))),
        ((response) =>
            emit(UpdateCartItmeSuccessState(cartResponseEntity: response))));
       getCart();
  }
}
