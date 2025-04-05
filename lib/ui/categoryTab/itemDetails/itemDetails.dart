import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/entities/productResponseEntity.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/utils/AppImages.dart';
import 'package:ecommerce/utils/appColors.dart';
import 'package:ecommerce/utils/appStyles.dart';
import 'package:ecommerce/widgets/button%20widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class Itemdetails extends StatelessWidget {
  static String routename = "Itemdetails";
  int count = 1;
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as ProductDataEN;
    return Scaffold(
      appBar: AppBar(
        title: Text( "Product Details" , style: Appstyles.bold20PrimaryLight, ),
        actions: [
          
          IconButton(onPressed: (){}, 
          
          icon: Icon(Icons.search),
          ),
          IconButton(onPressed: (){}, 
          
          icon: Icon(Icons.shopping_cart),
          ),
        ],
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  _buildAnnouncement(images: arg.images ?? []),
                  IconButton(
                      onPressed: () {}, icon: Image.asset(Appimages.loveicon))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      arg.title ?? '',
                      softWrap: true,
                      style: Appstyles.bold20PrimaryLight,
                    ),
                  ),
                  AutoSizeText(
                    "EGP ${arg.price}" ?? '',
                    style: Appstyles.bold20PrimaryLight,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Appcolors.mainColor),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Text("${arg.sold}  sold",
                        style: Appstyles.bold20PrimaryLight),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  AutoSizeText(
                    "${arg.ratingsAverage}  (${arg.ratingsQuantity}) ",
                    style: Appstyles.bold20PrimaryLight,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: Appcolors.mainColor),
                        borderRadius: BorderRadius.circular(30.r),
                        color: Appcolors.mainColor),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: Appcolors.whiteColor,
                            )),
                        AutoSizeText("$count" , style:  Appstyles.boldWite20,),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Appcolors.whiteColor,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
           AutoSizeText("Description" , style:Appstyles.bold20PrimaryLight,) ,
           ReadMoreText(
            arg.description ?? " " , style: Appstyles.gry16,
            trimMode: TrimMode.Line,
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Total price " ,style: Appstyles.bold20black, ) ,
                      SizedBox(
                            height: 10.h,
                          ),
                      Text("EGP ${arg.price}" ,style: Appstyles.bold20PrimaryLight, ) ,
                    ],
                  ),
                  Expanded(
                    child: CustomElevatedButton(text: "Add to cart" , textStyle: Appstyles.bold24white
                     , 
                     onButtonClicked: (){},
                     prefixIcon: IconButton(onPressed: (){},
                      icon: Icon(Icons.add_shopping_cart , color:Appcolors.whiteColor,)
                      ),
                     backgroundColor:Appcolors.mainColor
                     ),
                  )
                ],
              )
                    
            ],
          ),
        ),
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
          return CachedNetworkImage(
            height: 128.h,
            width: double.infinity,
            imageUrl: url ?? '',
            placeholder: (context, url) {
              return Center(
                child: CircularProgressIndicator(
                  color: Appcolors.blackColor,
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Icon(
                Icons.error,
                color: Appcolors.redColor,
              );
            },
          );
        }).toList());
  }
}
