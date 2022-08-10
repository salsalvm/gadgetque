import 'package:flutter/material.dart';
import 'package:gadgetque/view/screens/my_order_page/widget/grid_view_product.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';

class ScreenViewOrder extends StatelessWidget {
  const ScreenViewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SecondAppbar(title: 'View Products'),
      ),
      body: SafeArea(
        child: ViewProduct(),
      ),
    );
  }
}
