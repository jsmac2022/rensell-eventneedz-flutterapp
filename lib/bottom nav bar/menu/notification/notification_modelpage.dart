// ignore_for_file: unnecessary_new, avoid_print, prefer_final_fields, prefer_const_constructors

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationModelPage extends ChangeNotifier {
  bool _isShimmer = false;
  bool get isShimmer => _isShimmer;

  toggleshemmerShow() {
    _isShimmer = true;
    notifyListeners();
  }

  toggleshemmerdismis() {
    _isShimmer = false;
    notifyListeners();
  }

  // FATCH NOTIFICATION

  List _notificationAllList = [];
  List get notificationAllList => _notificationAllList;

  notificationFatch(context) async {
    _notificationAllList = [];
    _newNotification = [];
    _oldNotification = [];
    notifyListeners();
    toggleshemmerShow();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "user_id": prefs.getString('userId'),
      // "user_id": "4040809c-a7b5-409d-96b8-dda5a309465e",
      "Type": "ALL"
    };

    print(' notification peram $rawData');

    var response = await dio.post(baseUrl + endpointNOTIFICATION,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('notification responceData $responseData');

    try {
      if (responseData['status'] == true) {
        _notificationAllList = responseData['data'];
        getNewNotification();
        toggleshemmerdismis();
        notifyListeners();
      } else {
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

// FILTER OLD NOTIFICATION

  List _newNotification = [];
  List get newNotification => _newNotification;

  List _oldNotification = [];
  List get oldNotification => _oldNotification;

  getNewNotification() {
    _oldNotification = [];
    _newNotification = [];
  
    print('all notification ${notificationAllList.length}');
    for (var i = 0; i < notificationAllList.length; i++) {
      var notifdatetime = DateTime.parse(notificationAllList[i]["Notification"]["creationDate"]);


      var newnotiBool = DateTime.now().subtract(Duration(days: 1)).isBefore(notifdatetime);
     
      if (newnotiBool) {
        _newNotification.add(notificationAllList[i]);
        notifyListeners();
      } else {
        _oldNotification.add(notificationAllList[i]);
        notifyListeners();
      }
    }
    print('new notification ${newNotification.length}');
    print('old notification ${oldNotification.length}');
  }
}
