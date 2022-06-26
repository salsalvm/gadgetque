import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/widget/bottombar_items.dart';

import 'package:gadgetque/view/screens/address/screen_address.dart';
import 'package:gadgetque/view/screens/home/screen_home.dart';
import 'package:gadgetque/view/screens/my_order/screen_my_order.dart';
import 'package:gadgetque/view/screens/profile/screen_profile.dart';
import 'package:gadgetque/view/screens/wishlist/screen_wishlist.dart';

ValueNotifier<int> indexChanger = ValueNotifier(0);

class BottomNavigator extends StatelessWidget {
  BottomNavigator({Key? key}) : super(key: key);
  final _pages = [
    ScreenHome(),
    ScreenOrder(),
    ScreenAddress(),
    ScreenWishlist(),
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
      bottomNavigationBar: const BottomBarItems(),
    );
  }
}
