import 'package:flutter/material.dart';
import 'package:gadgetque/view/screens/widget/appbar.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:gadgetque/view/screens/wishlist/widget/list_wishlists.dart';

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
              headding: 'Wishlist',
            ),
            ListWishlists(),
          ],
        ),
      ),
    );
  }
}
