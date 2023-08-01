import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wow/core/utils/app_strings.dart';
import 'package:wow/features/presentation/screens/login_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/LoginScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {

          return const LoginScreen();
        });
      //
      // case Routes.randomQuoteRoute:
      // return MaterialPageRoute(builder: ((context) {
      //
      //    //   BlocProvider(
      //    //   create: ((context) => di.sl<RandomQuoteCubit>()),
      //    //   child: const QuoteScreen(),
      //    // );
      // }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        )));
  }
}