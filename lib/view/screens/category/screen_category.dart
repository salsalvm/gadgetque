import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/screens/category/widget/category_grid.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBoxColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SecondAppbar(title: 'Laptop'),
      ),
      body: SafeArea(
        child: CategoryGrid(),
      ),
    );
  }
}
