// ignore_for_file: avoid_print, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/auth/selectcatagery.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleSignupModelPage extends GetxController {
  // bool _isShimmer = false;
  // bool get isShimmer => _isShimmer;

  // toggleshemmerShow() {
  //   _isShimmer = true;
  //   notifyListeners();
  // }

  // toggleshemmerdismis() {
  //   _isShimmer = false;
  //   notifyListeners();
  // }

  signupsubmit(email1, mobile1, username1) async {
   
    var username1split = username1.split(' ');
    print('split $username1split');
  
    // toggleshemmerShow();
    var firebaseToken;
    await FirebaseMessaging.instance.getToken().then((value) {
      firebaseToken = value!;
    });

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "firstName":username1split.length<3? username1split[0]:'${username1split[0]}${username1split[1]}',
    "lastName": username1split[username1split.length-1],
      "email": email1,
      "mobile": mobile1 ?? '',
      "createdBy": "USER",
   
      "logintype": "GOOGLE",
         "deviceToken":firebaseToken
     
    };

    print('google signup api perm $rawData');
    var response = await dio.post(baseUrl + signupSocialEndpoint, data: rawData);

    final responseData = json.decode(response.toString());
    print('signup social responseData $responseData');

    try {
      if (responseData['status'] == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString(
          'userId',
       
            responseData['data']['id'],
        
        );
        await prefs.setString(
          'firebaseToken',
          firebaseToken,
        );
        prefs.setBool("isLoggedIn", true);
        Get.offAll(() => SelectCategry());
        // toggleshemmerdismis();

      } else if (responseData['message'] == "Email already exist try to new one") {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString(
          'userId',
          responseData['data'][0]['Customer']['id'],
        );
        await prefs.setString(
          'firebaseToken',
          firebaseToken,
        );
        prefs.setBool("isLoggedIn", true);
        Get.offAll(() => SelectCategry());
        // toggleshemmerdismis();

        // apiErrorAlertdialog(context, responseData["message"]);
      }
    } catch (e) {
      // toggleshemmerdismis();
      print('Error: ${e.toString()}');
    }
  }
}
