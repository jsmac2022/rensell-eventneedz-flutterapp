// ignore_for_file: prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables

import 'package:eventneedz/auth/forgetpassword/enter%20email%201/forgetpasswidgetpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/menu/notification/flutter_local_notification.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'enterotp_modelpage.dart';
import 'enterotp_signupwidgetpage.dart';

class EnterOtpSignupPage extends StatefulWidget {
  const EnterOtpSignupPage({Key? key, this.pagecomming}) : super(key: key);

  final pagecomming;

  @override
  State<EnterOtpSignupPage> createState() => _EnterOtpSignupPageState();
}

class _EnterOtpSignupPageState extends State<EnterOtpSignupPage> {
  @override
  void initState() {
    super.initState();
    // onmessage work when app is open

    FirebaseMessaging.onMessage.listen((message) async {
      if (message.notification != null) {
        print('notification body ${message.notification!.body}');
        print('notification title ${message.notification!.title}');
        print('notification route ${message.data['route']}');
      }
      //popup show
      Future.delayed(Duration(seconds: 1));
      LocalNotificationService.display(message); // isme click oute lga diya h
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Consumer<EnterOtpModelPage>(builder: (context, model, _) {
          return Container(
            width: deviceWidth(context, 1.0),
            height: deviceheight(context, 1.0),
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizedboxheight(deviceheight(context, 0.15)),
                  imagetitlesubtitlewidget(
                      context,
                      'assets/images/picotp.png',
                      'Verification ',
                      "Nice",
                      "We just sent you an SMS with 5-digit code! Looks like you very soon will be logged in!",
                      "Enter this code into field below"),
                  sizedboxheight(20.0),
                  otptypeWidgetsignup(context, model),
                  sizedboxheight(35.0),
                  otpveryfiBtnsignup(context, model, widget.pagecomming),
                  resandotprowforgetSignup(context, model),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
