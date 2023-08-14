// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
//
//
// class OnBoardingPage extends StatefulWidget {
//   @override
//   _OnBoardingPageState createState() => _OnBoardingPageState();
// }
//
// class _OnBoardingPageState extends State<OnBoardingPage> {
//   final introKey = GlobalKey<IntroductionScreenState>();
//
//   void _onIntroEnd(context) {
//     Navigator
//         .of(context,rootNavigator: true)
//         .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
//
//   }
//
//   Widget _buildFullscreenImage() {
//     return Image.asset(
//       'assets/fullscreen.jpg',
//       fit: BoxFit.cover,
//       height: double.infinity,
//       width: double.infinity,
//       alignment: Alignment.center,
//     );
//   }
//
//   Widget _buildImage(String assetName, [double width = 350]) {
//     return Image.asset('assets/$assetName', width: width);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const bodyStyle = TextStyle(fontSize: 19.0);
//     const pageDecoration = const PageDecoration(
//       titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
//       bodyTextStyle: bodyStyle,
//       bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
//       pageColor: Colors.white,
//       imagePadding: EdgeInsets.zero,
//     );
//
//     return IntroductionScreen(
//       key: introKey,
//       globalBackgroundColor: Colors.white,
//       autoScrollDuration: 3000,
//       globalHeader: Align(
//         alignment: Alignment.topRight,
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(0),
//             child: DropdownButton<Language>(
//               underline: const SizedBox(),
//               icon: const Icon(
//                 Icons.language,
//                 color: Colors.deepOrangeAccent,
//               ),
//               onChanged: (Language? language) async {
//                 if (language != null) {
//                   Locale _locale = await setLocale(language.languageCode);
//                   MyApp.setLocale(context, _locale);
//                 }
//               },
//               items: Language.languageList()
//                   .map<DropdownMenuItem<Language>>(
//                     (e) => DropdownMenuItem<Language>(
//                   value: e,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       Text(
//                         e.flag,
//                         style: const TextStyle(fontSize: 30),
//                       ),
//                       Text(e.name)
//                     ],
//                   ),
//                 ),
//               )
//                   .toList(),
//             ),
//             //_buildImage('logo.png', 100),
//           ),
//         ),
//       ),
//
//       globalFooter: SizedBox(
//         width: double.infinity,
//         height: 60,
//         child: ElevatedButton(
//           child: const Text(
//             'Let\'s go right away!',
//             style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//           ),
//           onPressed: () => _onIntroEnd(context),
//          style: ElevatedButton.styleFrom(
//
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//         ),
//       )),
//       pages: [
//         PageViewModel(
//           title: translation(context).onlineBooking,
//           body:
//           translation(context).onlineBookingTxt,
//           image: _buildImage('salon2.jpg'),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: translation(context).hairstyleMakeup,
//           body:
//           translation(context).hairMakeupTxt,
//           image: _buildImage('salon1.jpeg'),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: translation(context).locationServices,
//           body:
//           translation(context).locationServicesTxt,
//           image: _buildImage('location.jpg'),
//           decoration: pageDecoration,
//         ),
//       ],
//       onDone: () => _onIntroEnd(context),
//       onSkip: () => _onIntroEnd(context), // You can override onSkip callback
//       showSkipButton: false,
//       skipOrBackFlex: 0,
//       nextFlex: 0,
//       showBackButton: true,
//       //rtl: true, // Display as right-to-left
//       back: const Icon(Icons.arrow_back,color: Color(0xFFDB9E82)),
//       skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xFFDB9E82))),
//       next: const Icon(Icons.arrow_forward,color: Color(0xFFDB9E82)),
//       done: const Text('Sign In', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xFFDB9E82))),
//       curve: Curves.fastLinearToSlowEaseIn,
//       controlsMargin: const EdgeInsets.all(16),
//       controlsPadding: kIsWeb
//           ? const EdgeInsets.all(12.0)
//           : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
//       dotsDecorator: const DotsDecorator(
//         size: Size(10.0, 10.0),
//         color: Color(0xFFBDBDBD),
//         activeSize: Size(22.0, 10.0),
//         activeShape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(25.0)),
//         ),
//       ),
//       dotsContainerDecorator: const ShapeDecoration(
//         color: Colors.black87,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8.0),),
//         ),
//       ),
//     );
//   }
// }
