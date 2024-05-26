import 'package:flutter/material.dart';
import 'package:ontrend_task/utils/color_consts.dart';

import 'widgets/home_category_container.dart';
import 'widgets/home_custom_appbar.dart';
import 'widgets/home_offer_gridview.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/home_slider.dart';
import 'widgets/home_top_rated_listview.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: HomeCustomAppBar(),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                const HomeSearchBar(),
                SizedBox(
                  height: size.height * 0.03,
                ),
                HomeSlider(),
                SizedBox(height: size.height * 0.03),
                const HomeTitles(title: 'Categories'),
                SizedBox(height: size.height * 0.015),
                const HomeCategoryContainer(),
                SizedBox(height: size.height * 0.02),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Offers',
                      style: TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                const HomeOfferGridView(),
                SizedBox(height: size.height * 0.015),
                const HomeTitles(title: 'Top Rated Restaurants Near You'),
                SizedBox(height: size.height * 0.015),
                const HomeTopRatedListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeTitles extends StatelessWidget {
  final String title;
  const HomeTitles({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: kBlackColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
