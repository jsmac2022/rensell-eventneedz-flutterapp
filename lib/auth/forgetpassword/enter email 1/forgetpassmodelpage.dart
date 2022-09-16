// ignore_for_file: prefer_final_fields, avoid_print, unnecessary_new, prefer_const_constructors

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/auth/twillio/twillio_modelpage.dart';
import 'package:eventneedz/common/styles/apierroralertdiloge.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPassModelPage extends ChangeNotifier {
  final TextEditingController fpassemail = TextEditingController();

  var _firebasetoken = '';
  get firebasetoken => _firebasetoken;

  sandOtpfpass(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future.delayed(Duration(milliseconds: 300));

    await FirebaseMessaging.instance.getToken().then((value) {
      _firebasetoken = value!;
      notifyListeners();
    });
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "mobile": fpassemail.text,
      "deviceToken": firebasetoken
    };
    // print('forget pass peram  $rawData');
    var response = await dio.post(baseUrl + forgetpassEndpoint, data: rawData);

    final responseData = json.decode(response.toString());
    print('forget pass responseData  $responseData');

    try {
      if (responseData['success'] == true) {
        await prefs.remove('userId');
        await prefs.setString(
          'userId',
          responseData['data'][0]['Customer']['id'],
        );
        print('userid ----> ${prefs.getString('userId')}');
        await Provider.of<TwillioModelPage>(context, listen: false)
            .otpsandtwilio('+91', responseData['data'][0]['Customer']['mobile'],
                'forgetpassword');

        notifyListeners();
        fpassemail.clear();
        notifyListeners();
      } else {
        apiErrorAlertdialog(context, 'Email Does Not Exist');
      }
    } catch (e) {
      print(e);
    }
  }
}
