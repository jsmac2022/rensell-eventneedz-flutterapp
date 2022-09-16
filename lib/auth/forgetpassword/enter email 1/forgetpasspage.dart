
// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_constructors_in_immutables, avoid_print

import 'package:eventneedz/bottom%20nav%20bar/menu/notification/flutter_local_notification.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'forgetpassmodelpage.dart';
import 'forgetpasswidgetpage.dart';

class ForgetPassPage extends StatefulWidget {
  ForgetPassPage({Key? key}) : super(key: key);
  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
 final formKey1 = GlobalKey<FormState>();
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
      child: Scaffold(appBar: appbartitlebackbtn(context, 'Forgot Password'),
      body: Consumer<ForgetPassModelPage>(
        builder: (context,model,_) {
          return Container(
            width: deviceWidth(context, 1.0),
            height: deviceheight(context, 1.0),
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: SingleChildScrollView(
                 keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Form(
                key:formKey1 ,
                // autovalidate: model.autovalidate,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      sizedboxheight(12.0),
                imagetitlesubtitlewidget(context,'assets/images/fpass.png', 'Forgot Password?',"Don't worry!","Just enter the email address or enter your mobile  number associated with your account.", "We'll send you an email or verification code to reset your password") ,
                  sizedboxheight(40.0),
                fpassemail(model),
                      sizedboxheight(20.0),
                     fpassBtn(context,model,formKey1),
                ],),
              ),
            ),
          );
        }
      ),
      ),
    );
  }
}