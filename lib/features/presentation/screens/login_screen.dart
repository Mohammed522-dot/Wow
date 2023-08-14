import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wow/core/utils/app_strings.dart';
import 'package:wow/core/utils/constants.dart';
import 'package:wow/features/presentation/blocs/auth/auth_bloc.dart';
import 'package:wow/features/presentation/blocs/auth/auth_state.dart';
import 'package:wow/features/presentation/screens/map_screen.dart';
import 'package:wow/features/presentation/screens/root_app.dart';
import 'package:wow/features/presentation/screens/widgets/loading_widget.dart';
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MapScreen()));
        } else if (state is ResponseError) {
          Constants.showErrorDialog(context: context, msg: "Invalid Data");
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Scaffold(appBar: appBar, body:  const LoadingWidget(child: LoginContent()));
        } else {
          return  Scaffold(appBar: appBar, body:  const LoginContent());
        }
      },
    );
  }
}
