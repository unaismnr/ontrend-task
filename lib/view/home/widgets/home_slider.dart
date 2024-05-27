import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ontrend_task/utils/color_consts.dart';

class HomeSlider extends StatelessWidget {
  HomeSlider({super.key});

  final List images = [
    'https://images.freekaamaal.com/store_desc_images/1525866061.png',
    'https://images.ctfassets.net/trvmqu12jq2l/4IcHz0l78ZGwZcXDkgXDJt/5d5050f7ae5ef2ace0c017d7f0ffe875/IDK_Meal.png?w=1200&fm=png',
    'https://d4t7t8y8xqo0t.cloudfront.net/app/resized/1080X/pages/851/image20190304125848.jpg',
  ];

  final _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          CarouselSlider(
            items: images.map((e) {
              return Builder(builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(e),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              });
            }).toList(),
            options: CarouselOptions(
                height: size.height * 0.18,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                aspectRatio: 2.0,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  _currentIndex.value = index;
                }),
          ),
          SizedBox(height: size.height * 0.001),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              int index = images.indexOf(e);
              return ValueListenableBuilder(
                  valueListenable: _currentIndex,
                  builder: (context, newIndex, _) {
                    return Container(
                      width: size.width * 0.023,
                      height: size.height * 0.023,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: newIndex == index
                            ? kMainColor
                            : kBlackColor.withOpacity(0.5),
                      ),
                    );
                  });
            }).toList(),
          ),
        ],
      ),
    );
  }
}
