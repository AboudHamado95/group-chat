import 'package:flutter/material.dart';

import 'package:chat_group/core/utils/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 35,
                color: AppColors.greenColor,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
