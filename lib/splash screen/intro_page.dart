// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';
import 'package:eventneedz/common/bottomnavbar/bottomnavbar.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firstscreen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => FirstSceen()),
    );
  }

  @override
  void initState() {
    super.initState();
    getValuesSF();
  }

  getValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status =  prefs.getBool('isLoggedIn') ?? false;
    print('login auto status $status userid ${prefs.getString('userId')}');
    if (status) {
      Timer(
        Duration(milliseconds: 200),
        () {
          Get.offAll(() =>BottomNavBarPage());
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    );

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      bodyAlignment: Alignment.center,
    );

    return Stack(
      children: [
        SizedBox(
          width: deviceWidth(context, 1.0),
          height: deviceheight(context, 1.0),
          child: Image.asset(
            'assets/images/bglogin.png',
            fit: BoxFit.cover,
          ),
        ),
        IntroductionScreen(
          nextColor: Colors.black87,
          doneColor: Colors.black87,
          key: introKey,
          globalBackgroundColor: Colors.transparent,
          globalHeader: Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
              ),
            ),
          ),

          pages: [
            PageViewModel(
              title: "",
              body: "Vendor list",
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "",
              body: "Analyse the Skillset by watching the vendor video",
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "",
              body: 'Select the suitable vendor',
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "",
              body: 'Chat for the event',
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "",
              body: "Engage the services",
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          //rtl: true, // Display as right-to-left
          skip: const Text('Skip'),
          next: const Text('next'),
          done: Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          // globalFooter: Container(
          //   width: deviceWidth(context, 0.9),
          //   height: 40,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       TextButton(
          //         onPressed: () {
          //           _onIntroEnd(context);
          //         },
          //         child: Text('Skip',
          //             style: TextStyle(fontWeight: FontWeight.w600)),
          //       )
          //     ],
          //   ),
          // ),

          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb ? const EdgeInsets.all(12.0) : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        )
      ],
    );
  }
}
