import 'package:flutter/material.dart';
import 'package:ontrend_task/utils/color_consts.dart';

class RatingWidget extends StatelessWidget {
  final double height;
  final double width;
  final double textAndIconSized;
  const RatingWidget({
    super.key,
    required this.height,
    required this.width,
    required this.textAndIconSized,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '4.1',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: textAndIconSized,
                color: kWhiteColor,
              ),
            ),
            Icon(
              Icons.star,
              size: textAndIconSized,
              color: kWhiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
