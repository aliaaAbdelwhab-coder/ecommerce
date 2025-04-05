import 'package:ecommerce/ui/categoryTab/cubit/CategoryTabStates.dart';
import 'package:ecommerce/ui/categoryTab/cubit/categoryTabViewModle.dart';
import 'package:ecommerce/ui/categoryTab/itemDetails/itemDetails.dart';
import 'package:ecommerce/ui/categoryTab/productTabItme.dart';
import 'package:ecommerce/utils/appColors.dart';
import 'package:ecommerce/utils/toastMS.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categorytab extends StatelessWidget {
  // Categorytabviewmodle categorytabviewmodle = getIt<Categorytabviewmodle>();
  @override
  Widget build(BuildContext context) {
    Categorytabviewmodle.getBolc(context).getProducts();
    return BlocConsumer<Categorytabviewmodle, Categorytabstates>(
        buildWhen: (previous, current) =>
            previous is CategoryTabeLoadingState &&
            current is CategoryTabeSuccessState,
        listener: (BuildContext context, state) {
          if (state is AddToCartSuccessState) {
            return ToastMsg.toasMsg(
                msg: "add successfully",
                backgroundColor: Colors.green,
                textColor: Colors.white);
          } else if (state is AddToCartErrorState) {
            return ToastMsg.toasMsg(
                msg: state.error.errorMsg,
                backgroundColor: Colors.red,
                textColor: Colors.white);
          }
        },
        builder: (context, state) {
          if (state is CategoryTabeLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Appcolors.blackColor,
              ),
            );
          } else if (state is CategoryTabeSuccessState) {
            return SafeArea(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 0.8),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Itemdetails.routename,
                            arguments:
                                state.categoryResponseEntity.data![index]);
                      },
                      child: Producttabitme(
                        image: state
                            .categoryResponseEntity.data![index].imageCover!,
                        title: state.categoryResponseEntity.data![index].title!,
                        price: state.categoryResponseEntity.data![index].price!,
                        productDataEN:
                            state.categoryResponseEntity.data![index],
                      ),
                    );
                  }),
            );
          } else if (state is CategoryTabeErrorState) {
            return Text(state.error.errorMsg);
          }

          return Container(
            color: Colors.black,
            child: Text("data"),
          );
        }
      
        );
  }
}
