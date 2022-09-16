// ignore_for_file: unnecessary_new, avoid_print, prefer_const_constructors, prefer_final_fields

import 'dart:convert';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/auth/login%20sinup/social%20login/logoutcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class MyProfileModelPage extends ChangeNotifier {
  bool _userIdExist = true;
  bool get userIdExist => _userIdExist;

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

  List _profileviewList = [];
  List get profileviewList => _profileviewList;

  profileViewFatch(context) async {
    toggleshemmerShow();
    Future.delayed(Duration(milliseconds: 700));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "userId": prefs.getString('userId')
      // "userId":"7b2bf97e-88c0-440c-82cc-96a50fd98a95"
    };

    print('profileview peram $rawData');

    var response = await dio.post(baseUrl + endpointviewProfile,
        // options: Options(
        //   headers: {"authorization": prefs.getString('headerToken')},
        // ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('profileview responceData $responseData');

    try {
      if (responseData['status'] == true) {
        toggleshemmerdismis();
        _profileviewList = responseData['data'];
        notifyListeners();
        print('profileview list $profileviewList');
      } else {
        if (responseData['message'] == 'No data found') {
          // means user id dose not exist to logout ho jaye
          Get.put(Logoutcontroller().logout());

          notifyListeners();
        }
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }
}
