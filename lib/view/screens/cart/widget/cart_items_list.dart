import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/entry_pages/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:get/get.dart';

class CartitemsList extends StatelessWidget {
  const CartitemsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * .497,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView.separated(
          separatorBuilder: (context, index) => kHeigt10,
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: kRAdius10,
              color: kBoxColor,
            ),
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
                          onConfirm: () {},
                          title: 'Are You Sure',
                          onCancel: () {});
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
                  leading: Container(
                    width: size.width * 0.18,
                    height: size.width * 0.18,
                    decoration: BoxDecoration(
                        borderRadius: kRAdius10,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('asset/lap.png'))),
                  ),
                  title: const ItemText(
                      name: 'Samrt Watch',
                      weight: FontWeight.bold,
                      fontSize: 20,
                      color: kBlackColor),
                  subtitle: const ItemText(
                      name: '1',
                      weight: FontWeight.bold,
                      fontSize: 22,
                      color: kBlackColor),
                  trailing: Column(
                    children: const [
                      ItemText(
                          name: '€14,000',
                          weight: FontWeight.w600,
                          fontSize: 20,
                          color: kBlackColor),
                      ItemText(
                          strike: TextDecoration.lineThrough,
                          name: '€18,000',
                          weight: FontWeight.normal,
                          fontSize: 18,
                          color: kBlackColor),
                    ],
                  ),
                ),
              ),
            ),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
