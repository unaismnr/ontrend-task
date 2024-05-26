import 'package:flutter/material.dart';
import 'package:ontrend_task/utils/color_consts.dart';

class HomeAppBarIcons extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const HomeAppBarIcons({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.042,
      width: MediaQuery.of(context).size.height * 0.042,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: kBlackColor.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ]),
          child: CircleAvatar(
            backgroundColor: kWhiteColor,
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
