import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gadgetque/controller/order_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/wishlist_page/widget/add_wishlists.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<OrderController>(
        init: OrderController(),
        builder: (controller) {
          return GridView.builder(
            itemCount: controller.products!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 5,
              childAspectRatio: 1 / 1.95,
            ),
            itemBuilder: (context, index) {
              final product = controller.products![index];
              return InkWell(
                // onTap: () => Get.to( BuyProduct()),
                child: Card(
                  color: kWhiteColor,
                  shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                              CachedNetworkImage(
                            imageUrl:
    'http://34.238.154.28/product-image/${product.product!.id}/${product.product!.imageId}_1.jpg',
                            width: size.width * .5,
                            height: size.width * .44,
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
                            //     fit: BoxFit.fill,
                            //     width: size.width * .5,
                            //     height: size.width * .44,
                            //     placeholder: 'asset/noimage.jpeg',
                            //     image:
                            //         'http://34.238.154.28/product-image/${product.product!.id}/${product.product!.imageId}_1.jpg'),
                            const AddWishlist(radius: 20, iconSize: 34),
                          ],
                        ),
                        kHeigt5,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                name: '${product.product!.name}'.toUpperCase(),
                                weight: FontWeight.w500,
                                fontSize: 20,
                                color: kBlackColor),
                            kHeigt5,
                            SizedBox(
                              child: CustomText(
                                  lines: 2,
                                  name: '${product.product!.description}',
                                  weight: FontWeight.w500,
                                  fontSize: 18,
                                  color: kBlack54Color),
                            ),
                            kHeigt5,
                            CustomText(
                                name: '${product.product!.category}',
                                weight: FontWeight.w500,
                                fontSize: 18,
                                color: kBlackColor),
                            Row(
                              children: [
                                CustomText(
                                    name: '${product.product!.price}',
                                    weight: FontWeight.bold,
                                    fontSize: 22,
                                    color: kGreenColor),
                                CustomText(
                                    name: '${product.product!.originalPrice}',
                                    weight: FontWeight.normal,
                                    fontSize: 18,
                                    strike: TextDecoration.lineThrough,
                                    color: kBlack54Color),
                              ],
                            ),
                            CustomText(
                                name: 'Qty  :   ${product.quantity} ',
                                weight: FontWeight.bold,
                                fontSize: 20,
                                color: kBlack54Color),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
