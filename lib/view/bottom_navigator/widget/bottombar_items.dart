import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';

class BottomBarItems extends StatelessWidget {
  const BottomBarItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChanger,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: kBlackColor,
              unselectedItemColor: kGreyColor,
              onTap: (index) => indexChanger.value = index,
              currentIndex: newIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.local_shipping,
                    ),
                    label: 'MyOrder'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.location_on_outlined,
                    ),
                    label: 'Address'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                    ),
                    label: 'Wishlist'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_outline_rounded,
                    ),
                    label: 'Profile'),
              ]);
        });
  }
}
