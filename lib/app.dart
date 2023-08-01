import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wow/config/routes/app_routes.dart';
import 'package:wow/config/theme/app_theme.dart';
import 'package:wow/core/utils/app_strings.dart';
import 'package:wow/features/presentation/blocs/auth/auth_bloc.dart';
import 'package:wow/features/presentation/screens/login_screen.dart';
import 'package:wow/features/presentation/screens/splash_screen.dart';

class WowApp extends StatelessWidget {
  const WowApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MultiBlocProvider(
        providers: [
        BlocProvider(create: (_)=> AuthBloc()),
    ],
    child: MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      home:  SplashScreen(),
    ),
      );
  }
}