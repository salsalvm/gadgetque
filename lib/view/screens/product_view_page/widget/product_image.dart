import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/model/home_datas_model.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/wishlist_page/widget/add_wishlists.dart';

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
      children: [ CachedNetworkImage(
                            imageUrl:
    'http://34.238.154.28/product-image/${products.id}/${products.imageId}_1.jpg',
                            width: size.width ,
                            height: size.width * .89,
                            placeholder: (context, url) => Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('asset/noimage.jpeg'),
                                      fit: BoxFit.cover)),
                            ),
                            errorWidget: (context, str, error) =>
                                 SizedBox(
                              width: size.width * .2,
                              child:const CustomText(
                                  lines: 3,
                                  name:
                                      'No Internet please connect a valid wife',
                                  weight: FontWeight.normal,
                                  fontSize: 18,
                                  color: kGreyColor),
                            ),
                          ),
        // FadeInImage.assetNetwork(
        //     width: size.width,
        //     height: size.width * .89,
        //     placeholder: 'asset/noimage.jpeg',
        //     image:
        //         'http://34.238.154.28/product-image/${products.id}/${products.imageId}_1.jpg'),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: AddWishlist(),
        )
      ],
    );
  }
}
