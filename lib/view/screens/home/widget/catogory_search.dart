
import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';

class CatogorySearch extends StatelessWidget {
  const CatogorySearch({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.56,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: size.width * 0.45,
                  height: size.width * 0.45,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'asset/entry_background.png',
                      ),
                    ),
                  ),
                ),
                Container(
                  child:  Center(
                    child: Text(
                      'Laptop',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: size.width * 0.45,
                  height: size.width * 0.11,
                  decoration: const BoxDecoration(
                    color: kBoxColor,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10)),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
