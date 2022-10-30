import 'package:flutter/material.dart';

import 'package:chat_group/core/utils/app_colors.dart';

import '../../../../core/utils/dimensions.dart';

class ContainerButtonWidget extends StatelessWidget {
  const ContainerButtonWidget(
      {Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 44,
        width: context.screenWidth,
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.circular(context.radius20 / 2),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: context.font16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
