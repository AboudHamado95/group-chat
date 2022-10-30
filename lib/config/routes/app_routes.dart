import 'package:chat_group/core/utils/app_strings.dart';
import 'package:chat_group/features/chat/presentation/screens/create_new_group_screen.dart';
import 'package:chat_group/features/chat/presentation/screens/auth/forgot_password_screen.dart';
import 'package:chat_group/features/chat/presentation/screens/home_screen.dart';
import 'package:chat_group/features/chat/presentation/screens/auth/login_screen.dart';
import 'package:chat_group/features/chat/presentation/screens/auth/register_screen.dart';
import 'package:chat_group/features/chat/presentation/screens/single_chat_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = '/';
  static const String homeScreen = '/home_screen';
  static const String loginScreen = '/login_screen';
  static const String registerScreen = '/register_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String createNewGroupScreen = '/create_new_group_screen';
  static const String singleChatScreen = '/single_chat_screen';
}

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return materialBuilder(widget: const LoginScreen());
      case Routes.loginScreen:
        return materialBuilder(widget: const LoginScreen());
      case Routes.registerScreen:
        return materialBuilder(widget: const RegisterScreen());
      case Routes.forgotPasswordScreen:
        return materialBuilder(widget: const ForgotPasswordScreen());
      case Routes.homeScreen:
        return materialBuilder(widget: HomeScreen(uId: AppStrings.uId));
      case Routes.createNewGroupScreen:
        return materialBuilder(widget: const CreateNewGroupScreen());
      case Routes.singleChatScreen:
        return materialBuilder(widget: const SingleChatScreen());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text(AppStrings.appName)),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
