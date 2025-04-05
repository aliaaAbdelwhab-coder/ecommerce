
import 'package:ecommerce/domain/useCasese/GetCartUseCase.dart';
import 'package:ecommerce/ui/card/cubit/CartStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class Cartviewmodle extends Cubit<Cartstates> {
  Getcartusecase getcartusecase;
  Cartviewmodle({required this.getcartusecase}) : super(CartLoadingState());

  getCart() async {
    emit(CartLoadingState());
  var either = await getcartusecase.invok();
  either.fold(
    ((error)=>emit(CartErrorState(error: error)))
    , ((response)=>emit(CartSuccessState(cartResponseEntity: response)))
    
    );
  }
}
