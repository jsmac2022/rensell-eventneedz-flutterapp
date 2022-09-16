// ignore_for_file: unused_field, avoid_print, unnecessary_new, prefer_final_fields, prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:convert';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemFullDetailModelPage extends ChangeNotifier {
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

  CarouselController buttonCarouselController = CarouselController();

  int _activeindex = 0;
  int get activeindex => _activeindex;

  valueset(index) {
    _activeindex = index;
    notifyListeners();
  }

  Map _selectedItemData = {};
  Map get selectedItemData => _selectedItemData;

  setSelectedItemData(value) async {
    _selectedItemData = {};
    _selectedItemData = await value;
    notifyListeners();

    debugPrint('item full detail $selectedItemData');
  }

  List _recomandedproductList = [];
  List get recomandedproductList => _recomandedproductList;
  setRecommandedList(value) async {
    _recomandedproductList = [];
    _recomandedproductList = await value;
    notifyListeners();

    debugPrint('item full detail $selectedItemData');
  }

// --- VIEW SHOP BUTTON---
// SELECTED VANDER SHOP SHOW --- ALL PRODUCT SHOW ONE VANDER
  List _vanderShopList = [];
  List get vanderShopList => _vanderShopList;

  selectVanderProductList(vanderId) async {
    print('vkkk $vanderId');

    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    // print(' Image List peram $rawData');

    var response = await dio.get(
      baseUrl + endpointvendorproductlist + '/' + vanderId.toString(),
      options: Options(
        headers: {"authorization": prefs.getString('headerToken')},
      ),
    );
    print(' vanderShopList response $response');
    final responseData = json.decode(response.toString());
    // print('vanderShopList responceData $responseData');

    try {
      if (responseData['status'] == true) {
        _vanderShopList = responseData['data'];
        notifyListeners();
        // print('vanderShop list $vanderShopList');

        toggleshemmerdismis();
      } else {
        _vanderShopList = [];
        notifyListeners();

        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

  // ---- RECENT VIEW 15 ITEM STORE MAXIMUM LAST ITEM REMOVE ------
  List _recentviewproductList = [];
  List get recentviewproductList => _recentviewproductList;

  resetREcentView() {
    _recentviewproductList = [];
    notifyListeners();
    print(recentviewproductList);
  }

  recentviewdatastore() {
    print('dispose run');
    print('recentviewproductList.lenth ${recentviewproductList.length}');
    if (recentviewproductList.length < 16) {
      if (!checkexistproduct(recentviewproductList, selectedItemData)) {
        _recentviewproductList.add(selectedItemData);
      }
    } else {
      recentviewproductList.removeAt(0);
    }
    print('recent view $recentviewproductList');
    print('recentviewproductList.lenth ${recentviewproductList.length}');
  }

// --- cheack this item not in already in recent view ----
  bool checkexistproduct(list, product) {
    bool exist = false;
    for (var i = 0; i < list.length; i++) {
      if (list[i]['id'] == product['id']) {
        exist = true;
        notifyListeners();
      }
    }
    return exist;
  }
}
