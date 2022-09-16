// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/auth/login%20sinup/loginsinguppage.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbar.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hexcolor/hexcolor.dart';

class FirstSceen extends StatelessWidget {
  const FirstSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: deviceWidth(context, 1.0),
            height: deviceheight(context, 1.0),
            child: Image.asset(
              'assets/images/mountains-1.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: deviceWidth(context, 1.0),
            height: deviceheight(context, 1.0),
            color: HexColor("#C91F42").withOpacity(0.5),
          ),
          SizedBox(
            width: deviceWidth(context, 1.0),
            height: deviceheight(context, 1.0),
            child: Column(
              children: [
                sizedboxheight(deviceheight(context, 0.25)),
                Image.asset(
                  'assets/icons/LOGO-white 1.png',
                  scale: 1.2,
                ),
                sizedboxheight(deviceheight(context, 0.35)),
                signupBtn(context),
                sizedboxheight(12.0),
                loginBtn(context),
                sizedboxheight(12.0),
                guestBtn(context),
                sizedboxheight(20.0),
                RichText(
                  text: TextSpan(
                    text: 'Know more About\t\t',
                    children: <TextSpan>[
                      TextSpan(
                          text: 'EventNeedz',
                          style: TextStyle(color: colorpinklight)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget signupBtn(context) {
    return Button(
      btnWidth: deviceWidth(context, 0.45),
      btnColor: Colors.transparent,
      textColor: colorWhite,
      borderColor: colorWhite,
      btnHeight: 30,
      btnfontsize: 14,
      buttonName: 'Sign Up',
      key: Key('Sign Up'),
      onPressed: () {
        Get.to(() => LoginPageSignupPage(initialtab: 1,));
      },
    );
  }

  Widget loginBtn(context) {
    return Button(
      btnWidth: deviceWidth(context, 0.45),
      btnHeight: 30,
      buttonName: 'Login',
      key: Key('Login'),
      btnfontsize: 14,
      btnColor: colorWhite,
      textColor: colorpinklight,
      onPressed: () {
        Get.to(() => LoginPageSignupPage(initialtab: 0,));
      },
    );
  }

  Widget guestBtn(context) {
    return Button(
      btnWidth: deviceWidth(context, 0.45),
      btnColor: colorWhite,
      textColor: colorpinklight,
      btnHeight: 30,
      btnfontsize: 14,
      buttonName: 'Guest',
      key: Key('Guest'),
      onPressed: () {
        Get.to(() => BottomNavBarPage());
      },
    );
  }
}
