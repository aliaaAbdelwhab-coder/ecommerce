import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/shearedPrefrences/shearedPrefrencesUtils.dart';
import 'package:ecommerce/ui/Register/registerui.dart';
import 'package:ecommerce/ui/card/card.dart';
import 'package:ecommerce/ui/categoryTab/cubit/categoryTabViewModle.dart';
import 'package:ecommerce/ui/categoryTab/itemDetails/itemDetails.dart';
import 'package:ecommerce/ui/homeScreen/homeScreen.dart';
import 'package:ecommerce/ui/login/loginUi.dart';
import 'package:ecommerce/utils/apptheme.dart';
import 'package:ecommerce/utils/blocOpserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shearedprefrencesutils.init();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  String initialrouteName;
  var responseShared =
      await Shearedprefrencesutils.getData(key: Shearedprefrencesutils.token);
  print("token is $responseShared ======================================");
  if (responseShared != null) {
    initialrouteName = Homescreen.routeName;
  } else {
    initialrouteName = Loginui.LoginRouteName;
  }
  runApp(MultiBlocProvider 
  (
    providers: [
      BlocProvider(create: (context)=>getIt<Categorytabviewmodle>())
    ],
    child: MyApp(initialrouteName: initialrouteName)));
}

class MyApp extends StatelessWidget {
  String initialrouteName;
  MyApp({required this.initialrouteName});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(430, 932),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: initialrouteName,
            routes: {
              Registerui.registerRouteName: (context) => Registerui(),
              Loginui.LoginRouteName: (context) => Loginui(),
              Homescreen.routeName: (context) => Homescreen(),
              Itemdetails.routename: (context) => Itemdetails(),
              CardUI.routeName: (context) => CardUI(),
            },
            theme: Apptheme.Theme,
          );
        });
  }
}
