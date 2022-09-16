// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print

import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/itemfulldetail_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/livestriming.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/rate_review_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/product%20list%20pageno%202/productlistwidgetpage.dart';
import 'package:eventneedz/common/appbar/appbarcarosalslider.dart';
import 'package:eventneedz/common/shimmereffect.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../product list pageno 2/productlist_modelpage.dart';
import 'itemfulldetailswidgetpage.dart';

class ItemFullDetailsPage extends StatefulWidget {
  const ItemFullDetailsPage({Key? key}) : super(key: key);

  @override
  State<ItemFullDetailsPage> createState() => _ItemFullDetailsPageState();
}

class _ItemFullDetailsPageState extends State<ItemFullDetailsPage> {
  late ItemFullDetailModelPage myProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      myProvider = Provider.of<ItemFullDetailModelPage>(context, listen: false);
      await Provider.of<RateReviewModelPage>(context, listen: false)
          .viewPreductreviewlist(
              myProvider.selectedItemData['Product']['product_id']);
      await Provider.of<LiveStrimingModelPage>(context, listen: false)
          .productViewedapi(
              myProvider.selectedItemData['Product']['product_id']);
      await Provider.of<LiveStrimingModelPage>(context, listen: false)
          .livestrimingget(
              myProvider.selectedItemData['Product']['product_id']);
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      myProvider.recentviewdatastore();
      print('dispose fun run');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemFullDetailModelPage>(builder: (context, model, _) {
      return Scaffold(
        backgroundColor: colorgreylight,
        body: SafeArea(
          child: model.isShimmer
              ? shimmerBox(context, 4, 'dark')
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          sliderdashboard(context, model),
                          appbarcarosolslider(),
                        ],
                      ),
                      Column(
                        children: [
                          itemDetails(context, model),
                          sizedboxheight(12.0),
                          // sameProductShortBy(context),
                          sizedboxheight(12.0),
                          enterpinbtn(context),
                          sizedboxheight(12.0),
                          productdiscription(context, model),
                          sizedboxheight(12.0),
                          ratingandreview(context, model),
                          customerphoto(context),
                          costumerreview(context),
                          sizedboxheight(12.0),
                          moreProductbtn(context, model),
                          sizedboxheight(12.0),

                          Consumer<ProductListModelPage>(
                              builder: (context, modelproduct, _) {
                            return modelproduct.productList.isEmpty
                                ? Container()
                                : productList11(
                                    context, modelproduct, 'details');
                          }),
                          sizedboxheight(12.0),
                          yourIntestedwidget(context),
                          sizedboxheight(12.0),
                          recentlyViewed(context, model),
                          sizedboxheight(12.0),
                          recommanded(context, model),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: addTocartbtn(context, model),
      );
    });
  }
}
