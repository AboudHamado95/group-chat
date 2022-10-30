import 'package:chat_group/config/routes/app_routes.dart';
import 'package:chat_group/core/cache/cache_helper.dart';
import 'package:chat_group/core/utils/app_colors.dart';
import 'package:chat_group/core/utils/app_icons.dart';
import 'package:chat_group/core/utils/app_strings.dart';
import 'package:chat_group/core/utils/constants.dart';
import 'package:chat_group/core/widgets/error_widget.dart';
import 'package:chat_group/features/chat/domain/entities/user_entity.dart';
import 'package:chat_group/features/chat/presentation/cubit/auth/auth_cubit.dart';
import 'package:chat_group/features/chat/presentation/cubit/credential/credential_cubit.dart';
import 'package:chat_group/features/chat/presentation/cubit/credential/credential_state.dart';
import 'package:chat_group/features/chat/presentation/screens/home_screen.dart';
import 'package:chat_group/features/chat/presentation/widgets/container_button_widget.dart';
import 'package:chat_group/features/chat/presentation/widgets/header_widget.dart';
import 'package:chat_group/features/chat/presentation/widgets/row_text_widget.dart';
import 'package:chat_group/features/chat/presentation/widgets/text_field_container_widget.dart';
import 'package:chat_group/features/chat/presentation/widgets/text_field_password_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_group/core/utils/dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, state) {
      // if (state is UnAuthenticatedState) {
      //   Constants.showToast(message: state.error, state: ToastStates.ERROR);
      // }
      if (state is CredentialSuccess) {
        BlocProvider.of<AuthCubit>(context).loggedIn().then(
            (value) => Constants.navigateAndFinish(context, Routes.homeScreen));
      }
    }, builder: (context, state) {
      if (state is CredentialLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CredentialFailure) {
        return const ErrorsWidget();
      }
      if (state is CredentialSuccess) {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            if (authState is AuthenticatedState) {
              return HomeScreen(uId: authState.uId);
            } else {
              return _buildWidget();
            }
          },
        );
      }
      return _buildWidget();
    });
  }

  Widget _buildWidget() {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            child: Column(
              children: [
                const HeaderWidget(
                  title: 'Login',
                ),
                TextFieldContainerWidget(
                    textEditingController: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                    borderRadius: context.radius20 / 2),
                const SizedBox(height: 10.0),
                TextFieldPasswordContainerWidget(
                  textEditingController: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock,
                ),
                const SizedBox(height: 10.0),
                _forgotPasswordWidget(context),
                const SizedBox(height: 10.0),
                ContainerButtonWidget(
                  title: 'Login',
                  onTap: () {
                    _submitSignIn();
                  },
                ),
                const SizedBox(height: 10.0),
                RowTextWidget(
                  title1: 'Don\'t have an account?',
                  title2: 'Register',
                  onTap: () {
                    Navigator.pushNamed(context, Routes.registerScreen);
                  },
                ),
                const SizedBox(height: 10.0),
                _rowGoogleWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitSignIn() {
    if (_passwordController.text.isEmpty) {
      return;
    }
    if (_emailController.text.isEmpty) {
      return;
    }

    BlocProvider.of<CredentialCubit>(context).submitSignIn(
        user: UserEntity(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim()));
  }

  Row _forgotPasswordWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(''),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.forgotPasswordScreen);
          },
          child: Text(
            'Forgot Password?',
            style: TextStyle(
                color: AppColors.greenColor,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Row _rowGoogleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: context.height10 * 5,
          width: context.width10 * 5,
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(context.radius15 * 3)),
          child: const Icon(
            AppIcons.google,
          ),
        )
      ],
    );
  }
}
