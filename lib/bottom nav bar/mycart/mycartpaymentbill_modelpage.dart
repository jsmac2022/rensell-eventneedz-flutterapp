// ignore_for_file: avoid_print, unnecessary_new, prefer_final_fields

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/bottom%20nav%20bar/mycart/mycart_modelpage.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:eventneedz/razorpay%20payment/razorpaypayment_modelpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCartPaymentBillPage extends ChangeNotifier {
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

// jo product buy kiye hue h unko db m save krna payment order success hone ke bad

  Map _addressSelected = {};
  Map get addressSelected => _addressSelected;

  double _gst = 0.0;
  double get GST => _gst;

  double _finalGstAmount = 0.0;
  double get finalGstAmount => _finalGstAmount;

  addressSelectedperam(context, address) async {
    _addressSelected = await address;
    print('select adreess $addressSelected');
    notifyListeners();
    if (addressSelected.isNotEmpty) {
      final mycartModel = Provider.of<MyCartModelPage>(context, listen: false);
      int gstAmonut = 18;
      _gst = ((mycartModel.finalPayableAmount * gstAmonut) / 100);
      _finalGstAmount = mycartModel.finalPayableAmount + _gst;
      Provider.of<RazorpayModelPage>(context, listen: false)
          .openCheckout(context, _finalGstAmount);
    }
  }

  // -- AFTER PAYMENT -- CART LIST BYE DATA SAVE IN DATABASE

  crtListAddItemdb(context) async {
    toggleshemmerShow();

    final rozerpayModel =
        Provider.of<RazorpayModelPage>(context, listen: false);
    final mycartModel = Provider.of<MyCartModelPage>(context, listen: false);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "product_id": mycartModel.allbuyproductId,
      "quantity": mycartModel.allbuyproductQuantity,
      "vendor_id": mycartModel.allbuyvandorId,
      // "vendor_id": mycartModel.allbuyvandorId[0],
      "product_name": mycartModel.allbuyproductNameList,
      "product_image_url": mycartModel.allbuyproductImageUrlList,
      "amount": mycartModel.allbuyproductAmountList,
      "vendor_name": mycartModel.allbuyproductvanderNameList,
      "user_id": prefs.getString('userId'),
      "country": "india",
      "city": addressSelected['city'],
      "place_address": '',
      "deliver_address":
          '${addressSelected['address']}, ${addressSelected['flat_no']}, ${addressSelected['locality']}, ${addressSelected['land_mark']}, ${addressSelected['city']}, ${addressSelected['state']}',
      "pincode": addressSelected['pincode'],
      "order_booking_place": addressSelected['city'],
      "actual_price": mycartModel.totalAmount,
      "discount_price": mycartModel.totalDiscount,
      "tax": _gst,
      "deliver_amount": 0,
      "total_amount": _finalGstAmount,
      "payment_type": "Rozerpay",
      "payment_transaction_id": rozerpayModel.paymentid,
      "payment_method": "online",
      "payment_status": "SUCCESS",
    };
    print('booking items peram $rawData');
    var response = await dio.post(baseUrl + endpointbookingitems,
        // options: Options(
        //   headers: {"authorization": prefs.getString('headerToken')},
        // ),
        data: rawData);
    print('vkkkk');
    print('product bill booked response $response');
    final responseData = json.decode(response.toString());
    print('product bill booked responceData $responseData');

    try {
      if (responseData['status'] == true) {
        showFlutterToast('Product booked');
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
}
