import 'package:chat_group/features/chat/presentation/cubit/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chat_group/config/routes/app_routes.dart';
import 'package:chat_group/config/themes/app_theme.dart';
import 'package:chat_group/core/cache/cache_helper.dart';
import 'package:chat_group/core/utils/app_strings.dart';
import 'package:chat_group/features/chat/presentation/cubit/auth/auth_cubit.dart';
import 'package:chat_group/features/chat/presentation/cubit/credential/credential_cubit.dart';

import 'firebase_options.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  await di.init();
  String? initialRoute;
  AppStrings.uId = CacheHelper.getData(key: 'uId');
  if (AppStrings.uId != null) {
    initialRoute = Routes.homeScreen;
  } else {
    initialRoute = Routes.loginScreen;
  }
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.initialRoute}) : super(key: key);
  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (_) => di.sl<AuthCubit>()..appStarted()),
        BlocProvider<CredentialCubit>(create: (_) => di.sl<CredentialCubit>()),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        initialRoute: initialRoute,
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
