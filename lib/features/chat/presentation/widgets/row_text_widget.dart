import 'package:flutter/material.dart';

import 'package:chat_group/core/utils/app_colors.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({
    Key? key,
    required this.title1,
    required this.title2,
    required this.onTap,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);
  final String? title1;
  final String? title2;
  final VoidCallback? onTap;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return _rowTextWidget();
  }

  Row _rowTextWidget() {
    return Row(
      mainAxisAlignment: mainAxisAlignment!,
      children: [
        Text(title1!),
        InkWell(
          onTap: onTap!,
          child: Text(
            title2!,
            style: TextStyle(color: AppColors.greenColor),
          ),
        )
      ],
    );
  }
}
