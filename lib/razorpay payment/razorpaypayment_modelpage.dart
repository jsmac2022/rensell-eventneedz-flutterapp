// ignore_for_file: prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables, prefer_final_fields

import 'dart:convert';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/bottom%20nav%20bar/menu/mayorder/myorderpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/1%20My%20Profile/myprofile_modelpage.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayModelPage extends ChangeNotifier {
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

// rozarpay intigration

  late Razorpay razorpay;

  String? _paymentid;
  String? get paymentid => _paymentid;

  String? _paymentError;
  String? get paymentError => _paymentError;

  bool _paymentDone = false;
  bool get paymentDone => _paymentDone;

  falsepayemntdone() {
    _paymentDone = false;
    notifyListeners();
  }

  void openCheckout(context, amt) async {
    toggleshemmerShow();

    final modelprofileview =
        Provider.of<MyProfileModelPage>(context, listen: false);
    await modelprofileview.profileViewFatch(context);

    var options = {
      'key': razorpayApiKey,
      'amount': double.parse('$amt') * 100,
      'name':
          '${modelprofileview.profileviewList[0]['Customer']['firstName']} ${modelprofileview.profileviewList[0]['Customer']['lastName']}',
      'description': 'Subscription Plan',
      'retry': {'enabled': true, 'max_count': 1},
      'timeout': 300,
      'send_sms_hash': true,
      'prefill': {
        'contact': modelprofileview.profileviewList[0]['Customer']['mobile'],
        'email': modelprofileview.profileviewList[0]['Customer']['email']
      },
      // 'external': {
      //   'wallets': ['paytm']
      // }
    };

    try {
      print('vkkk razorpay perams ${options.toString()}');
      razorpay.open(options);
      toggleshemmerdismis();
    } catch (e) {
      toggleshemmerdismis();
      debugPrint('Error: e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    print('vinay handlePaymentSuccess signature ${response.signature}');
    print('vinay handlePaymentSuccess paymentId ${response.paymentId}');
    print('vinay handlePaymentSuccess orderId ${response.orderId}');
    _paymentid = response.paymentId;
    notifyListeners();

    showFlutterToast('Transection Successfull');

    _paymentDone = true;
    notifyListeners();
    Get.to(MyOrderPage());
    // // submit(paymentid);
    // addplan(paymentid);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    print('vinay handlePaymentError code int ${response.code}');
    print('vinay handlePaymentError message ${response.message}');
    _paymentError = jsonDecode(response.message.toString());
    print('vkkk error var $paymentError');
    showFlutterToast('Transection Unsuccessful ');
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    print('vinay handleExternalWallet ${response.walletName!}');
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }
}
