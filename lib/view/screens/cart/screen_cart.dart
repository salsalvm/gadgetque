import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/cart/widget/cart_container.dart';
import 'package:gadgetque/view/screens/cart/widget/cart_items_list.dart';
import 'package:gadgetque/view/screens/cart/widget/crat_total_amount.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SecondAppbar(
          title: 'My Cart',
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            kHeigt10,
            CartContainer(size: size),
            const MainHead(headding: 'Cart Items', top: 20),
            const DivLine(),
            CartitemsList(size: size),
            CartTotalAmount(size: size)
          ],
        ),
      ),
    );
  }
}

