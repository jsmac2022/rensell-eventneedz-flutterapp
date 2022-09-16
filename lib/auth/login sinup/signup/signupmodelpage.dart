// ignore_for_file: prefer_final_fields, avoid_print, unused_local_variable, unnecessary_new, prefer_const_constructors
import 'dart:convert';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/auth/twillio/twillio_modelpage.dart';
import 'package:eventneedz/common/styles/apierroralertdiloge.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpModelpage extends ChangeNotifier {
  var _firebasetoken = '';
  get firebasetoken => _firebasetoken;

  String _loginType = 'MANUAL';
  String get loginType => _loginType;

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

  bool _checkboxvalue = false;
  bool get checkboxvalue => _checkboxvalue;

  toggleCheckbox() {
    _checkboxvalue = !_checkboxvalue;
    notifyListeners();
    print(checkboxvalue);
  }

  bool _obscuretext = true;
  bool get obscuretext => _obscuretext;

  toggle() {
    _obscuretext = !_obscuretext;
    notifyListeners();
  }

  final GlobalKey<FormState> formKeysignup = GlobalKey<FormState>();
  TextEditingController signupFirstName = TextEditingController();
  TextEditingController signupLastName = TextEditingController();
  TextEditingController signupemail = TextEditingController();
  TextEditingController signupMobile = TextEditingController();
  TextEditingController signupPassword = TextEditingController();

  signupsubmit(context) async {
    toggleshemmerShow();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await FirebaseMessaging.instance.getToken().then((value) {
      _firebasetoken = value!;
      notifyListeners();
    });
    _loginType = 'MANUAL';
    notifyListeners();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "firstName": signupFirstName.text,
      "lastName": signupLastName.text,
      "email": signupemail.text,
      "mobile": signupMobile.text,
      "password": signupPassword.text,
      "deviceToken": firebasetoken,
      "logintype": loginType
    };

    print('firebasetoken $firebasetoken');
    var response = await dio.post(baseUrl + signupEndpoint, data: rawData);

    final responseData = json.decode(response.toString());
    print('signup responseData $responseData');

    try {
      if (responseData['status'] == true) {
        await prefs.setString(
          'userId',
          responseData['data']['id'],
        );
        await Provider.of<TwillioModelPage>(context, listen: false)
            .otpsandtwilio('+91', signupMobile.text, 'signup');

        notifyListeners();
        toggleshemmerdismis();
        signupFirstName.clear();
        signupFirstName.clear();
        signupLastName.clear();
        signupemail.clear();
        signupMobile.clear();
        signupPassword.clear();
        notifyListeners();
      } else {
        toggleshemmerdismis();

        apiErrorAlertdialog(context, responseData["message"]);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('Error: ${e.toString()}');
    }
  }
}
