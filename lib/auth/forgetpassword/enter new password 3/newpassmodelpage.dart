// ignore_for_file: avoid_print, unnecessary_new, prefer_const_constructors

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/auth/forgetpassword/reset%20pass%20complete%204/resetpcomppage.dart';
import 'package:eventneedz/common/styles/apierroralertdiloge.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewPassModelPage extends ChangeNotifier {
  bool _obscuretext1 = true;
  bool get obscuretext1 => _obscuretext1;

  bool _obscuretext2 = true;
  bool get obscuretext2 => _obscuretext2;


  TextEditingController newPassword = TextEditingController();
  TextEditingController cnfPassword = TextEditingController();

  bool _autovalidate = false;
  bool get autovalidate => _autovalidate;

  toggleautovalidate() {
    _autovalidate = !_autovalidate;
    notifyListeners();
  }

  toggle1() {
    _obscuretext1 = !_obscuretext1;
    notifyListeners();
  }

  toggle2() {
    _obscuretext2 = !_obscuretext2;
    notifyListeners();
  }

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
  userid() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
  print('userid -----> ${prefs.getString('userId')}');
    notifyListeners();
  }

  changepasswordsubmit(context) async {
    toggleshemmerShow();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    //Map<String, dynamic> rawData = {"user_id": "f947ef4a-1ab7-49e8-bda5-229de4774a5b", "new_password": "tesst"};
    Map<String, dynamic> rawData = {
      "user_id": prefs.getString('userId'),
       "new_password": newPassword.text
       };

    print('otp verify perams $rawData');

    var response = await dio.post(baseUrl + endpointpasswordReset, data: rawData);
    print('vvvvvkkkk $response');
    final responseData = json.decode(response.toString());
    print('vvvvvkkkk $responseData');

    try {
      if (responseData['status'] == true) {
        toggleshemmerdismis();
 Get.to(() => ResetPCompPage());

        newPassword.clear();
        cnfPassword.clear();
      } else {
        toggleshemmerdismis();
        apiErrorAlertdialog(context, 'Wrong otp');
      }
    } catch (e) {
      toggleshemmerdismis();
      print(e);
    }
  }
}
