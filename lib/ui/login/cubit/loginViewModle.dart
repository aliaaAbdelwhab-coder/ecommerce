
import 'package:ecommerce/domain/useCasese/LoginUserCase.dart';
import 'package:ecommerce/ui/Register/cubit/registerStates.dart';
import 'package:ecommerce/ui/login/cubit/loginStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class Loginviewmodle extends Cubit<Loginstates> {
  Loginusercase loginusercase;
  Loginviewmodle({required this.loginusercase}) : super(LoginInitState());
  TextEditingController controlleremail = TextEditingController(text: "aliaa1@gmail.com");
  TextEditingController controllerpassword = TextEditingController(text: 'Ahmed@123');
  var FormKey = GlobalKey<FormState>();
  void login() async {
    emit(LoginLoadingState());
    var either = await loginusercase.invoke (
        controlleremail.text,
        controllerpassword.text,
      );
    either.fold((error) {
      emit(LoginErrorState(error: error));
    }, (response) {
      emit(LoginSuccessState(responseEntity: response));
    });
  }
}
