// ignore_for_file: unnecessary_new, avoid_print, prefer_final_fields, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/image%20picker/imagepic_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/rate_review_page.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:eventneedz/common/styles/apierroralertdiloge.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RateReviewModelPage extends ChangeNotifier {
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

  TextEditingController reviwwritebox = TextEditingController();

  // double _rating = 3.0;

  double _rating = 3.0;
  double get rating => _rating;

  togglerateapp(rating) {
    _rating = rating;
    notifyListeners();
  }

  Map _productdata = {};
  Map get productdata => _productdata;

  setProductId(data) {
    _productdata = data;

    print(_productdata);
    notifyListeners();
    print('review itm selected $productdata');
    Get.to(() => RateAndReviewPage());
  }

//sand review api
  rateAndreviewSubmit(context) async {
    final imagemodel =
        Provider.of<ImagePickerModelPage>(context, listen: false);
    toggleshemmerShow();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "rating": rating.toInt().toString(),
      "product_id": productdata['product_id'],
      "user_id": prefs.getString('userId'),
      "message": reviwwritebox.text
    };

    /* FormData formData = new FormData.fromMap({
      "rating": rating,
      "product_id": productdata['product_id'],
      "user_id": prefs.getString('userId'),
      "message": reviwwritebox.text,
      "image": imagemodel.file == null
          ? null
          : await MultipartFile.fromFile(imagemodel.file.path,
              filename: imagemodel.imageName),
      // "image":image == null ? null : await MultipartFile.fromFile(image!.path, filename: imageName),
    });*/

    // print('otp verify perams ${formData.fields}');
    print('otp verify perams ${rawData}');

    var response = await dio.post(baseUrl + endpointProductreviewAdd,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: /*formData*/ rawData);

    final responseData = json.decode(response.toString());
    print('vvvvvkkkk $responseData');

    try {
      if (responseData['status'] == true) {
        toggleshemmerdismis();

        showFlutterToast(responseData['message']);
        Get.back();
        imagemodel.resetimagepickervariable();
      } else {
        toggleshemmerdismis();
        apiErrorAlertdialog(context, responseData['message']);
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print(e);
    }
  }

  // ---- VIEW REVIEW LIST ------
  List _productReviewList = [];
  List get productReviewList => _productReviewList;

  viewPreductreviewlist(productId) async {
    print('vkkk $productId');

    toggleshemmerShow();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {"product_id": productId};

    print('viewPreductreviewlist peram $rawData');

    var response =
        await dio.post(baseUrl + endpointProductreview, data: rawData);
    print(' viewPreductreviewlist response $response');
    final responseData = json.decode(response.toString());
    // print('vanderShopList responceData $responseData');

    try {
      if (responseData['status'] == true) {
        _productReviewList = await responseData['data'];
        notifyListeners();
        await genrateprList(productReviewList);
        await viewPreductreviewCountlist(productId);
        print('productReview list Mahimaaaaaaa  $productReviewList');

        toggleshemmerdismis();
      } else {
        _productReviewList = [];
        notifyListeners();

        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

  // ---- ALL IMAGE PRODUCT REVIEW LIST GENRATE ------

  List _pRImageList = [];
  List get pRImageList => _pRImageList;
  genrateprList(list) {
    _pRImageList = [];
    for (var i = 0; i < list.length; i++) {
      if (list[i]['Product_review']['image'] != '') {
        _pRImageList.add(list[i]['Product_review']['image']);
        notifyListeners();
      }
      notifyListeners();
    }
    // print('genrate reviw image list $pRImageList');
  }

  // ---- VIEW RATING  REVIEW COUNT ------
  Map _productReviewCOUNTMap = {};
  Map get productReviewCOUNTMap => _productReviewCOUNTMap;

  var _totalRatingCount = 0;
  get totalRatingCount => _totalRatingCount;

  viewPreductreviewCountlist(productId) async {
    print('vkkk $productId');

    toggleshemmerShow();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {"product_id": productId};

    print('viewPreductreviewCountlist peram $rawData');

    var response =
        await dio.post(baseUrl + endpointProductreviewCount, data: rawData);
    print(' viewPreductreviewlist response $response');
    final responseData = json.decode(response.toString());
    // print('vanderShopList responceData $responseData');

    try {
      if (responseData['status'] == true) {
        _productReviewCOUNTMap = await responseData;
        _totalRatingCount = await responseData['total_review'];
        notifyListeners();
        await totalratingCount(
          responseData['rating_1'],
          responseData['rating_2'],
          responseData['rating_3'],
          responseData['rating_4'],
          responseData['rating_5'],
        );
        print('productReviewCOUNTMap list $productReviewCOUNTMap');

        toggleshemmerdismis();
      } else {
        _productReviewCOUNTMap = {};
        notifyListeners();

        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

  // --- count total rating -----
  var _totalRating = '0';
  get totalRating => _totalRating;

  totalratingCount(a, b, c, d, e) {
    _totalRating =
        ((5 * e + 4 * d + 3 * c + 2 * b + 1 * a) / (a + b + c + d + e))
            .toStringAsFixed(1);
    notifyListeners();
  }
}
