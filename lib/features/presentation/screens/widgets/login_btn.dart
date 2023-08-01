import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wow/core/utils/app_strings.dart';
import 'package:wow/features/presentation/blocs/auth/auth_bloc.dart';
import 'package:wow/features/presentation/blocs/auth/auth_event.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn(
      {Key? key,
        required this.focusNode,
        required this.userName,
        required this.password})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController userName;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    EdgeInsets kHPadding = const EdgeInsets.symmetric(horizontal: 20.00);
    return Padding(
      padding: kHPadding,
      child:
      OutlinedButton(
        focusNode: focusNode,
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color:  Color(0xFFDB9E82), width: 1),
            minimumSize: const Size(double.infinity, 54),
            backgroundColor:  Color(0xFFDB9E82)),
        onPressed: () {
          BlocProvider.of<AuthBloc>(context)
              .add(Login(userName.text, password.text));
        },
        child: const Text(
          AppStrings.login,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    );
  }
}