import 'package:flutter/material.dart';
import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class DeliveryItem extends StatelessWidget {
  DeliveryItem({
    Key? key,
  }) : super(key: key);
  final itemController = Get.put(CheckoutController());
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return GetBuilder<CheckoutController>(
      init: CheckoutController(),
      builder: (controller) => controller.products == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            )
          : SizedBox(
              width: size.width,
              height: size.height * .285,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    color: kWhiteColor,
                    shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * .5,
                                    child: CustomText(
                                        lines: 2,
                                        name: controller
                                            .products![index].product.name,
                                        weight: FontWeight.w700,
                                        fontSize: 20,
                                        color: kBlackColor),
                                  ),
                                  kHeigt5,
                                  CustomText(
                                      name: controller
                                          .products![index].product.category,
                                      weight: FontWeight.bold,
                                      fontSize: 18,
                                      color: kBlack54Color),
                                  kHeigt5,
                                  const CustomText(
                                      name: 'seller : GadgetsQue',
                                      weight: FontWeight.bold,
                                      fontSize: 16,
                                      color: kBlack54Color),
                                  kHeigt5,
                                  Row(
                                    children: [
                                      CustomText(
                                          name: controller
                                              .products![index].product.price,
                                          weight: FontWeight.bold,
                                          fontSize: 24,
                                          color: kGreenColor),
                                      CustomText(
                                          name: controller.products![index]
                                              .product.originalPrice,
                                          weight: FontWeight.normal,
                                          strike: TextDecoration.lineThrough,
                                          fontSize: 18,
                                          color: kBlack54Color),
                                    ],
                                  )
                                ],
                              ),
                              FadeInImage.assetNetwork(
                                  width: size.width * .35,
                                  height: size.width * .36,
                                  placeholder: 'asset/noimage.jpeg',
                                  image:
                                      'http://34.238.154.28/product-image/${controller.products![index].product.id}/${controller.products![index].product.imageId}_1.jpg'),
                            ],
                          ),
                          kHeigt5,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                  name:
                                      'Delivery by ${now.day}-${now.month}-${now.year}',
                                  weight: FontWeight.bold,
                                  fontSize: 18,
                                  color: kBlackColor),
                              kWidth30,
                              ActionButton(
                                radius: 10,
                                fontSize: 20,
                                buttonWidth: size.width * .35,
                                buttonHeight: size.width * .09,
                                text:
                                    'Qty : ${controller.products![index].quantity}',
                                onTap: () {},
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: controller.products!.length,
              ),
            ),
    );
  }
}
