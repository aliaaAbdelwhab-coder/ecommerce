

import 'package:ecommerce/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appstyles {
  static TextStyle bold24white = GoogleFonts.inter(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
  static TextStyle bold20black = GoogleFonts.inter(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
  static TextStyle bold20PrimaryLight = GoogleFonts.inter(
      color: Appcolors.mainColor, fontSize: 20, fontWeight: FontWeight.bold);
  static TextStyle white14 = GoogleFonts.inter(
    color: Appcolors.whiteColor,
    fontSize: 14,
  );
  static TextStyle white16 = GoogleFonts.inter(
    color: Appcolors.whiteColor,
    fontSize: 16,
  );
  static TextStyle bold12wite = GoogleFonts.inter(
      color: Appcolors.whiteColor, fontSize: 12, fontWeight: FontWeight.bold);
  static TextStyle bold14black = GoogleFonts.inter(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);
static TextStyle bold14PrimaryLight = GoogleFonts.inter(
      color: Appcolors.darkblue, fontSize: 14, fontWeight: FontWeight.bold);
static TextStyle white20 = GoogleFonts.inter(
      color: Appcolors.whiteColor, fontSize: 20);

static TextStyle gry16 = GoogleFonts.inter(
      color: Appcolors.greyColor, fontSize: 16);     
  static TextStyle  boldLine16PrimaryLight= GoogleFonts.inter(
    color: Appcolors.darkblue,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: Appcolors.blackColor,
    ),
    fontSize: 16,
  );   
    static TextStyle brimaryLight20 = GoogleFonts.inter(
      color: Appcolors.blackColor, fontSize: 20, );    
    static TextStyle black16 = GoogleFonts.inter(
      color: Appcolors.blackColor, fontSize: 16, );   
        static TextStyle brimaryLight16 = GoogleFonts.inter(
      color: Appcolors.darkblue, fontSize: 16, );      
        static TextStyle boldWite20 = GoogleFonts.inter(
      color: Appcolors.whiteColor, fontSize: 20,fontWeight: FontWeight.bold ); 
              static TextStyle boldprimaryLight24 = GoogleFonts.inter(
      color: Appcolors.blackColor, fontSize: 24, fontWeight:FontWeight.bold );  
}
