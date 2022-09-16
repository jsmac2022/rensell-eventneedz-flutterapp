// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/rate_review_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/menu/mayorder/myorder_itemdetails/myorder_itemdatails_widgetpage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyorderItemDetailspage extends StatelessWidget {
  const MyorderItemDetailspage({Key? key, this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorgreylight,
      appBar: apponlytitle(context, 'Order Details'),
      body: Consumer<RateReviewModelPage>(builder: (context, model, _) {
        return Column(
          children: [
            productDetails(context, model, data),
          ],
        );
      }),
    );
  }
}
