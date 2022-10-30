import 'package:chat_group/config/routes/app_routes.dart';
import 'package:chat_group/features/chat/presentation/widgets/single_item_group_widget.dart';
import 'package:flutter/material.dart';

import 'package:chat_group/core/utils/dimensions.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(context.height10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SingleItemGroupWidget(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.singleChatScreen);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.createNewGroupScreen);
        },
        child: Icon(Icons.group_add_outlined),
      ),
    );
  }
}
