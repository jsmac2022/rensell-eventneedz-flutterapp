// ignore_for_file: avoid_print, unnecessary_new, prefer_typing_uninitialized_variables, prefer_final_fields, prefer_const_constructors

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:flutter/cupertino.dart';

class AppDemoModelPage extends ChangeNotifier {
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

  List _appvideoList = [];
  List get appvideoList => _appvideoList;

  appdemovideofatch(context) async {
    toggleshemmerShow();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {"type": "video"};

    var response = await dio.post(baseUrl + endpointappdemo,
        // options: Options(
        //   headers: {"authorization": prefs.getString('headerToken')},
        // ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('appdemovideofatch responceData $responseData');

    try {
      if (responseData['status'] == true) {
        _appvideoList = await responseData['data'];
        // await genrateThumbnil();
        print('app demo video List $appvideoList');
        notifyListeners();
        print('appvideo list ${appvideoList.length}');
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

  // ----- thumbnil ---------

  // List _thumbnailImageList = [];
  // List get thumbnailImageList => _thumbnailImageList;

  // genrateThumbnil() async {
  //   toggleshemmerShow();
  //   _thumbnailImageList = [];

  //   for (var i = 0; i < appvideoList.length; i++) {
  //     try {
  //       print('video url ${appvideoList[i]['video']['image']}');
  //       final mythumbnilImage = await VideoThumbnail.thumbnailData(
  //         video: appvideoList[i]['video']['image'],
  //         imageFormat: ImageFormat.PNG,
  //         maxWidth: 300,
  //         maxHeight:
  //             200, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
  //         quality: 80,
  //       );
  //       print('mythumbnilImage $mythumbnilImage');
  //       _thumbnailImageList.add(mythumbnilImage);
  //       notifyListeners();
  //     } catch (e) {
  //       print('thumbnil genrate error $e');
  //     }
  //   }
  //   print('thumbnil list length ${thumbnailImageList.length}');

  //   toggleshemmerdismis();
  // }
}
