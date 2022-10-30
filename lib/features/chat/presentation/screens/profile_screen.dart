import 'package:chat_group/features/chat/presentation/widgets/container_button_widget.dart';
import 'package:chat_group/features/chat/presentation/widgets/text_field_container_widget.dart';
import 'package:flutter/material.dart';

import 'package:chat_group/core/utils/dimensions.dart';
import 'package:fluttericon/zocial_icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.height20),
      child: Column(
        children: [
          Container(
            height: context.height20 * 3,
            width: context.width20 * 3,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(context.radius20 * 3),
            ),
            child: const Center(child: Text('')),
          ),
          SizedBox(height: context.height10),
          const Text('Remove profile photo'),
          SizedBox(height: context.height10),
          TextFieldContainerWidget(
              textEditingController: _nameController,
              prefixIcon: Icons.person,
              hintText: 'name',
              borderRadius: context.radius20 / 2),
          SizedBox(height: context.height10),
          TextFieldContainerWidget(
              textEditingController: _statusController,
              prefixIcon: Zocial.statusnet,
              hintText: 'status',
              borderRadius: context.radius20 / 2),
          SizedBox(height: context.height10),
          Divider(thickness: context.height10 * 0.125),
          SizedBox(height: context.height10),
          ContainerButtonWidget(
            title: 'Update Profile',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
