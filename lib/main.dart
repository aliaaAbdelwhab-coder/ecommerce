import 'package:ecommerce/Regester/ui/registerui.dart';
import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/utils/blocOpserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
configureDependencies(); 
Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registerui(),
      // initialRoute: Generalscreen.GeneralscreenRoute,
      routes: {
       Registerui.registerRouteName:(context)=> Registerui(),
      },
    );
  }
}
