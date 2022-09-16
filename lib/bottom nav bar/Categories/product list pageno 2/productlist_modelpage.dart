// ignore_for_file: avoid_print, prefer_final_fields, unnecessary_new, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductListModelPage extends ChangeNotifier {
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

  String _shortradio = "What's New";
  String get shortradio => _shortradio;

// listtile index int smjta h so create this variable

  int _listtileradiogroupvalue = 0;
  int get listtileradiogroupvalue => _listtileradiogroupvalue;

  List<String> _shortradioList = [
    "What's New",
    'Price - low to high',
    'Price - high to low',
    'Recommended',
    'Popular',
    'Discount',
    'Customer Rating'
  ];
  List get shortradioList => _shortradioList;

  resetShortBtn() {
    _shortradio = "What's New";
    _listtileradiogroupvalue = 0;
    _reconmandedtrue = true;
    _popularshowtrue = true;
    notifyListeners();
  }

  toogleradiobtn(value) {
    _shortradio = shortradioList[value];
    _listtileradiogroupvalue = value;
    print(shortradio);
    notifyListeners();
    switch (value) {
      case 0:
        resetShortBtn();
        break;
      case 1:
        sortProductListbyPriceIncrement(false);
        break;

      case 2:
        sortProductListbyPriceIncrement(true);
        break;
      case 3:
        recomandedonlyshow();
        break;
      case 4:
        popularonlyshow();
        break;
      case 5:
        sortProductListbydiscountt();
        break;
      default:
    }
    Get.back();
  }

  var _categiryId;
  get categiryId => _categiryId;

  setCategoryId(id) {
    print('productlist model page ---> categiryId $id ');
    _categiryId = id;
    notifyListeners();
  }

  //----- RECOMMANDED PRODUCT LIST FATCH  ----------

  List _recomandedproductList = [];
  List get recomandedproductList => _recomandedproductList;

  recmndedroductFatch(context) async {
    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {"category_id": categiryId};

    var response = await dio.post(baseUrl + endpointrecProduct,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    // print('categories responceData $responseData');

    try {
      if (responseData['success'] == true) {
        _recomandedproductList = await responseData['data'];
        print('recomanded  list $recomandedproductList');
        notifyListeners();
        toggleshemmerdismis();
      } else {
        _recomandedproductList = [];
        notifyListeners();
        print('recomanded  list $recomandedproductList');
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

//----- POPULAR PRODUCT LIST FATCH  ----------

  List _popularList = [];
  List get popularList => _popularList;

  popularFatch(context) async {
    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {"category_id": categiryId};

    print('categories peram $rawData');

    var response = await dio.post(baseUrl + endpointPolpuarproduct,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print(' popularFatch mahima responceData $responseData');

    try {
      if (responseData['success'] == true) {
        _popularList = await responseData['data'];
        await prefs.setString(
          'selectList',
          responseData['data'][0]['Product']['selectList'],
        );
        print(" SELECTIDS  123  ${prefs.getString("selectList")}");

        print('popular list $popularList');
        notifyListeners();
        toggleshemmerdismis();
      } else {
        _popularList = [];
        notifyListeners();
        print('popular list $popularList');
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

  //-----  PRODUCT LIST FATCH  ------ selected categories

  List _productList = [];
  List get productList => _productList;

  productFatch(context) async {
    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {"category_id": categiryId};

    print('categories peram $rawData');

    var response = await dio.post(baseUrl + endpointProduct,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    // print('categories responceData $responseData');

    try {
      if (responseData['success'] == true) {
        _productList = await responseData['data'];
        // print('product list $productList');
        notifyListeners();
        toggleshemmerdismis();
      } else {
        _productList = [];
        notifyListeners();
        print('product list $productList');
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

  // --- ye alag se repete run kiya h kuki detail page pr bhi  yhi api run ki h to vha ke changes alag rhe isliye
  //-----  PRODUCT LIST FATCH  ------

  List _productListDpage = [];
  List get productListDpage => _productListDpage;

  productFatchforDpage(context, categiryId1) async {
    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {"category_id": categiryId1};

    print('categories peram $rawData');

    var response = await dio.post(baseUrl + endpointProduct,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('categories MAHIMA API RESPONSE responceData $responseData');

    try {
      if (responseData['success'] == true) {
        _productListDpage = await responseData['data'];
        await prefs.setString(
          'selectList',
          responseData['data'][0]['Product']['selectList'],
        );
        print(" SELECTIDS    ${prefs.getString("selectList")}");
        // print('product list $productList');
        notifyListeners();
        toggleshemmerdismis();
      } else {
        _productListDpage = [];
        notifyListeners();
        print('product list $productList');
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

  // ----- SHORT THE PRODUCT LIST WHEN CLICK -----

  // ---- short by--- ------ Price low to high ----
  sortProductListbyPriceIncrement(reverse) {
    _reconmandedtrue = true;
    _popularshowtrue = true;
    notifyListeners();
    if (recomandedproductList.length > 1) {
      _recomandedproductList = recomandedproductList
        ..sort(((a, b) => int.parse(a['Product']['product_amount'])
            .compareTo(int.parse(b['Product']['product_amount']))));
      notifyListeners();
      if (reverse) {
        _recomandedproductList = List.from(recomandedproductList.reversed);
        notifyListeners();
      }
    }
    if (popularList.length > 1) {
      _popularList = popularList
        ..sort(((a, b) => int.parse(a['Product']['product_amount'])
            .compareTo(int.parse(b['Product']['product_amount']))));
      notifyListeners();

      if (reverse) {
        _popularList = List.from(popularList.reversed);
        notifyListeners();
      }
    }
    if (productList.length > 1) {
      _productList = productList
        ..sort(((a, b) => int.parse(a['Product']['product_amount'])
            .compareTo(int.parse(b['Product']['product_amount']))));
      notifyListeners();
      if (reverse) {
        _productList = List.from(productList.reversed);
        notifyListeners();
      }
    }
  }

// short by--- recomonded show only
  bool _reconmandedtrue = true;
  bool get reconmandedtrue => _reconmandedtrue;

  bool _popularshowtrue = true;
  bool get popularshowtrue => _popularshowtrue;

  recomandedonlyshow() {
    _popularshowtrue = false;
    _reconmandedtrue = true;
    notifyListeners();
  }

  popularonlyshow() {
    _reconmandedtrue = false;
    _popularshowtrue = true;
    notifyListeners();
  }

  // short by--- discount
  sortProductListbydiscountt() {
    print(recomandedproductList);
    _reconmandedtrue = true;
    _popularshowtrue = true;
    notifyListeners();
    if (recomandedproductList.length > 1) {
      _recomandedproductList = recomandedproductList
        ..sort(((a, b) => int.parse(a['Product']['product_offcer'])
            .compareTo(int.parse(b['Product']['product_offcer']))));
      notifyListeners();

      _recomandedproductList = List.from(recomandedproductList.reversed);
      notifyListeners();
    }
    if (popularList.length > 1) {
      _popularList = popularList
        ..sort(((a, b) => int.parse(a['Product']['product_offcer'])
            .compareTo(int.parse(b['Product']['product_offcer']))));
      notifyListeners();

      _popularList = List.from(popularList.reversed);
      notifyListeners();
    }
    if (productList.length > 1) {
      _productList = productList
        ..sort(((a, b) => int.parse(a['Product']['product_offcer'])
            .compareTo(int.parse(b['Product']['product_offcer']))));
      notifyListeners();

      _productList = List.from(productList.reversed);
      notifyListeners();
    }
  }
}
