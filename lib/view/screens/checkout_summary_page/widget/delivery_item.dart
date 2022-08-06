import 'package:flutter/material.dart';
import 'package:gadgetque/controller/checkout_controller.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
import 'package:gadgetque/view/constant/core/space.dart';
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
                                    child: ItemText(
                                        lines: 2,
                                        name: controller
                                            .products![index].product.name,
                                        weight: FontWeight.w700,
                                        fontSize: 20,
                                        color: kBlackColor),
                                  ),
                                  kHeigt5,
                                  ItemText(
                                      name: controller
                                          .products![index].product.category,
                                      weight: FontWeight.bold,
                                      fontSize: 18,
                                      color: kBlack54Color),
                                  kHeigt5,
                                  const ItemText(
                                      name: 'seller : GadgetsQue',
                                      weight: FontWeight.bold,
                                      fontSize: 16,
                                      color: kBlack54Color),
                                  kHeigt5,
                                  Row(
                                    children: [
                                      ItemText(
                                          name: controller
                                              .products![index].product.price,
                                          weight: FontWeight.bold,
                                          fontSize: 24,
                                          color: kGreenColor),
                                      ItemText(
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
                              Container(
                                width: size.width * .35,
                                height: size.width * .36,
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: kRAdius10,
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'asset/mobile.png',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          kHeigt5,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ItemText(
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
