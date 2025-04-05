import 'package:ecommerce/core/shearedPrefrences/shearedPrefrencesUtils.dart';
import 'package:ecommerce/ui/card/card.dart';
import 'package:ecommerce/ui/categoryTab/categorytab.dart';
import 'package:ecommerce/ui/favouriteTab/favouriteTab.dart';
import 'package:ecommerce/ui/homeScreen/cubit/homeScreenViewModle.dart';
import 'package:ecommerce/ui/homeScreen/cubit/states.dart';
import 'package:ecommerce/ui/homeTab/homeTab.dart';
import 'package:ecommerce/ui/login/loginUi.dart';
import 'package:ecommerce/ui/profileTab/profileTab.dart';
import 'package:ecommerce/utils/AppImages.dart';
import 'package:ecommerce/utils/appColors.dart';
import 'package:ecommerce/utils/appStyles.dart';
import 'package:ecommerce/widgets/textFieldUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatelessWidget {
  static String routeName = "HomeScreenRouteName ";

  Homescreenviewmodle viewModle = Homescreenviewmodle();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Homescreenviewmodle, HomeStates>(
      bloc: viewModle,
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
              toolbarHeight: 150.h,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Appimages.logo,
                    color: Appcolors.mainColor,
                    width: 66.w,
                    height: 22.h,
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: viewModle.selectedIndex != 3
                            ? Textfieldui(
                                borderColor: Appcolors.mainColor,
                                controller: searchController,
                              )
                            : Text(
                                "welcome Aliaa",
                                style: Appstyles.bold20PrimaryLight,
                              ),
                      ),
                      viewModle.selectedIndex != 3
                          ? Badge(
                            alignment: AlignmentDirectional.topStart,
                            backgroundColor: Colors.green,
                            label: Text('3'),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(CardUI.routeName);
                                },
                                icon: Icon(Icons.shopping_cart)),
                          )
                          : IconButton(
                              onPressed: () async{
                               await Shearedprefrencesutils.removeData(
                                    token: 'token');
                              
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    Loginui.LoginRouteName, (route) => false);
                              },
                              icon: Icon(Icons.logout))
                    ],
                  ),
                ],
              )),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            child: Theme(
                data: Theme.of(context)
                    .copyWith(canvasColor: Appcolors.mainColor),
                child: BottomNavigationBar(
                  onTap: viewModle.buttnNavOntop,
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  items: [
                    BottomNavigationBarItem(
                        icon: bottomNavigationUi(0, Appimages.iconHome),
                        label: 'iconHome'),
                    BottomNavigationBarItem(
                        icon: bottomNavigationUi(1, Appimages.categoryIcon),
                        label: 'iconHome'),
                    BottomNavigationBarItem(
                        icon: bottomNavigationUi(2, Appimages.hartIcon),
                        label: 'iconHome'),
                    BottomNavigationBarItem(
                        icon: bottomNavigationUi(3, Appimages.profileIcon),
                        label: 'iconHome'),
                  ],
                )),
          ),
          body: viewModle.tabsUIList[viewModle.selectedIndex],
        );
      },
    );
  }

  Widget bottomNavigationUi(int index, String imageName) {
    return viewModle.selectedIndex == index
        ? CircleAvatar(
            backgroundColor: Appcolors.whiteColor,
            child: ImageIcon(
              AssetImage(imageName),
              color: Appcolors.mainColor,
            ),
          )
        : CircleAvatar(
            backgroundColor: Appcolors.transparentColor,
            child: ImageIcon(
              AssetImage(imageName),
              color: Appcolors.whiteColor,
            ),
          );
  }
}
