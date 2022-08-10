import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AllCoupons extends StatelessWidget {
  const AllCoupons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return controller.coupon!.length == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.coupon!.isEmpty
                ? const Center(
                    child: ItemText(
                        name:
                            'no offers\navailable now\nplease waite for your next time',
                        weight: FontWeight.normal,
                        fontSize: 16,
                        color: kGreyColor),
                  )
                : Container(
                    height: size.height * .14,
                    width: size.width,
                    decoration: BoxDecoration(borderRadius: kRAdius10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final coupon = controller.coupon![index];
                        List<String> str = coupon.expiry.toString().split(' ');
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              color: Colors.amber[200],
                              shadowColor: kGreyColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: kRAdius10,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 17,
                                      backgroundColor: kBlack54Color,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 4.0, bottom: 3),
                                        child: ItemText(
                                            weight: FontWeight.w500,
                                            fontSize: 16,
                                            name: '${index + 1}',
                                            color: kWhiteColor),
                                      ),
                                    ),
                                    kWidth10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ItemText(
                                            lines: 2,
                                            name: coupon.coupon,
                                            weight: FontWeight.bold,
                                            fontSize: 22,
                                            color: kGreenColor),
                                        kHeigt5,
                                        ItemText(
                                            lines: 2,
                                            name: 'EXP: ${str[0]}',
                                            weight: FontWeight.w500,
                                            fontSize: 18,
                                            color: kBlack54Color),
                                      ],
                                    ),
                                    kWidth30,
                                    Container(
                                      height: size.width * .16,
                                      width: size.width * .2,
                                      decoration: BoxDecoration(
                                        borderRadius: kRAdius10,
                                        color: kYellowColor,
                                      ),
                                      child: Center(
                                          child: ItemText(
                                              weight: FontWeight.w500,
                                              fontSize: 25,
                                              name: '${coupon.offer}%',
                                              color: kBlackColor)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: controller.coupon!.length,
                    ),
                  );
      },
    );
  }
}
