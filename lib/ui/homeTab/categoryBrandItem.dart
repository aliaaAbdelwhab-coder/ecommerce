import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/entities/categoryAndBrand_response_entity.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/utils/appColors.dart';
import 'package:ecommerce/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categorybranditem extends StatelessWidget {
  CategoryAndBrandDataEntity category;
  Categorybranditem({required this.category});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: CachedNetworkImage(
              imageUrl:
                  category.image?? '',
              imageBuilder: (context, ImageProvider) {
                return CircleAvatar(
                  backgroundImage: ImageProvider,
                  radius: 50.r,
                );
              },
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
        Expanded(
          flex: 4,
          child: Text(
            category.name??" ",
            style: Appstyles.bold14black,
          ),
        ),
      ],
    );
  }
}
