// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:eventneedz/bottom%20nav%20bar/menu/mayorder/myorderfilter.dart';
import 'package:eventneedz/bottom%20nav%20bar/mycart/mycartpaymentbill_modelpage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:eventneedz/razorpay%20payment/razorpaypayment_modelpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'myorder_modelpage.dart';
import 'myorderwidget.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);
  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  int selectPosition = 0;
  var status = "All";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      final rozarpaymodel =
          Provider.of<RazorpayModelPage>(context, listen: false);

      if (rozarpaymodel.paymentDone) {
        print(
            'payment done but order not save in database ${rozarpaymodel.paymentDone}');
        await Provider.of<MyCartPaymentBillPage>(context, listen: false)
            .crtListAddItemdb(context);
        await rozarpaymodel.falsepayemntdone();
      }
      await Provider.of<MyOrderModelPage>(context, listen: false)
          .orderListFatch(context, status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyOrderModelPage>(builder: (context, model, _) {
      return Scaffold(
        backgroundColor: colorgreylight,
        appBar: apponlytitle(context, 'My Orders'),
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Orders'),
                      sizedboxheight(10.0),
                      getSearchBar(context),
                      sizedboxheight(10.0),
                      Wrap(
                        children: [
                          InkWell(
                            onTap: () async {
                              status = "All";
                              setState(() {
                                selectPosition = 1;
                              });
                              await Provider.of<MyOrderModelPage>(context,
                                      listen: false)
                                  .orderListFatch(context, status);
                              Get.to(myorderfilter(status));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 10.0, bottom: 5, top: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  color: selectPosition == 1
                                      ? colorredlightbtn
                                      : colorgreylight,
                                  borderRadius: borderRadiuscircular(16.0)),
                              child: Text(
                                "All",
                                style: textstylesubtitle1(context)!.copyWith(
                                    color: selectPosition == 1
                                        ? colorWhite
                                        : colorgrey),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              status = "Ordered";
                              setState(() {
                                selectPosition = 2;
                              });
                              await Provider.of<MyOrderModelPage>(context,
                                      listen: false)
                                  .orderListFatch(context, status);
                              Get.to(myorderfilter(status));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 10.0, bottom: 5, top: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  color: selectPosition == 2
                                      ? colorredlightbtn
                                      : colorgreylight,
                                  borderRadius: borderRadiuscircular(16.0)),
                              child: Text(
                                "Ordered",
                                style: textstylesubtitle1(context)!.copyWith(
                                    color: selectPosition == 2
                                        ? colorWhite
                                        : colorgrey),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              status = "Shipped";
                              setState(() {
                                selectPosition = 3;
                              });
                              await Provider.of<MyOrderModelPage>(context,
                                      listen: false)
                                  .orderListFatch(context, status);
                              Get.to(myorderfilter(status));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 10.0, bottom: 5, top: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  color: selectPosition == 3
                                      ? colorredlightbtn
                                      : colorgreylight,
                                  borderRadius: borderRadiuscircular(16.0)),
                              child: Text(
                                "Shipped",
                                style: textstylesubtitle1(context)!.copyWith(
                                    color: selectPosition == 3
                                        ? colorWhite
                                        : colorgrey),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              status = "Delivered";
                              setState(() {
                                selectPosition = 4;
                              });
                              await Provider.of<MyOrderModelPage>(context,
                                      listen: false)
                                  .orderListFatch(context, status);
                              Get.to(myorderfilter(status));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 10.0, bottom: 5, top: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  color: selectPosition == 4
                                      ? colorredlightbtn
                                      : colorgreylight,
                                  borderRadius: borderRadiuscircular(16.0)),
                              child: Text(
                                "Delivered",
                                style: textstylesubtitle1(context)!.copyWith(
                                    color: selectPosition == 4
                                        ? colorWhite
                                        : colorgrey),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              status = "Cancelled";
                              setState(() {
                                selectPosition = 5;
                              });
                              await Provider.of<MyOrderModelPage>(context,
                                      listen: false)
                                  .orderListFatch(context, status);
                              Get.to(myorderfilter(status));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 10.0, bottom: 5, top: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  color: selectPosition == 5
                                      ? colorredlightbtn
                                      : colorgreylight,
                                  borderRadius: borderRadiuscircular(16.0)),
                              child: Text(
                                "Cancelled",
                                style: textstylesubtitle1(context)!.copyWith(
                                    color: selectPosition == 5
                                        ? colorWhite
                                        : colorgrey),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              status = "On the way";
                              setState(() {
                                selectPosition = 6;
                              });
                              await Provider.of<MyOrderModelPage>(context,
                                      listen: false)
                                  .orderListFatch(context, status);
                              Get.to(myorderfilter(status));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 10.0, bottom: 5, top: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  color: selectPosition == 6
                                      ? colorredlightbtn
                                      : colorgreylight,
                                  borderRadius: borderRadiuscircular(16.0)),
                              child: Text(
                                "On the way",
                                style: textstylesubtitle1(context)!.copyWith(
                                    color: selectPosition == 6
                                        ? colorWhite
                                        : colorgrey),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              status = "Return";
                              setState(() {
                                selectPosition = 7;
                              });
                              await Provider.of<MyOrderModelPage>(context,
                                      listen: false)
                                  .orderListFatch(context, status);
                              Get.to(myorderfilter(status));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 10.0, bottom: 5, top: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  color: selectPosition == 7
                                      ? colorredlightbtn
                                      : colorgreylight,
                                  borderRadius: borderRadiuscircular(16.0)),
                              child: Text(
                                "Return",
                                style: textstylesubtitle1(context)!.copyWith(
                                    color: selectPosition == 7
                                        ? colorWhite
                                        : colorgrey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              sizedboxheight(6.0),
              orderplacedList(context, model),
            ],
          ),
        ),
      );
    });
  }
}
