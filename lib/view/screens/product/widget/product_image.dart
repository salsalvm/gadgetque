import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/model/home_datas_model.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/screens/wishlist/widget/add_wishlists.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.products,
  }) : super(key: key);

  final Product products;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        CachedNetworkImage(
          imageUrl:
              'http://54.176.6.232/product-image/${products.id}/${products.imageId}_1.jpg',
          width: size.width,
          height: size.width * .89,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, str, error) => CachedNetworkImage(
            imageUrl:
                'http://10.0.2.2:3000/product-image/${products.id}/${products.imageId}_1.jpg',
            width: size.width,
            height: size.width * .89,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, str, error) => const Icon(
              Icons.error,
              color: kGreyColor,
              size: 40,
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
