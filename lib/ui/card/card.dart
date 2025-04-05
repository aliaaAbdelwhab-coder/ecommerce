import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/api/apiManager.dart';
import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/ui/Register/cubit/registerStates.dart';
import 'package:ecommerce/ui/card/cardItemWidget.dart';
import 'package:ecommerce/ui/card/cubit/CartStates.dart';
import 'package:ecommerce/ui/card/cubit/cartViewModle.dart';
import 'package:ecommerce/utils/appColors.dart';
import 'package:ecommerce/utils/appStyles.dart';
import 'package:ecommerce/utils/dialogUtils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class CardUI extends StatelessWidget {
  static String routeName = "cardRouteName ";

  Cartviewmodle cartviewmodle = getIt<Cartviewmodle>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: Appstyles.bold20PrimaryLight,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        centerTitle: true,
      ),
      body: BlocBuilder<Cartviewmodle, Cartstates>(
          bloc: cartviewmodle..getCart(),
          builder: (context, state) {
            if (state is CartLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: Appcolors.blackColor,
                ),
              );
            } else if (state is CartErrorState) {
              return Text(state.error.errorMsg);
            } else if (state is CartSuccessState) {
              return Column(
                children: [
                  // Carditemwidget()
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          state.cartResponseEntity.data!.products!.length,
                      itemBuilder: (context, index) => Container(
                        // height: 200.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: Appcolors.mainColor),
                        ),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              height: 128.h,
                              width: 120.w,
                              imageUrl: state.cartResponseEntity.data
                                      ?.products![index].product?.imageCover ??
                                  '',
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
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                       
                                      state
                                              .cartResponseEntity
                                              .data
                                              ?.products?[index]
                                              .product!
                                              .title ??
                                          ' ',
                                      style: Appstyles.bold20PrimaryLight,
                                      
                                      
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      "EGP ${state.cartResponseEntity.data?.products?[index].price ?? ' '}",
                                      style: Appstyles.bold20PrimaryLight,
                                    ),
                                    // Spacer(),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h, horizontal: 20.w),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Appcolors.mainColor),
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          color: Appcolors.mainColor),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.remove_circle_outline,
                                                color: Appcolors.whiteColor,
                                              )),
                                          AutoSizeText(
                                            "${state.cartResponseEntity.data?.products?[index].count ?? ' '}",
                                            style: Appstyles.boldWite20,
                                          ),
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
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
            return Container();
          }),
    );
  }
}
