import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/wishlist_page/widget/add_wishlists.dart';


class ListWishlists extends StatelessWidget {
  const ListWishlists({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(borderRadius: kRAdius10),
        child: ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
            // onTap: () => Get.to(
            //    BuyProduct(),
            // ),
            child: Card(
              color: kWhiteColor,shadowColor: kGreyColor,
              shape: RoundedRectangleBorder(borderRadius: kRAdius10),
             
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * .435,
                          child: const ItemText(
                              lines: 2,
                              name: 'Smart Watch Apple Dual core',
                              weight: FontWeight.bold,
                              fontSize: 22,
                              color: kBlackColor),
                        ),
                        kHeigt5,
                        const ItemText(
                            name: 'Apple 6',
                            weight: FontWeight.bold,
                            fontSize: 18,
                            color: kBlack54Color),
                        // kHeigt5,
                        const ItemText(
                            name: 'seller :  Apple Inc.',
                            weight: FontWeight.w500,
                            fontSize: 20,
                            color: kBlack54Color),
                        kHeigt10,
                        ItemText(
                            name: '€14,000',
                            weight: FontWeight.bold,
                            fontSize: 22,
                            color: kGreenColor)
                      ],
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          height: size.width * .4,
                          width: size.width * .435,
                          decoration: BoxDecoration(
                            borderRadius: kRAdius10,
                            color: kWhiteColor,
                            image: const DecorationImage(
                              image: AssetImage(
                                'asset/mobile.png',
                              ),
                            ),
                          ),
                        ),
                        const AddWishlist()
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
