import 'package:ecommerce/utils/AppImages.dart';
import 'package:ecommerce/utils/appColors.dart';
import 'package:ecommerce/utils/appStyles.dart';
import 'package:ecommerce/widgets/button%20widget.dart';
import 'package:ecommerce/widgets/textFieldUI.dart';
import 'package:flutter/material.dart';

class Loginui extends StatelessWidget {
  static String registerRouteName = "registerRouteName";
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Appcolors.mainColor,
    
      body: Container(
        padding: EdgeInsets.symmetric(vertical: size.height*0.1 , horizontal: size.width*0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(Appimages.logo  ,)),
              SizedBox(height: size.height*0.05,),
              Text(
                
                "Welcome Back To Route",
                style: Appstyles.boldWite20,
              ),
              
              Text(
                "Please sign in with your mail",
                style: Appstyles.white16,
              ),
              SizedBox(height: size.height*0.05,),
              Text(
                "User Name",
                style: Appstyles.boldWite20,
              ),
              SizedBox(height: size.height*0.03,),
              Textfieldui(controller: nameController , borderColor: Appcolors.whiteColor,
              hintText: "enter your name" ,hintStyle: Appstyles.gry16,
              ),
              SizedBox(height: size.height*0.03,),
            Text(
                "Password",
                style: Appstyles.boldWite20,
              ),
              SizedBox(height: size.height*0.03,),
              Textfieldui(controller: nameController , borderColor: Appcolors.whiteColor,
              hintText: "enter your password" ,hintStyle: Appstyles.gry16 ,
              ),
              SizedBox(height: size.height*0.03,),
                      Text(
                "Forgot password",
                style: Appstyles.boldWite20,
              ),
              SizedBox(height: size.height*0.03,),
              CustomElevatedButton(text: 'Login', onButtonClicked: (){},),
              SizedBox(height: size.height*0.03,),
              Text(
                "Don’t have an account? Create Account",
                style: Appstyles.white20,
              ),
            
              
            ],
          ),
        ),
      ),
    );
  }
}
