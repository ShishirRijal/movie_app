import 'package:flutter/material.dart';

import '../constants.dart';

class UnderlinedText extends StatelessWidget {
  final String title;
  const UnderlinedText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: kTitleTextStyle,
        ),
        const SizedBox(height: 3.0),
        Container(
          height: 2.0,
          width: title.length * 7,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ],
    );
  }
}
