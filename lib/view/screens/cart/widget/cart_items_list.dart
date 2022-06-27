import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class CartitemsList extends StatelessWidget {
  const CartitemsList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.765,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemExtent: size.width * 0.255,
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: kRAdius10,
                color: kBoxColor,
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
          itemCount: 4,
        ),
      ),
    );
  }
}
