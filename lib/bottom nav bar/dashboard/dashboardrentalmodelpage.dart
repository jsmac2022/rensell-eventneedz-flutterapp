// ignore_for_file: unnecessary_new, avoid_print, prefer_final_fields, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/auth/selectcatagery.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardModelPage extends ChangeNotifier {
  String? _apptype;
  String? get apptype => _apptype;

  findapptypesave(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _apptype = prefs.getString('apptypeChose');
    notifyListeners();
    print(
        'db app type category type $apptype and userId ${prefs.getString('userId')}');
    if (apptype == null) {
      Get.offAll(() => SelectCategry());
    }
    await categouriesFatch(context);
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

  // fatch  category

  List _categoriesList = [];
  List get categoriesList => _categoriesList;

  categouriesFatch(context) async {
    _categoriesList = [];
    notifyListeners();
    toggleshemmerShow();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {"apptype": prefs.getString('apptypeChose')};

    print(' db categories peram $rawData');

    var response = await dio.post(baseUrl + categoryEndpoint,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('db categories responceData $responseData');

    try {
      if (responseData['success'] == true) {
        _categoriesList = responseData['data'];
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

  // banner image

  List _banerImageList = [];
  List get banerImageList => _banerImageList;

  bannerImagefatch(context) async {
    toggleshemmerShow();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {"type": "banner_Image"};

    var response = await dio.post(baseUrl + endpointappdemo,
        // options: Options(
        //   headers: {"authorization": prefs.getString('headerToken')},
        // ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('bannerImagefatch responceData $responseData');

    try {
      if (responseData['status'] == true) {
        _banerImageList = await responseData['data'];

        notifyListeners();
        print('banerImage list ${banerImageList.length}');
        toggleshemmerdismis();
      } else {
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

  // ----- DEVICE TOKEN UPDATE EVERY TIME ON DASHBOARD -----

  devicetokenUpdate(context) async {
    var firebaseToken;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await FirebaseMessaging.instance.getToken().then((value) {
      firebaseToken = value;
      notifyListeners();
    });

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "user_id": prefs.getString('userId'),
      "deviceid": firebaseToken
    };

    var response =
        await dio.post(baseUrl + endpointdevicetokenupdate, data: rawData);

    final responseData = json.decode(response.toString());
    print('device token updated responceData $responseData');
  }

  // ---- Reward earn api ------
  var _amountReward = 0;
  get amountReward => _amountReward;

  amountRewardapi(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    toggleshemmerShow();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {"user_id": prefs.getString('userId')};
    print('reward peram $rawData');

    var response = await dio.post(baseUrl + endpointgetreward,
        // options: Options(
        //   headers: {"authorization": prefs.getString('headerToken')},
        // ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('amountRewardapi responceData $responseData');

    try {
      if (responseData['status'] == true) {
        _amountReward = await responseData['data'][0]['Rewards']['amount'];
        notifyListeners();
        print('amountReward $amountReward');
        toggleshemmerdismis();
      } else {
        _amountReward = 0;
        print('amountReward $amountReward');
        notifyListeners();
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }
}
