import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.815,
            child: const ItemText(
                lines: 2,
                name: 'Smart Phone Apple Dual core Fully  Watter proof',
                weight: FontWeight.w500,
                fontSize: 20,
                color: kBlack54Color),
          ),
          kHeigt5,
          const ItemText(
              name: 'Apple',
              weight: FontWeight.w500,
              fontSize: 20,
              color: kBlack54Color),
          kHeigt5,
          ItemText(
              name: '€40,000',
              weight: FontWeight.bold,
              fontSize: 24,
              color: kGreenColor),
          const ItemText(
              name: 'free delivery',
              weight: FontWeight.w500,
              fontSize: 20,
              color: kBlack54Color)
        ],
      ),
    );
  }
}
