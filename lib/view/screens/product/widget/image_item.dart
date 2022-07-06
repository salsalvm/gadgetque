import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/wishlist/widget/add_wishlists.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          height: size.width*0.89,
          width: size.width,
          decoration: const BoxDecoration(
            color: kWhiteColor,
            image: DecorationImage(
              image: AssetImage(
                'asset/mobile.png',
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: AddWishlist(),
        )
      ],
    );
  }
}
