import 'package:flutter/material.dart';
import 'package:ontrend_task/utils/color_consts.dart';

class HomeTopRatedListView extends StatelessWidget {
  const HomeTopRatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
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
                          kBlackColor.withOpacity(0.7),
                          kBlackColor.withOpacity(0.6),
                          kBlackColor.withOpacity(0.0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MC Donald',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '45m to 50m',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 9,
                                ),
                              ),
                              _RatingWidget(),
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
      ),
    );
  }
}

class _RatingWidget extends StatelessWidget {
  const _RatingWidget();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.019,
      width: size.height * 0.043,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(2),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '4.1',
            style: TextStyle(
              fontSize: 10,
              color: kWhiteColor,
            ),
          ),
          Icon(
            Icons.star,
            size: 10,
            color: kWhiteColor,
          ),
        ],
      ),
    );
  }
}
