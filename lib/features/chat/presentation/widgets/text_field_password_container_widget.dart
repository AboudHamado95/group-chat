import 'package:flutter/material.dart';

import 'package:chat_group/core/utils/app_colors.dart';
import 'package:chat_group/core/utils/dimensions.dart';

class TextFieldPasswordContainerWidget extends StatefulWidget {
  const TextFieldPasswordContainerWidget(
      {Key? key,
      required this.textEditingController,
      required this.keyboardType,
      required this.prefixIcon,
      this.hintText})
      : super(key: key);

  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final IconData prefixIcon;
  final String? hintText;

  @override
  State<TextFieldPasswordContainerWidget> createState() =>
      _TextFieldPasswordContainerWidgetState();
}

class _TextFieldPasswordContainerWidgetState
    extends State<TextFieldPasswordContainerWidget> {
  bool isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: context.screenWidth,
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(context.radius20 / 2),
      ),
      child: TextField(
        obscureText: isObscureText,
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText ?? '',
            prefixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(widget.prefixIcon)),
            suffixIcon: Icon(isObscureText == true
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined)),
      ),
    );
  }
}
