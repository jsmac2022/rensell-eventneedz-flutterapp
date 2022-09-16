// ignore_for_file: avoid_print, unnecessary_new, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LiveStrimingModelPage extends ChangeNotifier {
  // ---- PRODUCT VIEWED ADD ------
  productViewedapi(productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('product Id $productId');
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "user_id": prefs.getString('userId'),
      "product_id": productId,
    };

    var response =
        await dio.post(baseUrl + endpointlivestreamingadd, data: rawData);
    // print(' viewPreductreviewlist response $response');
    final responseData = json.decode(response.toString());
    print('productViewedapi responceData $responseData');
  }

  // ---- PRODUCT VIEWED GET ------
  var _productTotalView;
  get productTotalView => _productTotalView;

  livestrimingget(productId) async {
    print('vkkk $productId');

    Dio dio = new Dio();

    var response =
        await dio.get(baseUrl + endpointlivestreamingget + '/' + productId);
    print('livestrimingget response $response');
    final responseData = json.decode(response.toString());
    // print('vanderShopList responceData $responseData');

    try {
      if (responseData['status'] == true) {
        _productTotalView = await responseData['data'];
        print('productTotalView $productTotalView');
        notifyListeners();
      } else {
        notifyListeners();

        print(responseData['message']);
      }
    } catch (e) {
      print('error $e');
    }
  }
}
