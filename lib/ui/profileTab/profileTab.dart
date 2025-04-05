
import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/validation/validation.dart';
import 'package:ecommerce/ui/Register/cubit/registerStates.dart';
import 'package:ecommerce/ui/Register/cubit/registerViewModle.dart';
import 'package:ecommerce/utils/appColors.dart';
import 'package:ecommerce/utils/appStyles.dart';
import 'package:ecommerce/utils/dialogUtils.dart';
import 'package:ecommerce/widgets/textFieldUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profiletab extends StatelessWidget {
  // static String registerRouteName = "registerRouteName";

  Registerviewmodle viewModle = getIt<Registerviewmodle>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocListener<Registerviewmodle, Registerstates>(
      bloc: viewModle,
      listener: (BuildContext context, Registerstates state) {
        if (state is LoadingState) {
          Dialogutils.showLoading(context: context, messsage: "laoding....");
        } else if (state is ErrorState) {
          Dialogutils.hideLoading(context: context);
          Dialogutils.showMessage(
              context: context,
              message: state.error.errorMsg,
              posActionsName: 'ok',
              // posAcitons: () => Navigator.pop(context),
              title: "Error");
        } else if (state is SuccessState) {
          Dialogutils.hideLoading(context: context);
          Dialogutils.showMessage(
              context: context,
              message: state.responseEntity.message!,
              // posAcitons: () {},
              posActionsName: 'ok',
              title: "Sucess");
        }
      },
      // child: Scaffold(
      //   // backgroundColor: Appcolors.mainColor,
      //   body:
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.1, horizontal: size.width * 0.03),
          child: SingleChildScrollView(
            child: Form(
              key: viewModle.FormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //     child: Image.asset(
                  //   Appimages.logo,
                  // )),
                  // SizedBox(
                  //   height: size.height * 0.05,
                  // ),
                  Text(
                    "Full Name",
                    style: Appstyles.bold20black,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Textfieldui(
                    controller: viewModle.controllerName,
                    borderColor: Appcolors.greyColor,
                    hintText: "enter your full name",
                    hintStyle: Appstyles.gry16,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Mobile number",
                    style: Appstyles.bold20black,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Textfieldui(
                    validator: Validation.validationPhone,
                    controller: viewModle.controllerphone,
                    borderColor: Appcolors.greyColor,
                    hintText: "enter your mobile number",
                    hintStyle: Appstyles.gry16,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    "E-mail address",
                    style: Appstyles.bold20black,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Textfieldui(
                    controller: viewModle.controlleremail,
                    borderColor: Appcolors.greyColor,
                    hintText: "enter your E-mail address",
                    hintStyle: Appstyles.gry16,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    "Password",
                    style: Appstyles.bold20black,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Textfieldui(
                    controller: viewModle.controllerpassword,
                    borderColor: Appcolors.greyColor,
                    hintText: "enter your password",
                    hintStyle: Appstyles.gry16,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    "Your Address",
                    style: Appstyles.bold20black,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Textfieldui(
                    controller: viewModle.controllerrepasswrd,
                    borderColor: Appcolors.greyColor,
                    hintText: "Your Address",
                    hintStyle: Appstyles.gry16,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                
                ],
              ),
            ),
          ),
        ),
      // ),
    );
  }
}
