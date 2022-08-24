import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gadgetque/controller/order_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/screens/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (controller) {
        return controller.orderList == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              )
            : controller.orderList!.isEmpty
                ? const Center(
                    child: CustomText(
                        name:
                            'No order\nYet find your\nstyle and shop something...',
                        weight: FontWeight.normal,
                        fontSize: 18,
                        color: kGreyColor),
                  )
                : SizedBox(
                    height: size.height * .73,
                    width: size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          List<String> str = controller
                              .orderList![index].deliveryDetails!.address!
                              .split(',');
                          str = str.reversed.toList();
                          String temp = '';
                          for (var i = 0; i < str.length; i++) {
                            if (i % 2 == 0) {
                              temp = '${str[i]},\n$temp';
                            } else {
                              temp = '${str[i]},$temp';
                            }
                          }

                          return GestureDetector(
                            onTap: () {
                              controller.getOrderProduct(
                                  '${controller.orderList![index].id}');
                            },
                            child: Slidable(
                              endActionPane: ActionPane(
                                extentRatio: 1 / 2,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      Get.defaultDialog(
                                          backgroundColor: kBoxColor,
                                          buttonColor: kButtonColor,
                                          middleText: 'Do you Want to Remove',
                                          onConfirm: () {
                                            controller.cancelOrder(
                                                '${controller.orderList![index].id}');
                                            // Get.back();
                                          },
                                          title: 'Are You Sure',
                                          onCancel: () {});
                                    },
                                    backgroundColor: kredColor,
                                    foregroundColor: kWhiteColor,
                                    icon: Icons.delete,
                                    label: 'Cancel Order',
                                  ),
                                ],
                              ),
                              child: Card(
                                shadowColor: kGreyColor,
                                // color: kBoxColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: kRAdius10),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: size.width * .31,
                                        width: size.width * .31,
                                        decoration: BoxDecoration(
                                          borderRadius: kRAdius10,
                                          color: controller.orderList![index]
                                                      .status!.length !=
                                                  6
                                              ? kredColor
                                              : kGreenColor,
                                        ),
                                        child: Center(
                                          child: CustomText(
                                              name: controller
                                                  .orderList![index].status!
                                                  .toUpperCase(),
                                              weight: FontWeight.bold,
                                              fontSize: 16,
                                              color: kWhiteColor),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CustomText(
                                              name:
                                                  'Date ${controller.orderList![index].date!}',
                                              weight: FontWeight.bold,
                                              fontSize: 18,
                                              color: kBlackColor),
                                          CustomText(
                                              name: temp.toUpperCase().trim(),
                                              lines: 2,
                                              weight: FontWeight.w500,
                                              fontSize: 18,
                                              color: kBlack54Color),
                                          CustomText(
                                              name:
                                                  'Total :  ${controller.orderList![index].totalAmount!} ',
                                              weight: FontWeight.w500,
                                              fontSize: 20,
                                              color: kGreenColor),
                                          CustomText(
                                              name:
                                                  'Method  : ${controller.orderList![index].paymentMethod!}',
                                              weight: FontWeight.bold,
                                              fontSize: 18,
                                              color: kBlack54Color),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: controller.orderList!.length),
                  );
      },
    );
  }
}
