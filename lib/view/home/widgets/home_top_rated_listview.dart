import 'package:flutter/material.dart';
import 'package:ontrend_task/utils/color_consts.dart';

class HomeTopRatedListView extends StatelessWidget {
  const HomeTopRatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: size.width * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQiDGH1SSNR_Q46Qc43yjGXDJE2O6rSihObSDeesHBdaxFs5_FP_MRAVvsX_iJrKkcJGk&usqp=CAU',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width * 0.35,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        kBlackColor.withOpacity(0.8),
                        kBlackColor.withOpacity(0.7),
                        kBlackColor.withOpacity(0.0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Dominos Pizza',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Starting from',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 9,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'OMR 20',
                              style: TextStyle(
                                color: Color.fromARGB(255, 69, 255, 75),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            const Text(
                              'OMR 20',
                              style: TextStyle(
                                color: kWhiteColor,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 3,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: size.width * 0.03,
        ),
        itemCount: 10,
      ),
    );
  }
}
