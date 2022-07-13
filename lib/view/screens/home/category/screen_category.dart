import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/screens/home/category/widget/category_grid.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';


class ScreenCategory extends StatelessWidget {final String? category;
   ScreenCategory({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kBoxColor,
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(60),
        child: SecondAppbar(title: category!),
      ),
      body:const SafeArea(
        child: CategoryGrid(),
      ),
    );
  }
}
