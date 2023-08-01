import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:wow/core/utils/app_strings.dart';
import 'package:wow/features/presentation/blocs/auth/auth_bloc.dart';
import 'package:wow/features/presentation/blocs/auth/auth_state.dart';
import 'package:wow/features/presentation/screens/widgets/height_space.dart';
import 'package:wow/features/presentation/screens/widgets/input_field.dart';
import 'package:wow/features/presentation/screens/widgets/loading_widget.dart';
import 'package:wow/features/presentation/screens/widgets/login_btn.dart';
import 'package:wow/features/presentation/screens/widgets/login_content.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title:  const Text(AppStrings.appName),
    );
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoaded) {
          print("success");
          // Navigator.push(context, MaterialPageRoute(builder: (context) => RootApp()));
        } else if (state is ResponseError) {
          // ResponseErrorLayout();
          print("error");
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const LoadingWidget(child: LoginContent());
        } else {
          return  Scaffold(appBar: appBar, body:  const LoginContent());
        }
      },
    );

  }
}
