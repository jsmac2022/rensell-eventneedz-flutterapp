// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print

import 'package:eventneedz/bottom%20nav%20bar/menu/notification/flutter_local_notification.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/commonwidgets/commonwidgets.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login/loginmodelpage.dart';
import 'loginsingup_tabwidgetpage.dart';

class LoginPageSignupPage extends StatefulWidget {
  const LoginPageSignupPage({Key? key, this.initialtab}) : super(key: key);

  final initialtab;

  @override
  State<LoginPageSignupPage> createState() => _LoginPageSignupPageState();
}

class _LoginPageSignupPageState extends State<LoginPageSignupPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> formkeyLogin = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp)async {
    final loginmodel = Provider.of<LoginModelPage>(context, listen: false);

    loginmodel.tabController = TabController(
        vsync: this, length: 2, initialIndex: widget.initialtab ?? 0);
    // });

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

// ye error de rha h
//   @override
//   void dispose() {
//     super.dispose();
//     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
//       loginmodel.tabController.dispose();
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Consumer<LoginModelPage>(builder: (context, model, _) {
        return Scaffold(
          appBar: appbartitlebackbtn(context, model.appbartitle),
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: padding20, vertical: 10),
              width: deviceWidth(context, 1.0),
              height: deviceheight(context, 1.0),
              decoration: BoxDecoration(
                image: bgImage(),
              ),
              child: Column(
                children: [
                  sizedboxheight(15.0),
                  iconheadingperatWidget(
                      context,
                      model.appbartitle == 'Sign Up'
                          ? 'Sign Up '
                          : 'Welcome Back!',
                      model.appbartitle == 'Sign Up'
                          ? 'Explore the Convenience!'
                          : 'Login into your account'),
                  sizedboxheight(30.0),
                  Expanded(
                      child: tabbarloginsignup(context, model, formkeyLogin))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
