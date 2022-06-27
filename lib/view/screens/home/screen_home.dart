import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/entry_pages/widget/app_bar.dart';
import 'package:gadgetque/view/screens/home/widget/recommended_item.dart';
import 'package:gadgetque/view/screens/home/widget/copy_right.dart';
import 'package:gadgetque/view/screens/home/widget/footter_home.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
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
    final size = MediaQuery.of(context).size;
   
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.width * 0.2),
        child: AppbarMain(size: size),
      ),
      body: ListView(
        children: [
          const MainHead(headding: 'Deals of The Day'),
          CarasoulSlider(size: size),
          const MainHead(headding: 'Explore Catogory'),
          CatogorySearch(size: size),
          const MainHead(headding: 'Most Ratted Items'),
          MostRattedItem(size: size),
          const MainHead(headding: 'Reccomented Items'),
          RecommendedItem(size: size),
          const MainHead(headding: 'Trending Now'),
          TrendingItem(size: size),
          FootterHome(size: size),
          FooterCopyrites(size: size)
        ],
      ),
    );
  }
}

