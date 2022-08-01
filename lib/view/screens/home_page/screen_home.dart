import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/screens/home_page/widget/carousal_slider.dart';
import 'package:gadgetque/view/screens/home_page/widget/catogory_search.dart';
import 'package:gadgetque/view/screens/home_page/widget/most_ratted_items.dart';
import 'package:gadgetque/view/screens/home_page/widget/recommended_item.dart';
import 'package:gadgetque/view/screens/home_page/widget/trending_item.dart';
import 'package:gadgetque/view/screens/widget/appbar.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFormColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.width * 0.2),
        child: const AppbarMain(),
      ),
      body: ListView(
        children: [
          const MainHead(headding: 'Deals of The Day'),
          const CarasoulSlider(),
          const MainHead(headding: 'Explore Category'),
          CatogorySearch(),
          const MainHead(headding: 'Most Ratted Items'),
          const MostRattedItem(),
          const MainHead(headding: 'Reccomented Items'),
          RecommendedItem(),
          const MainHead(headding: 'Trending Now'),
          const TrendingItem(),
        ],
      ),
    );
  }
}