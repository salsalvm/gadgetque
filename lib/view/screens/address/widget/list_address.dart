
import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/address/widget/add_edit_address.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/widget/two_text_elements_in_row.dart';
import 'package:get/get.dart';
class ListAddress extends StatelessWidget {
  const ListAddress({
    Key? key,
    
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.67,
      width: size.width,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
                height: size.width * 0.465,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: kRAdius10,
                  color: kBoxColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextElementsInRow(
                          onTap: () {Get.to(AddEditAddress());},
                          paddding: 5,
                          firstText: 'Home',
                          secondText: 'Edit',
                          wieght: FontWeight.bold,
                          fontSize: 20,
                          fontColor: kBlackColor),
                      const DivLine(),
                      kHeigt10,
                      const ItemText(
                          name: 'SALSAL VM',
                          weight: FontWeight.bold,
                          fontSize: 18,
                          color: kBlackColor),
                      Row(
                        children: const [
                          ItemText(
                              name: 'Muchukunnu ,',
                              weight: FontWeight.w500,
                              fontSize: 16,
                              color: kBlack54Color),
                          ItemText(
                              name: 'Koyilandy ,',
                              weight: FontWeight.w500,
                              fontSize: 16,
                              color: kBlack54Color),
                        ],
                      ),
                      Row(
                        children: const [
                          ItemText(
                              name: 'Kozhikode ,',
                              weight: FontWeight.w500,
                              fontSize: 16,
                              color: kBlack54Color),
                          ItemText(
                              name: 'Kerala',
                              weight: FontWeight.w500,
                              fontSize: 16,
                              color: kBlack54Color),
                        ],
                      ),
                      const ItemText(
                          name: '673307',
                          weight: FontWeight.w500,
                          fontSize: 16,
                          color: kBlack54Color),
                      const ItemText(
                          name: '+91 7558959094',
                          weight: FontWeight.w700,
                          fontSize: 16,
                          color: kBlackColor)
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => kHeigt10,
          itemCount: 4),
    );
  }
}
