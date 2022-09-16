// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:eventneedz/bottom%20nav%20bar/mycart/mycart_modelpage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/shimmereffect.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:eventneedz/razorpay%20payment/razorpaypayment_modelpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mycartwidgetpage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyCart extends StatefulWidget {
  MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      final model = Provider.of<MyCartModelPage>(context, listen: false);
      await model.cartListFatch(context);

      final razorpaymodel =
          Provider.of<RazorpayModelPage>(context, listen: false);
      razorpaymodel.razorpay = Razorpay();
      razorpaymodel.razorpay.on(
          Razorpay.EVENT_PAYMENT_SUCCESS, razorpaymodel.handlePaymentSuccess);
      razorpaymodel.razorpay
          .on(Razorpay.EVENT_PAYMENT_ERROR, razorpaymodel.handlePaymentError);
      razorpaymodel.razorpay.on(
          Razorpay.EVENT_EXTERNAL_WALLET, razorpaymodel.handleExternalWallet);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyCartModelPage>(builder: (context, model, data) {
      return Scaffold(
        appBar: apponlytitle1(context, 'My Cart'),
        backgroundColor: colorgreylight,
        body: model.isShimmer
            ? shimmerBox(context, 4, 'dark')
            : SizedBox(
                width: deviceWidth(context),
                height: deviceheight(context),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    controller: model.scrollEnd,
                    child: Column(
                      children: [
                        pincodcard(context),
                        itencountcard(context, model),
                        additencard(context, model),
                        moreaddcard(context),
                        orderdetailscard(context, model, data)
                      ],
                    ),
                  ),
                ),
              ),
        bottomNavigationBar: addOrderBtn(context, model),
      );
    });
  }
}
