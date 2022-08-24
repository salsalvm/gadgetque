import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';
import 'package:gadgetque/view/constant/space.dart';
import 'package:gadgetque/view/screens/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/product_view_page/screen_product.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/wishlist_page/widget/add_wishlists.dart';
import 'package:get/get.dart';

class MySearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          color: kGreyColor,
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(
            Icons.clear,
          ))
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(
      context,
    );
    return theme.copyWith(
      textTheme: const TextTheme(
          headline6: TextStyle(
        color: kBlackColor,
      )),
      hintColor: kBlack54Color,
      appBarTheme: const AppBarTheme(
        color: kBoxColor,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          const InputDecorationTheme(
            border: InputBorder.none,
          ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: kBlackColor,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final searched = homeController.products!
        .toList()
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return searched.isEmpty
        ? const Center(
            child: CustomText(
                name: 'No Product Found',
                weight: FontWeight.normal,
                fontSize: 14,
                color: kGreyColor))
        : GridView.builder(
            itemCount: searched.length,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1 / 1.75,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Get.to(BuyProduct(
                  products: searched[index],
                )),
                child: Card(
                  color: kWhiteColor,
                  shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            FadeInImage.assetNetwork(
                                fit: BoxFit.fill,
                                width: size.width * .5,
                                height: size.width * .45,
                                placeholder: 'asset/noimage.jpeg',
                                image:
                                    'http://34.238.154.28/product-image/${searched[index].id}/${searched[index].imageId}_1.jpg'),
                            const AddWishlist(radius: 20, iconSize: 34),
                          ],
                        ),
                        kHeigt5,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: CustomText(
                                  lines: 2,
                                  name: searched[index].name,
                                  weight: FontWeight.w500,
                                  fontSize: 18,
                                  color: kBlackColor),
                            ),
                            kHeigt5,
                            CustomText(
                                name: searched[index].description,
                                weight: FontWeight.w500,
                                fontSize: 16,
                                color: kBlack54Color),
                            Row(
                              children: [
                                CustomText(
                                    name: searched[index].price,
                                    weight: FontWeight.bold,
                                    fontSize: 20,
                                    color: kGreenColor),
                                CustomText(
                                    strike: TextDecoration.lineThrough,
                                    name: searched[index].originalPrice,
                                    weight: FontWeight.normal,
                                    fontSize: 17,
                                    color: kBlack54Color),
                              ],
                            ),
                            const CustomText(
                                name: 'free delivery',
                                weight: FontWeight.w500,
                                fontSize: 18,
                                color: kBlack54Color)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }

// search element
  @override
  Widget buildSuggestions(BuildContext context) {
    final searched = homeController.products!
        .toList()
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return searched.isEmpty
        ? const Center(
            child: CustomText(
                name: 'No Product Found',
                weight: FontWeight.normal,
                fontSize: 14,
                color: kGreyColor))
        : GridView.builder(
            itemCount: searched.length,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1 / 1.75,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Get.to(BuyProduct(
                  products: searched[index],
                )),
                child: Card(
                  color: kWhiteColor,
                  shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            FadeInImage.assetNetwork(
                                fit: BoxFit.fill,
                                width: size.width * .5,
                                height: size.width * .45,
                                placeholder: 'asset/noimage.jpeg',
                                image:
                                    'http://34.238.154.28/product-image/${searched[index].id}/${searched[index].imageId}_1.jpg'),
                            const AddWishlist(radius: 20, iconSize: 34),
                          ],
                        ),
                        kHeigt5,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: CustomText(
                                  lines: 2,
                                  name: searched[index].name,
                                  weight: FontWeight.w500,
                                  fontSize: 18,
                                  color: kBlackColor),
                            ),
                            kHeigt5,
                            CustomText(
                                name: searched[index].description,
                                weight: FontWeight.w500,
                                fontSize: 16,
                                color: kBlack54Color),
                            Row(
                              children: [
                                CustomText(
                                    name: searched[index].price,
                                    weight: FontWeight.bold,
                                    fontSize: 20,
                                    color: kGreenColor),
                                CustomText(
                                    strike: TextDecoration.lineThrough,
                                    name: searched[index].originalPrice,
                                    weight: FontWeight.normal,
                                    fontSize: 17,
                                    color: kBlack54Color),
                              ],
                            ),
                            const CustomText(
                                name: 'free delivery',
                                weight: FontWeight.w500,
                                fontSize: 18,
                                color: kBlack54Color)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }

  final homeController = Get.put(HomeController());
}
