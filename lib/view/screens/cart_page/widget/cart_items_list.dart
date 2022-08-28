import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gadgetque/controller/cart_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
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
                  child: CustomText(
                      lines: 3,
                      name:
                          'no cart items please\nadd product and check\ndaily status for your offer',
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
                                          '${controller.productElemnt![index].product.id}',
                                          controller.productElemnt![index].id);
                                      controller.update();
                                      Get.back(closeOverlays: true);
                                    },
                                    title: 'Are You Sure',
                                    onCancel: () {
                                      Get.back();
                                      controller.update();
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
                                    'http://34.238.154.28/product-image/${controller.productElemnt![index].product.id}/${controller.productElemnt![index].product.imageId}_1.jpg',
                                width: size.width * .18,
                                height: size.width * .18,
                                placeholder: (context, url) => Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('asset/noimage.jpeg'),
                                          fit: BoxFit.cover)),
                                ),
                                errorWidget: (context, str, error) => SizedBox(
                                  width: size.width * .2,
                                  child: const CustomText(
                                      lines: 3,
                                      name:
                                          'No Internet please connect a valid wife',
                                      weight: FontWeight.normal,
                                      fontSize: 18,
                                      color: kGreyColor),
                                ),
                              ),
                              //  CachedNetworkImage(
                              //   imageUrl:
                              //       'http://18.144.34.178/product-image/${controller.productElemnt![index].product.id}/${controller.productElemnt![index].product.imageId}_1.jpg',
                              //   width: size.width * .18,
                              //   height: size.width * .18,
                              //   placeholder: (context, url) => const Center(
                              //       child: CircularProgressIndicator()),
                              //   errorWidget: (context, str, error) =>
                              //       CachedNetworkImage(
                              //     imageUrl:
                              //         'http://34.238.154.28/product-image/${controller.productElemnt![index].product.id}/${controller.productElemnt![index].product.imageId}_1.jpg',
                              //     width: size.width * .5,
                              //     height: size.width * .5,
                              //     placeholder: (context, url) => const Center(
                              //         child: CircularProgressIndicator()),
                              //     errorWidget: (context, str, error) =>
                              //         const Icon(
                              //       Icons.error,
                              //       color: kGreyColor,
                              //       size: 40,
                              //     ),
                              //   ),
                              // ),
                              title: CustomText(
                                  name: controller
                                      .productElemnt![index].product.name!,
                                  weight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kBlackColor),

                              // item count //
                              subtitle: Row(
                                children: [
                                  kWidth5,
                                  QuantityAction(
                                      color: kredColor,
                                      action: '-',
                                      onTap: controller.productElemnt![index]
                                                  .quantity >
                                              1
                                          ? () {
                                              int count = -1;
                                              controller.quantityCartItem(
                                                  controller
                                                      .productElemnt![index]
                                                      .product
                                                      .id,
                                                  controller
                                                      .productElemnt![index].id,
                                                  count);
                                            }
                                          : () {
                                              Get.defaultDialog(
                                                backgroundColor: kBoxColor,
                                                buttonColor: kButtonColor,
                                                middleText:
                                                    'Do you Want to Remove',
                                                onConfirm: () {
                                                  controller.removeCartItems(
                                                      controller
                                                          .productElemnt![index]
                                                          .product
                                                          .id
                                                          .toString(),
                                                      controller
                                                          .productElemnt![index]
                                                          .id);
                                                  controller.update();
                                                  Get.back(closeOverlays: true);
                                                },
                                                title: 'Are You Sure',
                                                onCancel: () {
                                                  Get.back();
                                                },
                                              );
                                            }),
                                  kWidth5,
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 3.0, bottom: 3),
                                    child: CustomText(
                                        name: controller
                                            .productElemnt![index].quantity
                                            .toString(),
                                        weight: FontWeight.bold,
                                        fontSize: 30,
                                        color: kBlackColor),
                                  ),
                                  kWidth10,
                                  QuantityAction(
                                    color: kGreenColor,
                                    action: '+',
                                    size: 30,
                                    onTap: () {
                                      int count = 1;
                                      controller.quantityCartItem(
                                          controller
                                              .productElemnt![index].product.id,
                                          controller.productElemnt![index].id,
                                          count);
                                    },
                                  ),
                                ],
                              ),
                              trailing: Column(
                                children: [
                                  CustomText(
                                      name:
                                          '${int.parse(controller.productElemnt![index].product.price!) * controller.productElemnt![index].quantity}',
                                      weight: FontWeight.w600,
                                      fontSize: 20,
                                      color: kBlackColor),
                                  CustomText(
                                      strike: TextDecoration.lineThrough,
                                      name: controller.productElemnt![index]
                                          .product.originalPrice!,
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
                    ),
        ),
      ),
    );
  }
}

class QuantityAction extends StatelessWidget {
  final VoidCallback onTap;
  final String action;
  final Color? color;
  final double size;
  const QuantityAction({
    Key? key,
    required this.onTap,
    required this.action,
    required this.color,
    this.size = 36,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 25,
          width: 25,
          color: kBoxColor,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 3.0, bottom: 3),
          child: CustomText(
              onTap: onTap,
              name: action,
              weight: FontWeight.bold,
              fontSize: size,
              color: color),
        ),
      ],
    );
  }
}
