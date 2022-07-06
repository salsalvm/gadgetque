import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/widget/bottombar_items.dart';

import 'package:gadgetque/view/screens/address/screen_address.dart';
import 'package:gadgetque/view/screens/home/screen_home.dart';
import 'package:gadgetque/view/screens/my_order/screen_my_order.dart';
import 'package:gadgetque/view/screens/profile/screen_profile.dart';
import 'package:gadgetque/view/screens/wishlist/screen_wishlist.dart';



class BottomNavigator extends StatelessWidget {
  BottomNavigator({Key? key}) : super(key: key);
ValueNotifier<int> indexChanger = ValueNotifier(0);
  final _pages = [
    const ScreenHome(),
    const ScreenOrder(),
    const ScreenAddress(),
    const ScreenWishlist(),
    ScreenProfile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChanger,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar:  BottomBarItems(indexChanger: indexChanger),
    );
  }
}
