// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/ratereview_widgetpage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'rate_review_modelpage.dart';

class RateAndReviewPage extends StatelessWidget {
  const RateAndReviewPage({Key? key,this.pageCome}) : super(key: key);
  final pageCome;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apponlyReviewProduct(context, 'Review Product'),
      body: Consumer<RateReviewModelPage>(builder: (context, model, _) {
        return rateAndreview(context, model);
      }),
    );
  }
}
