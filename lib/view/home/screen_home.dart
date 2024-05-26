import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ontrend_task/utils/color_consts.dart';

import 'widgets/home_app_bar_icons.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: kMainColor,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Janub Ad Dahariz',
                      style: TextStyle(color: kBlackColor),
                    ),
                    Text(
                      'Salalah, Oman',
                      style: TextStyle(color: kBlackColor),
                    ),
                  ],
                ),
                const Spacer(),
                HomeAppBarIcons(
                  icon: Icons.favorite_border,
                  onTap: () {},
                ),
                const SizedBox(
                  width: 6,
                ),
                HomeAppBarIcons(
                  icon: Icons.notifications_none,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar customHomeAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on_outlined,
            color: kMainColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'data',
                style: TextStyle(color: kBlackColor),
              ),
              Text(
                'data',
                style: TextStyle(color: kBlackColor),
              ),
            ],
          ),
        ],
      ),
      // const ListTile(
      //   leading: Icon(
      //     Icons.location_on_outlined,
      //     color: kMainColor,
      //   ),
      //   title: Text(
      //     'data',
      //     style: TextStyle(color: kBlackColor),
      //   ),
      //   subtitle: Text(
      //     'data',
      //     style: TextStyle(color: kBlackColor),
      //   ),
      // ),
      title: Row(
        children: [
          const Spacer(),
          HomeAppBarIcons(
            icon: Icons.favorite_border,
            onTap: () {},
          ),
          const SizedBox(
            width: 6,
          ),
          HomeAppBarIcons(
            icon: Icons.notifications_none,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
