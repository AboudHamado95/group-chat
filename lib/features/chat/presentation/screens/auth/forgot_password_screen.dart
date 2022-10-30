import 'package:chat_group/config/routes/app_routes.dart';
import 'package:chat_group/core/utils/app_strings.dart';
import 'package:chat_group/features/chat/presentation/widgets/container_button_widget.dart';
import 'package:chat_group/features/chat/presentation/widgets/header_widget.dart';
import 'package:chat_group/features/chat/presentation/widgets/row_text_widget.dart';
import 'package:chat_group/features/chat/presentation/widgets/text_field_container_widget.dart';
import 'package:chat_group/features/chat/presentation/widgets/text_field_password_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_group/core/utils/dimensions.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: context.height20, vertical: context.height20),
            child: Column(
              children: [
                const HeaderWidget(title: 'Forgot Password'),
                SizedBox(height: context.height20),
                const Text(
                    'Don\'t worry! just fill in your email and ${AppStrings.appName} will send you a link to rest your password.'),
                SizedBox(height: context.height20),
                TextFieldContainerWidget(
                  textEditingController: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                  borderRadius: context.radius20 / 2,
                ),
                SizedBox(height: context.height20),
                ContainerButtonWidget(
                  title: 'Send Password Reset Email',
                  onTap: () {
                    //TODO: navigate.
                  },
                ),
                SizedBox(height: context.height20),
                RowTextWidget(
                  title1: 'Remember account information?',
                  title2: 'Login',
                  onTap: () {
                    // ignore: todo
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.loginScreen, (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
