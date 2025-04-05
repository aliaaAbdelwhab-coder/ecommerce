
import 'package:ecommerce/utils/appColors.dart';
import 'package:flutter/material.dart';

class Apptheme {
  
  static  ThemeData Theme = ThemeData(
    primaryColor: Appcolors.blackColor,
    appBarTheme: AppBarTheme(
     iconTheme: IconThemeData(
      color: Appcolors.mainColor
     )
      // backgroundColor: Appcolors.mainColor
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
     backgroundColor: Appcolors.mainColor
      // unselectedLabelStyle: Appstyles.bold12wite,
      // selectedLabelStyle: Appstyles.bold12wite,
    
    ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor:Appcolors.PrimaryLight,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(50),
    //     side: BorderSide(
    //       color: Appcolors.whiteColor,
    //       width: 4,
    //     )
    //   )
    // )
  );
  
}
