import 'package:flutter/material.dart';
import 'package:gadgetque/model/category_datas_model.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class CatImageDetails extends StatelessWidget {
  final Prodatum products;
  const CatImageDetails({
    Key? key,
    required this.products,
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
            child: CustomText(
                lines: 2,spacing: 1.1,
                name: products.description!,
                weight: FontWeight.w500,
                fontSize: 20,
                color: kBlackColor),
          ),
          kHeigt5,
          CustomText(
              name: products.price!,
              weight: FontWeight.bold,
              fontSize: 24,
              color: kGreenColor),
          kHeigt5,
          CustomText(
              strike: TextDecoration.lineThrough,
              name: products.originalPrice!,
              weight: FontWeight.normal,
              fontSize: 20,
              color: kBlack54Color),
          const CustomText(
              name: 'free delivery',
              weight: FontWeight.w500,
              fontSize: 20,
              color: kBlack54Color)
        ],
      ),
    );
  }
}
