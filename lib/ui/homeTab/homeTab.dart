import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/domain/entities/categoryAndBrand_response_entity.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/ui/Register/cubit/registerStates.dart';
import 'package:ecommerce/ui/homeTab/categoryBrandItem.dart';
import 'package:ecommerce/ui/homeTab/cubit/homeTabStates.dart';
import 'package:ecommerce/ui/homeTab/cubit/homeTabeViewModle.dart';
import 'package:ecommerce/utils/AppImages.dart';
import 'package:ecommerce/utils/appColors.dart';
import 'package:ecommerce/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hometab extends StatefulWidget {
  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  List<String> images = [Appimages.ad1, Appimages.ad2, Appimages.ad3];

  Hometabeviewmodle hometabeviewmodle = getIt<Hometabeviewmodle>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hometabeviewmodle.getAllcategories();
    // hometabeviewmodle.getAllBrands();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAnnouncement(images: images),
          SizedBox(
            height: 24.h,
          ),
          _lineBreak(name: "Category"),
          SizedBox(
            height: 24.h,
          ),
          BlocBuilder<Hometabeviewmodle, Hometabstates>(
              buildWhen: (previous, current) => current is homeTabeSuccessState,
              bloc: hometabeviewmodle,
              builder: (context, state) {
                return state is homeTabeSuccessState
                    ? _buildCategoryBrandSec(state.categoryResponseEntity.data!)
                    : Center(
                        child: CircularProgressIndicator(
                          color: Appcolors.mainColor,
                        ),
                      );
              }),
          SizedBox(
            height: 24.h,
          ),
          _lineBreak(name: "Home Appliance"),
          SizedBox(
            height: 24.h,
          ),
          BlocBuilder<Hometabeviewmodle, Hometabstates>(
              bloc: hometabeviewmodle..getAllBrands(),
              builder: (context, state) {
                return state is brandSuccessState
                    ? _buildCategoryBrandSec(
                        state.categoryAndBrandsResponseEntity.data!)
                    : Center(
                        child: CircularProgressIndicator(
                          color: Appcolors.mainColor,
                        ),
                      );
              })
        ],
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({required List<String> images}) {
    return ImageSlideshow(
        indicatorBackgroundColor: Appcolors.whiteColor,
        indicatorColor: Appcolors.mainColor,
        isLoop: true,
        autoPlayInterval: 3000,
        children: images.map((url) {
          return Image.asset(url);
        }).toList());
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: Appstyles.bold20black,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "View more",
              style: Appstyles.black16,
            )),
      ],
    );
  }

  SizedBox _buildCategoryBrandSec(
      List<CategoryAndBrandDataEntity> categoryList) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
          ),
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categorybranditem(
              category: categoryList[index],
            );
          }),
    );
  }
}
