import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gadgetque/controller/cart_controller.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';

class CartitemsList extends StatelessWidget {
  const CartitemsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height * .521,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: GetBuilder<CartController>(
                init: CartController(),
                builder: (controller) => controller.cartCount == 0
                    ? const Center(
                        child: ItemText(
                            lines: 3,
                            name:
                                'no cart items\nplease add product\nand check daily status',
                            weight: FontWeight.normal,
                            fontSize: 22,
                            color: kGreyColor),
                      )
                    : controller.productElemnt == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Card(
                              child: Slidable(
                                endActionPane: ActionPane(
                                  extentRatio: 1 / 3.5,
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        Get.defaultDialog(
                                          backgroundColor: kBoxColor,
                                          buttonColor: kButtonColor,
                                          middleText: 'Do you Want to Remove',
                                          onConfirm: () {
                                            controller.removeCartItems(
                                                controller.productElemnt![index]
                                                    .product.id
                                                    .toString(),
                                                controller
                                                    .productElemnt![index].id);
                                            Get.back();
                                          },
                                          title: 'Are You Sure',
                                          onCancel: () {
                                            Get.back();
                                          },
                                        );
                                      },
                                      backgroundColor: kredColor,
                                      foregroundColor: kWhiteColor,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: ListTile(
                                    leading: CachedNetworkImage(
                                      imageUrl:
                                          'http://18.144.34.178/product-image/${controller.productElemnt![index].product.id}/${controller.productElemnt![index].product.imageId}_1.jpg',
                                      width: size.width * .18,
                                      height: size.width * .18,
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, str, error) =>
                                          CachedNetworkImage(
                                        imageUrl:
                                            'http://10.0.2.2:3000/product-image/${controller.productElemnt![index].product.id}/${controller.productElemnt![index].product.imageId}_1.jpg',
                                        width: size.width * .5,
                                        height: size.width * .5,
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, str, error) =>
                                            const Icon(
                                          Icons.error,
                                          color: kGreyColor,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    title: ItemText(
                                        name: controller.productElemnt![index]
                                            .product.name!,
                                        weight: FontWeight.bold,
                                        fontSize: 20,
                                        color: kBlackColor),
                                    subtitle: const ItemText(
                                        name: '1',
                                        weight: FontWeight.bold,
                                        fontSize: 22,
                                        color: kBlackColor),
                                    trailing: Column(
                                      children: [
                                        ItemText(
                                            name: controller
                                                .productElemnt![index]
                                                .product
                                                .price!,
                                            weight: FontWeight.w600,
                                            fontSize: 20,
                                            color: kBlackColor),
                                        ItemText(
                                            strike: TextDecoration.lineThrough,
                                            name: controller
                                                .productElemnt![index]
                                                .product
                                                .originalPrice!,
                                            weight: FontWeight.normal,
                                            fontSize: 18,
                                            color: kBlackColor),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            itemCount: controller.productElemnt!.length,
                          ))));
  }
}
