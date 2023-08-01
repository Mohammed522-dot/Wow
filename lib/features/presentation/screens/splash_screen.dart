import 'package:flutter/material.dart';
import 'package:wow/features/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  //route name for our screen
  static String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //we use future to go from one screen to other via duration time
    Future.delayed(Duration(seconds: 5), (){
      //no return when user is on login screen and press back, it will not return the
      //user to the splash screen
      Navigator
          .of(context,rootNavigator: true)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    //scaffold color set to primary color in main in our text theme
    return Scaffold(
      //its a row with a column
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text('WOW', style: Theme.of(context).textTheme.headline5),
            //
            //   ],
            // ),
            Image.asset(
              'assets/images/logo.png',
              //25% of height & 50% of width
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}