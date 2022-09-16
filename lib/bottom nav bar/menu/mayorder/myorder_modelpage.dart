// ignore_for_file: prefer_final_fields, avoid_print, unnecessary_new

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyOrderModelPage extends ChangeNotifier {
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

  String _oredertimeradio = 'Last 30 Days';
  String get oredertimeradio => _oredertimeradio;

  List<String> _oredertimeradioList = [
    'Last 30 Days',
    'Last 3 Months',
    'Last 6 Months',
    '2021',
    '2022',
    '2023'
  ];
  List get oredertimeradioList => _oredertimeradioList;

  toogleradiobtn(value) {
    _oredertimeradio = value;
    print(oredertimeradio);
    notifyListeners();
  }

  //order item list
  List _orderitemList = [];
  List get orderitemList => _orderitemList;

  List _orderFalseList = [];
  List get orderFalseList => _orderFalseList;

  orderListFatch(context, status) async {
    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "userId": prefs.getString('userId'),
      "status": status
    };
    print('order history perm $rawData');
    var response = await dio.post(baseUrl + endpointorderHistory,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    var responseData = json.decode(response.toString());
    print('order list responceData $responseData');

    try {
      if (responseData['success'] == true) {
        _orderitemList = await responseData['data'];
        print('order list show $orderitemList');
        notifyListeners();
        toggleshemmerdismis();
      } else {
        _orderFalseList = await responseData['data'];
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
