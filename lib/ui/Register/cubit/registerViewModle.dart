
import 'package:ecommerce/domain/useCasese/RegisterUserCase.dart';
import 'package:ecommerce/ui/Register/cubit/registerStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
@injectable
class Registerviewmodle extends Cubit<Registerstates> {
  Registerusercase registerusercase;
  Registerviewmodle({required this.registerusercase}) : super(InitState());
  TextEditingController controllerName = TextEditingController(text: "Aliaa");
  TextEditingController controlleremail = TextEditingController(text: "aliaa1@gmail.com");
  TextEditingController controllerpassword = TextEditingController(text: 'Ahmed@123');
  TextEditingController controllerrepasswrd = TextEditingController(text: 'Ahmed@123');
  TextEditingController controllerphone = TextEditingController(text: "01010700701");
  var FormKey = GlobalKey<FormState>();
  void register() async {
    emit(LoadingState());
    var either = await registerusercase.invoke(
        controllerName.text,
        controlleremail.text,
        controllerpassword.text,
        controllerrepasswrd.text,
        controllerphone.text);
    either.fold((error) {
      emit(ErrorState(error: error));
    }, (response) {
      emit(SuccessState(responseEntity: response));
    });
  }
}
