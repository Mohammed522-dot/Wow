import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:wow/features/presentation/screens/widgets/height_space.dart';
import 'package:wow/features/presentation/screens/widgets/input_field.dart';
import 'package:wow/features/presentation/screens/widgets/login_btn.dart';
class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  late FocusNode userPhoneFocus;
  late FocusNode passwordFocus;
  late FocusNode loginBtnFocus;
  late TextEditingController userPhone;
  late TextEditingController password;
  @override
  void initState() {
    super.initState();
    userPhoneFocus = FocusNode();
    passwordFocus = FocusNode();
    loginBtnFocus = FocusNode();
    userPhone = TextEditingController();
    password = TextEditingController();
  }
  @override
  void dispose() {
    userPhoneFocus.dispose();
    passwordFocus.dispose();
    loginBtnFocus.dispose();
    userPhone.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          // ImageBuilder(imagePath: loginImages[0]),
          // const TextData(message: "User"),
          const HeightSpacer(myHeight: 20.0),
          Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: IntlPhoneField(
                decoration: const InputDecoration( //decoration for Input Field
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'AE', //default contry code, NP for UAE
                onChanged: (phone) {
                  userPhone.text = phone.completeNumber.toString();
                },
              )
          ),
          const HeightSpacer(myHeight: 15.0),
          InputField(
            focusNode: passwordFocus,
            textController: password,
            label: "Password",
            icons: const Icon(Icons.lock, color: Color(0xFFDB9E82)),

          ),
          const HeightSpacer(myHeight: 15.0),
          LoginBtn(
            focusNode: loginBtnFocus,
            userName: userPhone,
            password: password,
          ),
          const SizedBox(height: 50),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don’t have an account? ",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const RegisterScreen()));
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
