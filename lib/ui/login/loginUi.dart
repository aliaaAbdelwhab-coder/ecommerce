import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/shearedPrefrences/shearedPrefrencesUtils.dart';
import 'package:ecommerce/ui/Register/registerui.dart';
import 'package:ecommerce/ui/homeScreen/homeScreen.dart';
import 'package:ecommerce/ui/login/cubit/loginStates.dart';
import 'package:ecommerce/ui/login/cubit/loginViewModle.dart';
import 'package:ecommerce/utils/AppImages.dart';
import 'package:ecommerce/utils/appColors.dart';
import 'package:ecommerce/utils/appStyles.dart';
import 'package:ecommerce/utils/dialogUtils.dart';
import 'package:ecommerce/widgets/button%20widget.dart';
import 'package:ecommerce/widgets/textFieldUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginui extends StatefulWidget {
  static String LoginRouteName = "registerRouteName";

  @override
  State<Loginui> createState() => _LoginuiState();
}

class _LoginuiState extends State<Loginui> {
  Loginviewmodle loginviewmodle = getIt<Loginviewmodle>();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocListener<Loginviewmodle, Loginstates>(
      bloc: loginviewmodle,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          Dialogutils.showLoading(context: context, messsage: "laoding....");
        } else if (state is LoginErrorState) {
          Dialogutils.hideLoading(context: context);
          Dialogutils.showMessage(
              context: context,
              message: state.error.errorMsg,
              posActionsName: 'ok',
              // posAcitons: () => Navigator.pop(context),
              title: "Error");
        } else if (state is LoginSuccessState) {
          Dialogutils.hideLoading(context: context);
          Dialogutils.showMessage(
              context: context,
              message: state.responseEntity.message!,
              posAcitons: () async {
                bool responseShared = await Shearedprefrencesutils.saveData(
                    key:Shearedprefrencesutils.token, value: state.responseEntity.token);
                    print("========================================================");
                print(responseShared);
                  print("========================================================");
                Navigator.pushReplacementNamed(context, Homescreen.routeName);
              },
              posActionsName: 'ok',
              title: "Sucess");
        }
      },
      child: Scaffold(
        backgroundColor: Appcolors.mainColor,
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.1, horizontal: size.width * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  Appimages.logo,
                )),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "Welcome Back To Route",
                  style: Appstyles.boldWite20,
                ),
                Text(
                  "Please sign in with your mail",
                  style: Appstyles.white16,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "User Name",
                  style: Appstyles.boldWite20,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Textfieldui(
                  controller: loginviewmodle.controlleremail,
                  borderColor: Appcolors.whiteColor,
                  hintText: "enter your email",
                  hintStyle: Appstyles.gry16,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "Password",
                  style: Appstyles.boldWite20,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Textfieldui(
                  controller: loginviewmodle.controllerpassword,
                  borderColor: Appcolors.whiteColor,
                  hintText: "enter your password",
                  hintStyle: Appstyles.gry16,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "Forgot password",
                  style: Appstyles.boldWite20,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                CustomElevatedButton(
                  text: 'Login',
                  onButtonClicked: () {
                    loginviewmodle.login();
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Registerui.registerRouteName);
                  },
                  child: Text(
                    "Don’t have an account? Create Account",
                    style: Appstyles.white20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
