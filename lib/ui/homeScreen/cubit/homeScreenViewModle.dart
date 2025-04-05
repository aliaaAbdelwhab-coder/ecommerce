import 'package:ecommerce/ui/Register/cubit/registerStates.dart';
import 'package:ecommerce/ui/categoryTab/categorytab.dart';
import 'package:ecommerce/ui/favouriteTab/favouriteTab.dart';
import 'package:ecommerce/ui/homeScreen/cubit/states.dart';
import 'package:ecommerce/ui/homeTab/homeTab.dart';
import 'package:ecommerce/ui/profileTab/profileTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreenviewmodle extends Cubit<HomeStates> {
  Homescreenviewmodle() : super(HomeInitialState());
  int selectedIndex = 0;
  List<Widget> tabsUIList = [
    Hometab(),
    Categorytab(),
    Favouritetab(),
    Profiletab(),
  ];

  buttnNavOntop(index) {
    selectedIndex = index;
    emit(changeSelectedIndexState());
  }
}
