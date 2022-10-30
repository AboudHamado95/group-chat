import 'package:flutter/material.dart';

import 'package:chat_group/core/utils/app_colors.dart';
import 'package:chat_group/core/utils/dimensions.dart';

class TextFieldContainerWidget extends StatelessWidget {
  const TextFieldContainerWidget({
    Key? key,
    required this.textEditingController,
    required this.prefixIcon,
    required this.borderRadius,
    this.keyboardType = TextInputType.text,
    this.color,
    this.hintText,
    this.iconClickEvent,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final String? hintText;
  final double borderRadius;
  final Color? color;
  final VoidCallback? iconClickEvent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: context.screenWidth,
      decoration: BoxDecoration(
        color: color ?? AppColors.whiteColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextField(
        controller: textEditingController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? '',
          prefixIcon: InkWell(onTap: iconClickEvent, child: Icon(prefixIcon)),
        ),
      ),
    );
  }
}
