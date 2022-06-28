import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/my_order/widget/list_order.dart';
import 'package:gadgetque/view/screens/widget/appbar.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';

class ScreenOrder extends StatelessWidget {
  const ScreenOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarMain(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SafeArea(
          child: ListView(
            children: const [
              MainHead(headding: 'My Order', top: 10),
              OrderList(),
              kHeigt20
            ],
          ),
        ),
      ),
    );
  }
}
