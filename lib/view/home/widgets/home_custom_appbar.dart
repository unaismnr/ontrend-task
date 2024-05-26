import 'package:flutter/material.dart';
import 'package:ontrend_task/utils/color_consts.dart';

import 'home_app_bar_icons.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: kMainColor,
          size: 25,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Janub Ad Dahariz',
              style: TextStyle(
                fontSize: 15,
                color: kBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Salalah, Oman',
              style: TextStyle(
                color: kBlueColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        HomeAppBarIcons(
          icon: Icons.favorite_border,
          onTap: () {},
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        HomeAppBarIcons(
          icon: Icons.notifications_none,
          onTap: () {},
        ),
      ],
    );
  }
}
