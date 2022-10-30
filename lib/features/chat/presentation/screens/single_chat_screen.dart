import 'package:chat_group/core/utils/app_colors.dart';
import 'package:chat_group/features/chat/presentation/widgets/text_field_container_widget.dart';
import 'package:flutter/material.dart';

import 'package:chat_group/core/utils/dimensions.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({super.key});

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    _messageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('name'),
      ),
      body: Column(
        children: [
          Expanded(child: _listMessageWidget()),
          _inputMessageTextField(context),
        ],
      ),
    );
  }

  _listMessageWidget() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text('');
      },
    );
  }

  Widget _inputMessageTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.height10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.radius20 * 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: context.width10),
                  const Icon(Icons.insert_emoticon),
                  SizedBox(width: context.width10),
                  Expanded(
                    child: Scrollbar(
                      child: TextFormField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                            hintText: 'Type a message',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  const Icon(Icons.link),
                  SizedBox(width: context.width20 / 5),
                  const Icon(Icons.camera_alt),
                  SizedBox(width: context.width10),
                ],
              ),
            ),
          ),
          SizedBox(width: context.width10),
          Container(
            height: context.height15 * 3,
            width: context.width15 * 3,
            decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.circular(context.radius15 * 3)),
            child: Icon(
                _messageController.text.isEmpty ? Icons.mic : Icons.send,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
