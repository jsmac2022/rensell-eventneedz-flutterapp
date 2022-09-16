// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables

import 'package:eventneedz/bottom%20nav%20bar/menu/notification/flutter_local_notification.dart';
import 'package:eventneedz/common/commonwidgets/commonwidgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottomnavbar_modelpage.dart';
import 'bottomnavbarwidget.dart';

class BottomNavBarPage extends StatefulWidget {
  BottomNavBarPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  @override
  void initState() {
    super.initState();

//when app terminate and user tap notification then instance open the app
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeCome = message.data['route'];
        print('vkkkkkkkkkk terminateapp router come $routeCome');
        Navigator.of(context).pushNamed(routeCome);
      }
    });

    // onmessage work when app is open
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
        print(message.data['route']);
      }
      //popup show
      LocalNotificationService.display(message); // isme click oute lga diya h
    });

    // when the app is in backgrodund but opened and user tap on notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeCome = message.data['route'];
      print('vkkkkkkkkkk notification router come $routeCome');
      Navigator.of(context).pushNamed(routeCome);
    });
  }

  Future<bool> backdb(model) async {
    if (model.bottombarzindex != 0) {
      model.togglebottomindexreset();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomnavbarModelPage>(builder: (context, model, _) {
      return WillPopScope(
        onWillPop: () {
          return model.bottombarzindex == 0
              ? onWillPop(context)
              : backdb(model);
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: model.bottombarScreens[model.bottombarzindex],
            bottomNavigationBar: bottomNavBarPagewidget(context, model),
          ),
        ),
      );
    });
  }
}
