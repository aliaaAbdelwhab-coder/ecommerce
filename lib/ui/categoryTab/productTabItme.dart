import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/entities/productResponseEntity.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/ui/categoryTab/cubit/CategoryTabStates.dart';
import 'package:ecommerce/ui/categoryTab/cubit/categoryTabViewModle.dart';
import 'package:ecommerce/ui/categoryTab/itemDetails/itemDetails.dart';
import 'package:ecommerce/utils/AppImages.dart';
import 'package:ecommerce/utils/appColors.dart';
import 'package:ecommerce/utils/appStyles.dart';
import 'package:ecommerce/utils/toastMS.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Producttabitme extends StatelessWidget {
  String image;
  String title;
  num price;
  ProductDataEN productDataEN;
  Producttabitme(
      {required this.image,
      required this.price,
      required this.title,
      required this.productDataEN});
  @override
  Widget build(BuildContext context) {
  
    return
  
       Container(
        width: 191.w,
        height: 237.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: Appcolors.darkblue ,
            border: Border.all(color: Appcolors.darkblue)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: CachedNetworkImage(
                      height: 128.h,
                      width: double.infinity,
                      imageUrl: image ?? '',
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
                    )),
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                      backgroundColor: Appcolors.whiteColor,
                      child: Image.asset(
                        Appimages.loveicon,
                        color: Appcolors.mainColor,
                      )),
                ),
              ],
            ),
            AutoSizeText(
              maxLines: 2,
              title,
              style: Appstyles.bold14black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(
                  "EGP" + '$price',
                  style: Appstyles.bold14black,
                ),
                AutoSizeText(
                  "EGP" + '${price * 1.5}',
                  style: Appstyles.bold14black
                      .copyWith(decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
            Row(
              children: [
                AutoSizeText("Review "),
                AutoSizeText("(4.6)"),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                IconButton(
                    onPressed: () {
                      // to do add to cart
                      Categorytabviewmodle.getBolc(context)
                          .addToCart(productDataEN.id ?? '');
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Appcolors.darkblue,
                    ))
          
              ],
            )
          ],
        ),
      );
  
  }
}
