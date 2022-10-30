import 'package:chat_group/core/utils/app_colors.dart';
import 'package:chat_group/features/chat/presentation/widgets/container_button_widget.dart';
import 'package:chat_group/features/chat/presentation/widgets/text_field_container_widget.dart';
import 'package:flutter/material.dart';

import 'package:chat_group/core/utils/dimensions.dart';

class CreateNewGroupScreen extends StatefulWidget {
  const CreateNewGroupScreen({super.key});

  @override
  State<CreateNewGroupScreen> createState() => _CreateNewGroupScreenState();
}

class _CreateNewGroupScreenState extends State<CreateNewGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new group'),
      ),
      body: Container(
        margin: EdgeInsets.all(context.height10),
        child: Column(
          children: [
            SizedBox(height: context.height10),
            Container(
              height: context.height20 * 3,
              width: context.width20 * 3,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(context.radius30 * 2),
              ),
            ),
            SizedBox(height: context.height10),
            Text(
              'Add group image',
              style: TextStyle(
                color: AppColors.greenColor,
                fontSize: context.font16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: context.height10),
            TextFieldContainerWidget(
                textEditingController: _groupNameController,
                prefixIcon: Icons.person,
                borderRadius: context.radius20 / 2,
                hintText: 'name'),
            SizedBox(height: context.height10),
            Divider(
              thickness: context.height10 * 0.125,
              endIndent: context.height30 * 4,
              indent: context.height30 * 4,
            ),
            SizedBox(height: context.height10),
            ContainerButtonWidget(
              title: 'Create New Group',
              onTap: () {},
            ),
            SizedBox(height: context.height10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'By clicking Create New Group, you agree to the ',
                  style: TextStyle(
                    fontSize: context.font26 / 2,
                    fontWeight: FontWeight.w700,
                    color: AppColors.greyColor,
                  ),
                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: AppColors.greenColor,
                    fontSize: context.font26 / 2,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
