// import 'package:flutter/material.dart';
// import 'package:gadgetque/view/constant/color.dart';
// import 'package:get/get.dart';

// class AddWishlist extends StatelessWidget {
//   const AddWishlist({
//     Key? key,  this.radius=24,  this.iconSize=38,
//   }) : super(key: key);
// final double radius;
// final double iconSize;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: CircleAvatar(
//         radius: radius,
//         backgroundColor: kBoxColor,
//         child: IconButton(
//             padding: const EdgeInsets.only(),
//             onPressed: () {
//               Get.snackbar(
//                   'Added Successfuly', 'product has been added to wishlist',
//                   colorText: kBlackColor, snackPosition: SnackPosition.BOTTOM);
//             },
//             icon:  Icon(
//               Icons.favorite,
//               color: kredColor,
//               size: iconSize,
//             )),
//       ),
//     );
//   }
// }
