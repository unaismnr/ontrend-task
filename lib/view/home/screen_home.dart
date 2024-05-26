import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ontrend_task/utils/color_consts.dart';

import 'widgets/home_app_bar_icons.dart';

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
                  child: _CustomAppBar(),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                const _CustomSearchBar(),
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
                HomeOfferWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeOfferWidget extends StatelessWidget {
  const HomeOfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: size.height * 0.04,
                  backgroundImage: const NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQiDGH1SSNR_Q46Qc43yjGXDJE2O6rSihObSDeesHBdaxFs5_FP_MRAVvsX_iJrKkcJGk&usqp=CAU',
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                const Text('Cucumber'),
              ],
            ),
          );
        });
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

class HomeCategoryContainer extends StatelessWidget {
  const HomeCategoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
              )
            ]),
        child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: size.height * 0.04,
                      backgroundImage: const NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQiDGH1SSNR_Q46Qc43yjGXDJE2O6rSihObSDeesHBdaxFs5_FP_MRAVvsX_iJrKkcJGk&usqp=CAU',
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    const Text('Cucumber'),
                  ],
                ),
              );
            }));
  }
}

class HomeSlider extends StatelessWidget {
  HomeSlider({
    super.key,
  });

  final List images = [
    'https://media.istockphoto.com/id/1316145932/photo/table-top-view-of-spicy-food.jpg?b=1&s=612x612&w=0&k=20&c=X6CkFGpSKhNZeiii8Pp2M_YrBdqs7tRaBytkGi48a0U=',
    'https://www.eatright.org/-/media/images/eatright-landing-pages/foodgroupslp_804x482.jpg?as=0&w=967&rev=d0d1ce321d944bbe82024fff81c938e7&hash=E6474C8EFC5BE5F0DA9C32D4A797D10D',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQiDGH1SSNR_Q46Qc43yjGXDJE2O6rSihObSDeesHBdaxFs5_FP_MRAVvsX_iJrKkcJGk&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
          height: MediaQuery.of(context).size.height * 0.18,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          enlargeCenterPage: true,
          viewportFraction: 1.0,
          aspectRatio: 2.0,
          initialPage: 0,
        ));
  }
}

class _CustomSearchBar extends StatelessWidget {
  const _CustomSearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 6,
            )
          ]),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          const Icon(Icons.search, color: kMainColor),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Dishes, Resturants, Burger, Pizza...',
                hintStyle: TextStyle(fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic, color: kMainColor),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

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
