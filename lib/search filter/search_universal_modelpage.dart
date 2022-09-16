// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_final_fields, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchUniversalModelPage extends ChangeNotifier {
  final TextEditingController searchText = TextEditingController();
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

  List _searchData = [];
  List get searchData => _searchData;

  searchApihit() async {
    _searchData = [];
    notifyListeners();
    // toggleshemmerShow();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {"filter_search": searchText.text};

    print('searchData peram $rawData');
    var response = await dio.post(baseUrl + endpointUniversalSearch,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());

    print('searchData responce ${response.toString()}');

    // final responseData = json.decode(response.toString());
    print('viewprofile responceData $responseData');

    try {
      if (responseData['status'] == true) {
        toggleshemmerdismis();
        _searchData = responseData['data'];
        notifyListeners();
        print('searchData list $searchData');
      } else {
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

// ------ search product click ------
  clicksearchedproduct(data) {
    print('data $data');
  }
}
