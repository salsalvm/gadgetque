import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/my_order_page/widget/item_details.dart';
import 'package:gadgetque/view/screens/my_order_page/widget/product_status.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:gadgetque/view/screens/widget/two_text_elements_in_row.dart';

class ScreenViewOrder extends StatelessWidget {
  const ScreenViewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SecondAppbar(title: 'View Order'),
      ),
      body: SafeArea(
          child: ListView(
        children: const [
          kHeigt30,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextElementsInRow(
                firstText: 'ORDER ID   :',
                paddding: 10,
                secondText: 'OD12517000362458000',
                wieght: FontWeight.w500,
                fontSize: 18,
                fontColor: kBlack54Color),
          ),
          DivLine(),
          ItemDetails(),
          DivLine(),
          ProductStatus(),
          DivLine(),
        ],
      )),
    );
  }
}
