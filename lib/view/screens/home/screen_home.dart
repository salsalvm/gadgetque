import 'package:flutter/material.dart';
import 'package:gadgetque/controller/auth_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/screens/authentication/splash.dart';
import 'package:gadgetque/view/screens/home/widget/carousal_slider.dart';
import 'package:gadgetque/view/screens/home/widget/catogory_search.dart';
import 'package:gadgetque/view/screens/home/widget/most_ratted_items.dart';
import 'package:gadgetque/view/screens/home/widget/recommended_item.dart';
import 'package:gadgetque/view/screens/home/widget/trending_item.dart';
import 'package:gadgetque/view/screens/widget/appbar.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:get/get.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // authController.conectionCheck();
    return Scaffold(
      backgroundColor: kFormColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.width * 0.2),
        child: AppbarMain(),
      ),
      body: ListView(
        children: [
          const MainHead(headding: 'Deals of The Day'),
          const CarasoulSlider(),
          const MainHead(headding: 'Explore Category'),
          CatogorySearch(),
          const MainHead(headding: 'Most Rated Items'),
          const MostRattedItem(),
          const MainHead(headding: 'Recomented Items'),
          const RecomentedItems(),
          const MainHead(headding: 'Trending Now'),
          const TrendingItem(),
        ],
      ),
    );
  }

  final authController = Get.put(AuthenticationController());
}
