// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_new

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterOtpModelPage extends ChangeNotifier {
  OtpTimerButtonController controller = OtpTimerButtonController();

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

  // -- ye function change kr diya h ye user login ke status ko active krega
  otpVerifiy(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // toggleshemmerShow();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {"userId": prefs.getString('userId')};

    print('otp verify perams $rawData');

    var response = await dio.post(baseUrl + verifyOtpEndpoint, data: rawData);

    final responseData = json.decode(response.toString());
    print('vvvvvkkkk $responseData');

    try {
      if (responseData['status'] == true) {
        toggleshemmerdismis();

        notifyListeners();
      } else {
        toggleshemmerdismis();
        // apiErrorAlertdialog(context, 'Wrong otp');
      }
    } catch (e) {
      toggleshemmerdismis();
      print(e);
    }
  }
}
