import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/my_order/screen_view_order.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/widget/ratting_item.dart';
import 'package:get/get.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * .73,
      width: size.width,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => Get.to(const ScreenViewOrder(),),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: kRAdius10, color: kBoxColor),
                  height: size.width * .35,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: size.width * .31,
                          width: size.width * .31,
                          decoration: BoxDecoration(
                            borderRadius: kRAdius10,
                            color: kWhiteColor,
                            image: const DecorationImage(
                              image: AssetImage(
                                'asset/mobile.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            ItemText(
                                name: 'Deliver On Jan 09',
                                weight: FontWeight.bold,
                                fontSize: 18,
                                color: kBlackColor),
                            ItemText(
                                name: 'Smart Watch',
                                weight: FontWeight.w500,
                                fontSize: 18,
                                color: kBlack54Color),
                            RattingItems(size: 24),
                            ItemText(
                                name: 'Rate this Product Now',
                                weight: FontWeight.bold,
                                fontSize: 16,
                                color: kBlack54Color),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => kHeigt10,
          itemCount: 10),
    );
  }
}
