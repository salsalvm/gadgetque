import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/widget/appbar.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:gadgetque/view/screens/wishlist_page/widget/list_wishlists.dart';

class ScreenWishlist extends StatelessWidget {
  const ScreenWishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarMain(),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            MainHead(
              top: 15,
              headding: 'Wishlist',
            ),
            DivLine(),
            kHeigt5,
            ListWishlists(),
          ],
        ),
      ),
    );
  }
}
