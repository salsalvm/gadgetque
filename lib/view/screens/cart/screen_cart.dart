import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/screens/home/widget/item_text.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SecondAppbar(
            title: 'My Cart',
          )),
      body: SafeArea(
        child: Column(
          children:const [
            ItemText(
                name: 'Shopping Cart',
                weight: FontWeight.bold,
                fontSize: 24,
                color: kBlackColor),
                ItemText(name: 'Shop', weight: FontWeight.normal, fontSize: 18, color: kBlack54Color)
          ],
        ),
      ),
    );
  }
}
