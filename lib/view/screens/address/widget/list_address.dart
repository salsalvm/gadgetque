import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/authentication/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/screens/address/widget/add_edit_address.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
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
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => Card(
                color: kBoxColor,
                shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ItemText(
                              name: 'Home',
                              weight: FontWeight.bold,
                              fontSize: 20,
                              color: kBlackColor),
                          Wrap(children: [
                            IconButton(
                                onPressed: () {
                                  Get.dialog(
                                    const AddEditAddress(),
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: kGreenColor,
                                )),
                            IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      backgroundColor: kBoxColor,
                                      buttonColor: kButtonColor,
                                      middleText: 'Do you Want to Remove',
                                      onConfirm: () {},
                                      title: 'Are You Sure',
                                      onCancel: () {});
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: kredColor,
                                ))
                          ])
                        ],
                      ),
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
          itemCount: 4),
    );
  }
}
