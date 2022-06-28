
import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kBoxColor, borderRadius: kRAdius10),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 10.0, top: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemText(
                name: 'Payment Methods',
                weight: FontWeight.bold,
                fontSize: 22,
                color: kBlackColor),
            const DivLine(),
            Column(
              children: [
                Row(
                  children: [
                    Radio(
                        activeColor: kBlueColor,
                        value: 'value',
                        groupValue: 'groupValue',
                        onChanged: (value) {}),
                    const ItemText(
                        name: 'Pay Pal',
                        weight: FontWeight.w500,
                        fontSize: 22,
                        color: kBlackColor),
                    const Spacer(),
                    const Icon(
                      Icons.paypal,
                      size: 35,
                      color: kBlueColor,
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        activeColor: kBlueColor,
                        value: 'value',
                        groupValue: 'groupValue',
                        onChanged: (value) {}),
                    const ItemText(
                        name: 'Razor Pay',
                        weight: FontWeight.w500,
                        fontSize: 22,
                        color: kBlackColor),
                    const Spacer(),
                    const Icon(
                      Icons.paid_sharp,
                      size: 35,
                      color: Colors.yellowAccent,
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        activeColor: kBlueColor,
                        value: 'value',
                        groupValue: 'groupValue',
                        onChanged: (value) {}),
                    const ItemText(
                        name: 'COD',
                        weight: FontWeight.w500,
                        fontSize: 22,
                        color: kBlackColor),
                    const Spacer(),
                    const Icon(
                      Icons.local_shipping_outlined,
                      size: 35,
                      color: kredColor,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
