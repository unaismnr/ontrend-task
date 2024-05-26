import 'package:flutter/material.dart';
import 'package:ontrend_task/utils/color_consts.dart';

class HomeRestoToExplore extends StatelessWidget {
  const HomeRestoToExplore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
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
          ],
        ),
      ),
    );
  }
}
