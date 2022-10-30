import 'package:chat_group/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorsWidget extends StatelessWidget {
  final VoidCallback? onPress;
  const ErrorsWidget({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: AppColors.primaryColor,
            size: 150.0,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12.0),
          child: const Text(
            'Something Went Wrong',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          'Please Try Again',
          style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w500),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
            backgroundColor: AppColors.primaryColor,
            elevation: 500,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48.0)),
          ),
          child: const Text(
            'Reload Screen',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            if (onPress != null) onPress!();
          },
        ),
      ],
    );
  }
}
