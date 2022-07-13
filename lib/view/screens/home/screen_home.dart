import 'package:flutter/material.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/screens/home/widget/recommended_item.dart';
import 'package:gadgetque/view/screens/home/widget/most_ratted_items.dart';
import 'package:gadgetque/view/screens/home/widget/carousal_slider.dart';
import 'package:gadgetque/view/screens/home/widget/catogory_search.dart';
import 'package:gadgetque/view/screens/home/widget/trending_item.dart';
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
          MainHead(headding: 'Deals of The Day'),
          CarasoulSlider(),
          MainHead(headding: 'Explore Category'),
          CatogorySearch(),
          MainHead(headding: 'Most Ratted Items'),
          MostRattedItem(),
          MainHead(headding: 'Reccomented Items'),
          RecommendedItem(),
          MainHead(headding: 'Trending Now'),
          TrendingItem(),
          // FootterHome(),
          // FooterCopyrites()
        ],
      ),
    );
  }
}
