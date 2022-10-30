import 'package:flutter/material.dart';

import 'package:chat_group/core/utils/app_colors.dart';
import 'package:chat_group/core/utils/dimensions.dart';

typedef ToolbarIndexController = Function(int index);

class CustomToolBarWidget extends StatefulWidget {
  const CustomToolBarWidget(
      {Key? key, required this.toolbarIndexController, this.pageIndex = 0})
      : super(key: key);

  final ToolbarIndexController toolbarIndexController;
  final int pageIndex;

  @override
  State<CustomToolBarWidget> createState() => _CustomToolBarWidgetState();
}

class _CustomToolBarWidgetState extends State<CustomToolBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height10 * 5,
      decoration: BoxDecoration(color: AppColors.primaryColor),
      child: Row(
        children: [
          Expanded(
            child: ToolBarItem(
              onTap: () {
                widget.toolbarIndexController(1);
              },
              title: 'Groups',
              borderColor:
                  widget.pageIndex == 1 ? Colors.white : Colors.transparent,
              textColor: widget.pageIndex == 1 ? Colors.white : Colors.black,
              borderWidth: 0,
            ),
          ),
          Expanded(
            child: ToolBarItem(
              onTap: () {
                widget.toolbarIndexController(0);
              },
              title: 'Users',
              borderColor:
                  widget.pageIndex == 0 ? Colors.white : Colors.transparent,
              textColor: widget.pageIndex == 0 ? Colors.white : Colors.black,
              borderWidth: 0,
            ),
          ),
          Expanded(
            child: ToolBarItem(
              onTap: () {
                widget.toolbarIndexController(2);
              },
              title: 'Profile',
              borderColor:
                  widget.pageIndex == 2 ? Colors.white : Colors.transparent,
              textColor: widget.pageIndex == 2 ? Colors.white : Colors.black,
              borderWidth: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class ToolBarItem extends StatelessWidget {
  const ToolBarItem(
      {Key? key,
      this.title,
      this.textColor,
      this.borderColor,
      this.borderWidth = 3,
      this.onTap})
      : super(key: key);
  final String? title;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: context.height10 * 5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: borderColor!, width: borderWidth!),
          ),
        ),
        child: Text(
          title!,
          style: TextStyle(
              fontSize: context.font16,
              fontWeight: FontWeight.w500,
              color: textColor),
        ),
      ),
    );
  }
}
