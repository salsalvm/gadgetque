import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:get/get.dart';

class AddWishlist extends StatelessWidget {
  const AddWishlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: kBoxColor,
        child: IconButton(
            padding: const EdgeInsets.only(),
            onPressed: () {
              Get.snackbar(
                  'Added Successfuly', 'product has been added to wishlist',
                  colorText: kBlackColor, snackPosition: SnackPosition.BOTTOM);
            },
            icon: const Icon(
              Icons.favorite,
              color: kredColor,
              size: 38,
            )),
      ),
    );
  }
}
