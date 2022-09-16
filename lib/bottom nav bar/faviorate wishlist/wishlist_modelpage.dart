// ignore_for_file: prefer_final_fields, avoid_print, unnecessary_new

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListFavModelPage extends ChangeNotifier {
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

  // fatch wishlist data
  List _wishlistList = [];
  List get wishlistList => _wishlistList;

  wishListFatch(context) async {
    _wishlistList = [];
    notifyListeners();
    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "status": "WISHLIST",
      "userId": prefs.getString('userId')
    };
    print('wishlist perm $rawData');
    var response = await dio.post(baseUrl + endpointwishlist,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('wishlist responceData $responseData');

    try {
      if (responseData['success'] == true) {
        _wishlistList = responseData['data'];
        print('wishlist list length ${wishlistList.length}');
        print('wishlist list  ${_wishlistList}');

        notifyListeners();
        await wishlistaddeeproductIdListGnrate(wishlistList);
        toggleshemmerdismis();
      } else {
        _wishlistList = [];
        notifyListeners();
        await wishlistaddeeproductIdListGnrate(wishlistList);
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

  // --- WISLIST ADDED PRODUCUT ID LIST GENRATE ------
  List _wishlistIDList = [];
  List get wishlistIDList => _wishlistIDList;
  wishlistaddeeproductIdListGnrate(wishlistList) {
    _wishlistIDList = [];

    for (var i = 0; i < wishlistList.length; i++) {
      _wishlistIDList.add(wishlistList[i]['Add_card']['product_id']);
      notifyListeners();
    }
    print('wishlistIDList $wishlistIDList');
  }

//add item in wishlist

  Map _addfavperam = {};
  Map get addfavperam => _addfavperam;

  addperams(context, value) async {
    print('param value $value');
    _addfavperam = await value;
    notifyListeners();
    await wishListAddItem(context);
  }

  wishListAddItem(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    toggleshemmerShow();

    Dio dio = new Dio();
    print(
        'product_amount ${int.parse(addfavperam['product_amount']).runtimeType}');
    print('product_despoit ${addfavperam['product_despoit'].runtimeType}');
    print(
        'product_despoit ${int.parse(addfavperam['product_despoit']).runtimeType}');
    Map<String, dynamic> rawData = {
      "product_id": addfavperam['product_id'],
      "user_id": prefs.getString('userId'),
      "actual_price": int.parse(addfavperam['product_amount']),
      "desposit_price": int.parse(addfavperam['product_despoit']),
      "quality": 1,
      "remain_price": int.parse(addfavperam['product_amount']) -
          int.parse(addfavperam['product_despoit']),
      "status": "WISHLIST",
      "vendor_id": addfavperam['product_vendor_id'],
      "vendor_name": addfavperam['product_vendor'],
      "offer": addfavperam['product_offcer'],
      "product_name": addfavperam['product_name'],
      "product_url": addfavperam['product_cover_image'],
      "product_minimum_order_quantity":
          addfavperam['product_minimum_order_quantity'],
      "product_flat_price": int.parse(addfavperam['product_flat_price']),
      "module_type": addfavperam["selectList"],
    };
    print('vkg wishlist add prem $rawData');
    var response = await dio.post(baseUrl + endpointAddtoCartandWishlist,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);
    final responseData = json.decode(response.toString());
    // print('wishListAddItem responceData $responseData');

    try {
      if (responseData['success'] == true) {
        showFlutterToast(responseData['message']);
        _addfavperam = {};
        notifyListeners();
        await wishListFatch(context);
        toggleshemmerdismis();
      } else {
        toggleshemmerdismis();
        showFlutterToast(responseData['message']);
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

  // move to cart api from wishlist

  moveToCart(moveproductId, moduleType) async {
    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "product_id": moveproductId,
      "userId": prefs.getString('userId'),
      "module_type": moduleType,
    };
    print('move to cart from wishlist peram $rawData');
    var response = await dio.post(baseUrl + endpointmovetocard,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('move to cart from wishlist responceData $responseData');

    try {
      if (responseData['success'] == true) {
        showFlutterToast('Product Moved to Cart');

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

  // REMOVE WISHLIST ITEM

  removeFromWishlistItem(context, removeproductId) async {
    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "product_id": removeproductId,
    };
    print('remove WISHLIST peram $rawData');
    var response = await dio.post(baseUrl + endpointremovecard,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('remove WISHLIST responceData $responseData');

    try {
      if (responseData['success'] == true) {
        showFlutterToast('Product Remove Succesfull');
        await wishListFatch(context);
        //  await cartListFatch(context);
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
}
