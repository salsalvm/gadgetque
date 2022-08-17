import 'package:flutter/material.dart';
import 'package:gadgetque/model/category_datas_model.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/wishlist_page/widget/add_wishlists.dart';

class CatProductImage extends StatelessWidget {
  CatProductImage({
    Key? key,
    required this.products,
  }) : super(key: key);

  final Prodatum products;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        FadeInImage.assetNetwork(
            width: size.width,
            height: size.width * .89,
            placeholder: 'asset/noimage.jpeg',
            image:
                'http://10.0.2.2:3000/product-image/${products.id}/${products.imageId}_1.jpg'),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: AddWishlist(),
        )
      ],
    );
  }
}
