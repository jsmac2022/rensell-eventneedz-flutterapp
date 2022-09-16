// ignore_for_file: unnecessary_new, avoid_print, prefer_final_fields, unused_field, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItmgenrateClass {
  String? product_name;
  var id;
  int actual_price;
  int desposit_price;
  String? offer;
  var product_id;
  var vendor_id;
  var quality = 1;
  int remain_price;
  int product_flat_price;
  String? vendor_name;
  String? product_url;
  String? module_type;
  String? minQty;

  CartItmgenrateClass(
      {this.product_name,
      required this.id,
      required this.actual_price,
      required this.desposit_price,
      required this.offer,
      this.product_id,
      required this.vendor_id,
      required this.quality,
      required this.product_flat_price,
      required this.remain_price,
      this.vendor_name,
      this.product_url,
      this.module_type,
      this.minQty});
}

class MyCartModelPage extends ChangeNotifier {
  bool _isShimmer = false;

  bool get isShimmer => _isShimmer;

  get selectList => null;

  toggleshemmerShow() {
    _isShimmer = true;
    notifyListeners();
  }

  toggleshemmerdismis() {
    _isShimmer = false;
    notifyListeners();
  }

  bool _module_type = true;

  bool get module_type => _module_type;

// click to btn go to the page end
  final ScrollController scrollEnd = ScrollController();

  void scrollDown() {
    scrollEnd.animateTo(
      scrollEnd.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
    notifyListeners();
  }

  // final total bill amount variable

  int _totalAmount = 0;

  int get totalAmount => _totalAmount;

  int _totalDiposite = 0;

  int get totalDiposite => _totalDiposite;

  int _totalDiscount = 0;

  int get totalDiscount => _totalDiscount;

  // TOTAL FINAL PAYABLE AMOUNT FOR BILLING in this actual + deposite -discount + offer

  int _finalPayableAmount = 0;
  int get finalPayableAmount => _finalPayableAmount;

// FINAL TOTAL GENRATED CART ITEMS LIST

  List cartlistdata = [];

  // increse decrese quantity

  int payablePrice = 0;
  int diposite = 0;
  int discountPrice = 0;
  int finalPrice = 0;

  increseQuantity(item) {
    // int min = 1;
    try {
      min = int.parse(item.quality);
    } catch (e) {
      min = 1;
    }
    print("Loklendra" + item.product_flat_price.toString());
    print("Loklendra" + _finalPayableAmount.toString());
    if (item.quality == min) {
      finalPrice = item.product_flat_price;
      payablePrice = item.actual_price;
      diposite = item.desposit_price;
      discountPrice = item.product_flat_price - item.actual_price;
    }

    print('vvv ${item.actual_price.runtimeType}');
    item.quality = item.quality + min;

    _totalAmount = _totalAmount + finalPrice;
    _finalPayableAmount = _finalPayableAmount + payablePrice;
    _totalDiscount = totalDiscount + discountPrice;

    item.desposit_price = item.desposit_price + diposite;
    _totalDiposite = _totalDiposite + diposite;

    notifyListeners();
  }

  int min = 1;

  decreseQuantity(item) {
    try {
      min = int.parse(item.quality);
    } catch (e) {
      min = 1;
    }
    if (item.quality > min) {
      item.quality = item.quality - min;
      //item.actual_price = finalPrice - item.actual_price;

      _totalAmount = _totalAmount - finalPrice;
      _finalPayableAmount = _finalPayableAmount - payablePrice;
      _totalDiscount = totalDiscount - discountPrice;

      item.desposit_price = item.desposit_price - diposite;
      _totalDiposite = _totalDiposite - diposite;
      notifyListeners();
    }
  }

  // int _gstAmonut = 18;
  // int get gstAmount => _gstAmonut;

  // double _finalGstAmount = 0.0;
  // double get finalGstAmount => _finalGstAmount;

  // GSTAmount(item) {
  //   var gst = ((_finalPayableAmount * _gstAmonut) / 100);
  //   _finalGstAmount = _finalPayableAmount + gst;
  //   print("gst amount 222    >>>>>" + _finalGstAmount.toString());

  //   notifyListeners();
  // }

// creating for loop amount added one bye one
  var totalitemaAmount = 0;
  var oneItenDeposite = 0;
  var finalAmountPay = 0;

  //  CART ITEM LISTVIEW CREATE
  createItemquantityList(wishlistList) {
    print('cart total item COMES ${wishlistList.length}');

    for (var i = 0; i < wishlistList.length; i++) {
      print(wishlistList[i]['Add_card']['id']);
      print(wishlistList[i]['Add_card']['actual_price']);
      print(wishlistList[i]['Add_card']['desposit_price']);
      print(wishlistList[i]['Add_card']['product_id']);
      print(
          " mahimanjnj${wishlistList[i]['Add_card']['product_discounted_price']}");

      print({"vendor_id ${wishlistList[i]['Add_card']['vendor_id']}"});
      var minqty = 1;
      var product_flat_price = 1;
      var actual_price = 1;
      var desposit_price = 1;
      try {
        minqty = int.parse(
            wishlistList[i]['Add_card']['product_minimum_order_quantity']);
        product_flat_price =
            (wishlistList[i]['Add_card']['product_flat_price']) * minqty;
        actual_price = (wishlistList[i]['Add_card']['actual_price']) * minqty;
        desposit_price =
            (wishlistList[i]['Add_card']['desposit_price']) * minqty;
      } catch (e) {
        minqty = 1;
        product_flat_price =
            (wishlistList[i]['Add_card']['product_flat_price']) * minqty;
        actual_price = (wishlistList[i]['Add_card']['actual_price']) * minqty;
        desposit_price =
            (wishlistList[i]['Add_card']['desposit_price']) * minqty;
      }
      cartlistdata.add(CartItmgenrateClass(
          id: wishlistList[i]['Add_card']['id'].toString(),
          product_name: wishlistList[i]['Add_card']['product_name'],
          actual_price: actual_price,
          desposit_price: desposit_price,
          offer: wishlistList[i]['Add_card']['offer'].toString(),
          product_id: wishlistList[i]['Add_card']['product_id'],
          vendor_id: wishlistList[i]['Add_card']['vendor_id'],
          quality: minqty,
          remain_price: wishlistList[i]['Add_card']['remain_price'],
          vendor_name: wishlistList[i]['Add_card']['vendor_name'],
          product_flat_price: product_flat_price,
          product_url: wishlistList[i]['Add_card']['product_url'][0],
          module_type: wishlistList[i]['Add_card']['module_type'],
          minQty: wishlistList[i]['Add_card']
              ['product_minimum_order_quantity']));
      notifyListeners();
      print('vkkk $i');
      finalAmountPay = cartlistdata[i].actual_price;
      totalitemaAmount = cartlistdata[i].product_flat_price;
      _totalAmount = _totalAmount + totalitemaAmount;
      _totalDiscount =
          (cartlistdata[i].product_flat_price - cartlistdata[i].actual_price) +
              _totalDiscount;

      oneItenDeposite = cartlistdata[i].desposit_price;
      _totalDiposite = _totalDiposite + oneItenDeposite;

      print('fidsd-- $_totalDiposite');

      _finalPayableAmount =
          _finalPayableAmount + (finalAmountPay + oneItenDeposite);

      //_finalPayableAmount = _totalDiposite;

      notifyListeners();
    }

    print(' final total cart created $cartlistdata');
  }

  // fatch cart list data

  resetPeramAmountValue() {
    _totalAmount = 0;
    _totalDiposite = 0;
    _totalDiscount = 0;
    finalPrice = 0;
    totalitemaAmount = 0;
    oneItenDeposite = 0;
    _finalPayableAmount = 0;
    cartlistdata = [];
    // _wishlistList = [];

    notifyListeners();
  }

  cartListFatch(context) async {
    toggleshemmerShow();
    await resetPeramAmountValue();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "userId": prefs.getString('userId'),
      "carttype": "CARTLIST"
    };
    print('Lokendra--cartlist perm $rawData');
    print(
        'Lokendra--cartlist perm ' + prefs.getString('headerToken').toString());
    var response = await dio.post(baseUrl + endpointcartview,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    print(prefs.getString('headerToken'));

    final responseData = json.decode(response.toString());
    print('cart list fatch responceData $responseData');

    try {
      if (responseData['success'] == true) {
        notifyListeners();
        await createItemquantityList(responseData['data']);
        notifyListeners();
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

//add item in CART

  Map _addcartPeram = {};

  Map get addcartPeram => _addcartPeram;

  addperams(value) async {
    _addcartPeram = value;
    notifyListeners();
  }

  moduleType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var moduleType = prefs.getString("selectList");
    return moduleType as String;
  }

  crtListAddItem(context) async {
    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "product_id": addcartPeram['product_id'],
      "user_id": prefs.getString('userId'),
      "actual_price": int.parse(addcartPeram['product_amount']),
      "desposit_price": int.parse(addcartPeram['product_despoit']),
      "product_flat_price": int.parse(addcartPeram['product_flat_price']),
      "quality": 1,
      "remain_price": int.parse(addcartPeram['product_amount']) -
          int.parse(addcartPeram['product_despoit']),
      "status": "CARTLIST",
      "vendor_id": addcartPeram['product_vendor_id'],
      "vendor_name": addcartPeram['product_vendor'],
      "offer": addcartPeram['product_offcer'],
      "product_name": addcartPeram['product_name'],
      "product_url": addcartPeram['product_cover_image'],
      "module_type": addcartPeram["selectList"],
      "product_minimum_order_quantity":
          addcartPeram["product_minimum_order_quantity"]
      //  prefs.getString("selectList"),
    };

    print("Lokend===" + rawData.toString());
    var response = await dio.post(baseUrl + endpointAddtoCartandWishlist,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('crtListAddItem responceData $responseData');
    print('crtListAddItem responceData $responseData');

    try {
      if (responseData['status'] == true) {
        showFlutterToast('Product add Succesfull');
        notifyListeners();
        toggleshemmerdismis();
      } else {
        // final wishlistModel=Provider.of(context,)
        // await model.moveToCart(model.wishlistList[index]['Add_card']['id']);
        //                               await model.wishListFatch(context);
        showFlutterToast(responseData['message']);
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

// final all product buy data

  List _allbuyproductId = [];

  List get allbuyproductId => _allbuyproductId;

  List _allbuyproductQuantity = [];

  List get allbuyproductQuantity => _allbuyproductQuantity;

  List _allbuyvandorId = [];

  List get allbuyvandorId => _allbuyvandorId;

  List _allbuyproductNameList = [];

  List get allbuyproductNameList => _allbuyproductNameList;

  List _allbuyproductImageUrlList = [];

  List get allbuyproductImageUrlList => _allbuyproductImageUrlList;

  List _allbuyproductAmountList = [];

  List get allbuyproductAmountList => _allbuyproductAmountList;

  List _allbuyproductvanderNameList = [];

  List get allbuyproductvanderNameList => _allbuyproductvanderNameList;

  allbuyproductdata() {
    _allbuyproductId = [];
    _allbuyvandorId = [];
    _allbuyproductQuantity = [];
    _allbuyproductNameList = [];
    _allbuyproductImageUrlList = [];
    _allbuyproductAmountList = [];
    _allbuyproductvanderNameList = [];
    notifyListeners();
    print('final cart data ${cartlistdata.length}');

    for (var i = 0; i < cartlistdata.length; i++) {
      _allbuyproductId.add(cartlistdata[i].product_id);
      _allbuyproductQuantity.add(cartlistdata[i].quality);
      _allbuyvandorId.add(cartlistdata[i].vendor_id);
      _allbuyproductNameList.add(cartlistdata[i].product_name);
      _allbuyproductImageUrlList.add(cartlistdata[i].product_url);
      _allbuyproductAmountList.add(cartlistdata[i].actual_price);
      _allbuyproductvanderNameList.add(cartlistdata[i].vendor_name);

      notifyListeners();
    }
    print('cart product Id list $allbuyproductId');
    print('cart quantity Id list $allbuyproductQuantity');
    print('cart vandor Id list $allbuyvandorId');
    print('cart vandor Id list $allbuyproductNameList');
    print('cart vandor Id list $allbuyproductImageUrlList');
    print('cart vandor Id list $allbuyproductAmountList');
    print('cart vandor Id list $allbuyproductvanderNameList');
  }

  // REMOVE CART ITEM
  removeCartItem(context, removeproductId) async {
    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "product_id": removeproductId,
    };
    print('remove cart peram $rawData');
    var response = await dio.post(baseUrl + endpointremovecard,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('remove cart responceData $responseData');

    try {
      if (responseData['success'] == true) {
        showFlutterToast('Product Remove Succesfull');
        Get.back();
        await cartListFatch(context);
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

  // MOVE TO WISHLIST FROM CART ITEM
  movetofavorites(context, moveId) async {
    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "product_id": moveId,
      "userId": prefs.getString('userId')
    };
    print('move to wishlish peram $rawData');
    var response = await dio.post(baseUrl + endpointmovetowishlist,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('move to wishlish responceData $responseData');

    try {
      if (responseData['success'] == true) {
        showFlutterToast('Product Move to Favouritelist');

        await cartListFatch(context);
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
