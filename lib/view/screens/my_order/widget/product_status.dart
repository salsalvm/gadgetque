import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/widget/two_text_elements_in_row.dart';

class ProductStatus extends StatelessWidget {
  const ProductStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: const [
          TextElementsInRow(
              paddding: 10,
              firstText: 'Satus           :',
              secondText: 'Placed',
              wieght: FontWeight.w500,
              fontSize: 18,
              fontColor: kBlack54Color),
          kHeigt10,
          TextElementsInRow(
              paddding: 10,
              firstText: 'Method       :',
              secondText: 'COD',
              wieght: FontWeight.w500,
              fontSize: 18,
              fontColor: kBlack54Color),
          kHeigt10,
          TextElementsInRow(
              paddding: 10,
              firstText: 'Total            :',
              secondText: '€30,040',
              wieght: FontWeight.w500,
              fontSize: 18,
              fontColor: kBlack54Color),
          kHeigt10,
          TextElementsInRow(
              paddding: 10,
              firstText: 'Address      :',
              secondText: 'Home',
              wieght: FontWeight.w500,
              fontSize: 18,
              fontColor: kBlack54Color),
        ],
      ),
    );
  }
}
