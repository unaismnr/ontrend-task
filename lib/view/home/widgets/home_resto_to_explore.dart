import 'package:flutter/material.dart';
import 'package:ontrend_task/utils/color_consts.dart';
import 'package:ontrend_task/view/home/common/rating_widget.dart';

class HomeRestoToExplore extends StatelessWidget {
  const HomeRestoToExplore({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: kBlackColor.withOpacity(0.25),
                    spreadRadius: 0.8,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.17,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: kBlackColor.withOpacity(0.1),
                          spreadRadius: 0.1,
                          blurRadius: 5,
                          offset: const Offset(0, 6),
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQiDGH1SSNR_Q46Qc43yjGXDJE2O6rSihObSDeesHBdaxFs5_FP_MRAVvsX_iJrKkcJGk&usqp=CAU',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Dominos Pizza',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RatingWidget(
                          height: size.height * 0.029,
                          width: size.height * 0.063,
                          textAndIconSized: 14,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pizza, Pastas, Desserts',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          '* OMR 27 for one',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.timelapse,
                          color: kBlueColor,
                        ),
                        SizedBox(width: size.width * 0.02),
                        const Text(
                          '40-45 min',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: size.width * 0.02),
                        const Text(
                          '* 6.8 KM',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Salalah',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: size.width * 0.007),
                        const Icon(
                          Icons.location_on,
                          color: kMainColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                height: size.height * 0.018,
              ),
          itemCount: 10),
    );
  }
}
