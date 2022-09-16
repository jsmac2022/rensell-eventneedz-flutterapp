// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/route_manager.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    _notificationsPlugin.initialize(initializationSettings, onSelectNotification: (String? route) async {
      if (route != null) {
        Get.toNamed(route);
      }
    });
  }

//create channnel which show popup when app open and in backgroung
  static void display(RemoteMessage message) async {
    try {
      //unque id genrate
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails('eventneedz', 'eventneedz notification channel',
              importance: Importance.high,
              priority: Priority.high)); // chanal id vahi de jo andrid mainfest file m typ ekiya h

      await _notificationsPlugin.show(id, message.notification!.title, message.notification!.body, notificationDetails,
      payload: message.data['route']
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
