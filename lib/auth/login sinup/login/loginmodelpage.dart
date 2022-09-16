// ignore_for_file: avoid_print, prefer_final_fields, unnecessary_new, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_overrides

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/auth/twillio/twillio_modelpage.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:eventneedz/common/styles/apierroralertdiloge.dart';
import 'package:eventneedz/auth/selectcatagery.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModelPage extends ChangeNotifier {
  late TabController tabController;
  int _initialtab = 0;
  int get initialtab => _initialtab;

  final List _tabsName = ['LOGIN', 'SIGNUP'];
  List get tabsName => _tabsName;

  String appbartitle = 'Log In';
  toggelappbartitle(value) {
    if (value == 0) {
      appbartitle = 'Log In';
      notifyListeners();
    } else if (value == 1) {
      appbartitle = 'Sign Up';
      notifyListeners();
    }
  }

  // bool _autovalidateLogin = false;
  // bool get autovalidateLogin => _autovalidateLogin;

  // toggleautovalidate() {
  //   _autovalidateLogin = !_autovalidateLogin;
  //   notifyListeners();
  // }

  bool _obscuretext = true;
  bool get obscuretext => _obscuretext;

  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  toggle() {
    _obscuretext = !_obscuretext;
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

// login api

  // String? _userId;
  // String? get userId => _userId;

  var _firebaseToken;
  get firebaseToken => _firebaseToken;

  signInsubmit(context) async {
    toggleshemmerShow();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await FirebaseMessaging.instance.getToken().then((value) {
      _firebaseToken = value;
      notifyListeners();
    });

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "email": loginEmail.text,
      "password": loginPassword.text,
      "deviceToken": firebaseToken
    };

    print('login peram $rawData');
    var response = await dio.post(baseUrl + loginEndpoint, data: rawData);

    final responseData = json.decode(response.toString());
    print('login responceData $responseData');

    //   toggleshemmerShow();

    try {
      if (responseData['status'] == true) {
        toggleshemmerdismis();

        await prefs.setString(
          'userId',
          responseData['result'][0]['Customer']['id'],
        );
        await prefs.setString(
          'headerToken',
          responseData['token'],
        );
        await prefs.setString(
          'firebaseToken',
          firebaseToken,
        );
        await prefs.setBool("isLoggedIn", true);

        // prefs.setBool("isLoggedIn", true);

        Get.offAll(() => SelectCategry());
        showFlutterToast('Login Successful');
        toggleshemmerdismis();
        loginEmail.clear();
        loginPassword.clear();
        notifyListeners();
      }
      else if (responseData['status'] == "Inactive") {
        toggleshemmerdismis();
        await prefs.setString(
          'userId', responseData['UserId'],
        );
        // _userId = responseData['UserId'];
        notifyListeners();
        // await Provider.of<EnterOtpModelPage>(context, listen: false).setUserId(responseData['UserId']);
        await Provider.of<TwillioModelPage>(context, listen: false)
            .otpsandtwilio('+91', responseData['Mobile'], 'inactivelogin');
        showFlutterToast('Please verifiy otp');

        Future.delayed(Duration(milliseconds: 200));
        await sandOtpInactive(context);
      } else {
        toggleshemmerdismis();
        print('Error: ${responseData["message"]}');

        apiErrorAlertdialog(context, responseData["message"]);
        // apiErrorAlertdialog(context, 'UserName or Password Wrong');
      }
    } catch (e) {
      toggleshemmerdismis();
      print('Error: ${e.toString()}');
    }
  }

  sandOtpInactive(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "userId": prefs.getString('userId'),
      "deviceToken": firebaseToken
    };

    print('otp verify perams $rawData');

    var response = await dio.post(baseUrl + endpointResendOtp, data: rawData);

    final responseData = json.decode(response.toString());
    print('vvvvvkkkk $responseData');

    try {
      if (responseData['status'] == true) {
      } else {
        print(responseData['message']);
      }
    } catch (e) {
      print(e);
    }
  }
}
