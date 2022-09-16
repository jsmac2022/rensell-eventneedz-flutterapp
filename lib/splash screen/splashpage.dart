
// // ignore_for_file: prefer_const_constructors

// import 'dart:async';
// import 'package:eventneedz/auth%20view/login%20sinup/loginsinguppage.dart';
// import 'package:eventneedz/common/styles/const.dart';
// import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';

// import 'package:shared_preferences/shared_preferences.dart';


// class SplashPage extends StatefulWidget {
//   const SplashPage({Key? key}) : super(key: key);

//   @override
//   _SplashPageState createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
  
//   @override
//   void initState() {
//     super.initState();
//     getValuesSF();
//   }

//   getValuesSF() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var status = prefs.getBool('isLoggedIn') ?? false;

//     Timer(
//       Duration(seconds: 3000),
//       () {
//         // status ? Get.offAll(() => BottomNavBarPage()) : Get.offAll(() => IntroductionPage());
//         status ? Get.offAll(() =>LoginPage()) : Get.offAll(() => LoginPage());
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         width: deviceWidth(context, 1.0),
//         height: deviceheight(context, 1.0),
//         child: Image.asset(
//           'assets/images/bglogin.png',
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }
