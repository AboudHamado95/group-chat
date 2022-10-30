import 'package:chat_group/config/routes/app_routes.dart';
import 'package:chat_group/core/cache/cache_helper.dart';
import 'package:chat_group/core/utils/app_colors.dart';
import 'package:chat_group/core/utils/app_strings.dart';
import 'package:chat_group/core/utils/assets_manager.dart';
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
import 'package:flutter_conditional_rendering/conditional.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordAgainController.dispose();
    _dateController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<CredentialCubit, CredentialState>(
          listener: (context, state) {
            if (state is CredentialSuccess) {
              BlocProvider.of<AuthCubit>(context).loggedIn();
            }
          },
          builder: ((context, state) {
            if (state is CredentialFailure) {
              return const ErrorsWidget();
            }
            if (state is CredentialSuccess) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if (authState is AuthenticatedState) {
                    CacheHelper.saveData(key: 'uId', value: authState.uId)
                        .then((value) {
                      AppStrings.uId = authState.uId;
                      Constants.navigateAndFinish(context, Routes.homeScreen);
                    });
                    return const ErrorsWidget();
                  } else {
                    return _bodyWidget(state);
                  }
                },
              );
            }
            return _bodyWidget(state);
          }),
        ),
      ),
    );
  }

  Widget _bodyWidget(CredentialState state) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.width20, vertical: context.height15),
        child: Column(
          children: [
            const HeaderWidget(title: 'Registration'),
            SizedBox(height: context.height10),
            _profileWidget(context),
            SizedBox(height: context.height10),
            TextFieldContainerWidget(
              textEditingController: _nameController,
              keyboardType: TextInputType.text,
              prefixIcon: Icons.person,
              hintText: 'username',
              borderRadius: context.radius20 / 2,
            ),
            SizedBox(height: context.height10),
            TextFieldContainerWidget(
              textEditingController: _emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
              hintText: 'email',
              borderRadius: context.radius20 / 2,
            ),
            SizedBox(height: context.height10),
            Divider(
              indent: context.height30 * 5,
              endIndent: context.height30 * 5,
              thickness: context.height10 / 5,
            ),
            SizedBox(height: context.height10),
            TextFieldPasswordContainerWidget(
              textEditingController: _passwordController,
              keyboardType: TextInputType.text,
              prefixIcon: Icons.lock,
              hintText: 'password',
            ),
            SizedBox(height: context.height10),
            TextFieldPasswordContainerWidget(
              textEditingController: _passwordAgainController,
              keyboardType: TextInputType.text,
              prefixIcon: Icons.lock,
              hintText: 'password again',
            ),
            SizedBox(height: context.height10),
            TextFieldContainerWidget(
              textEditingController: _dateController,
              keyboardType: TextInputType.datetime,
              prefixIcon: Icons.date_range,
              hintText: 'date',
              borderRadius: context.radius20 / 2,
            ),
            SizedBox(height: context.height10),
            TextFieldContainerWidget(
              textEditingController: _genderController,
              keyboardType: TextInputType.text,
              prefixIcon: Icons.lock,
              hintText: 'gender',
              borderRadius: context.radius20 / 2,
            ),
            SizedBox(height: context.height10),
            Conditional.single(
                context: context,
                conditionBuilder: (context) {
                  return state is! CredentialLoading;
                },
                widgetBuilder: (context) => ContainerButtonWidget(
                      title: 'Register',
                      onTap: () {
                        _submitSignUp();
                      },
                    ),
                fallbackBuilder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    )),
            SizedBox(height: context.height10),
            RowTextWidget(
              mainAxisAlignment: MainAxisAlignment.center,
              title1: 'Do you have already an account?',
              title2: 'Login',
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.loginScreen, (route) => false);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'By clicking register you agree to the ',
                  style: TextStyle(
                      fontSize: context.font26 / 2,
                      fontWeight: FontWeight.w700,
                      color: AppColors.greyColor),
                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                      color: AppColors.greenColor,
                      fontSize: context.font26 / 2),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submitSignUp() {
    if (_nameController.text.isEmpty) {
      return;
    }
    if (_passwordController.text.isEmpty) {
      return;
    }
    if (_passwordAgainController.text.isEmpty) {
      return;
    }
    if (_passwordController.text == _passwordAgainController.text) {
    } else {
      return;
    }
    if (_emailController.text.isEmpty) {
      return;
    }

    if (_dateController.text.isEmpty) {
      return;
    }
    if (_genderController.text.isEmpty) {
      return;
    }
    BlocProvider.of<CredentialCubit>(context).submitSignUp(
        user: UserEntity(
      name: _nameController.text.trim(),
      password: _passwordController.text.trim(),
      email: _emailController.text.trim(),
      phoneNumber: '',
      gender: _genderController.text.trim(),
      date: _dateController.text.trim(),
      profileUrl: '',
      isOnline: false,
      status: '',
    ));
  }

  Column _profileWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.height30 * 2,
          width: context.width30 * 2,
          decoration:
              const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(context.radius30),
              child: Image.asset(ImgAssets.profileImg)),
        ),
        SizedBox(height: context.height10),
        Text(
          'Add profile photo',
          style: TextStyle(color: AppColors.greenColor),
        ),
      ],
    );
  }
}
