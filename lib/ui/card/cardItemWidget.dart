// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommerce/domain/entities/productResponseEntity.dart';
// import 'package:ecommerce/main.dart';
// import 'package:ecommerce/utils/appColors.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Carditemwidget extends StatelessWidget {

  
//   ProductDataEN? productDataEN;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 113.h,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15.r),
//         border: Border.all(color: Appcolors.mainColor),
//       ),
//       child: Row(
//         children: [
//           CachedNetworkImage(
//             height: 128.h,
//             width: double.infinity,
//             imageUrl:
//                 'https://ecommerce.routemisr.com/Route-Academy-brands/1678286824747.png',
//             placeholder: (context, url) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: Appcolors.blackColor,
//                 ),
//               );
//             },
//             errorWidget: (context, url, error) {
//               return Icon(
//                 Icons.error,
//                 color: Appcolors.redColor,
//               );
//             },
//           ),

//           // Column(
//           //   children: [
//           //     Row(
//           //       children: [
//           //         Text("${productDataEN?.title } "),
//           //         IconButton(onPressed: (){}
//           //         , icon: Icon(
//           //           Icons.remove
//           //         ),
//           //         ),
//           //       ],

//           //     )
//           //   ],
//           // )
//         ],
//       ),
//     );
//   }
// }
