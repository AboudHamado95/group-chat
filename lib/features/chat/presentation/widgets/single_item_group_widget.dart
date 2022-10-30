import 'package:chat_group/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:chat_group/core/utils/dimensions.dart';

class SingleItemGroupWidget extends StatelessWidget {
  const SingleItemGroupWidget({Key? key, required this.onTap})
      : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: context.height10/2),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: context.height10 * 5,
                  width: context.width10 * 5,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(context.radius20 * 2.5),
                  ),
                  child: Text(''),
                ),
                SizedBox(width: context.width10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: context.width10),
                      Text(
                        'username',
                        style: TextStyle(
                            fontSize: context.font16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'status',
                        style: TextStyle(
                            fontSize: context.font26 / 3,
                            color: Colors.black.withOpacity(.2),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: context.width10),
                      Container(
                        margin: EdgeInsets.only(right: context.width20),
                        child: Divider(
                          color: AppColors.greyColor.withOpacity(0.2),
                          thickness: context.height10 *0.125,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
