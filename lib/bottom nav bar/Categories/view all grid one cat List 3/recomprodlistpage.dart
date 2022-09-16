// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, avoid_print, unused_local_variable

import 'package:eventneedz/bottom%20nav%20bar/Categories/product%20list%20pageno%202/productlist_modelpage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'reccomprodwidgetpage.dart';

class RecomProdListPage extends StatelessWidget {
  RecomProdListPage({Key? key, this.dataList, required this.apptitle})
      : super(key: key);
  final dataList;
  final apptitle;

  @override
  Widget build(BuildContext context) {
    final modelProductList =
        Provider.of<ProductListModelPage>(context, listen: false);
    return Scaffold(
      appBar: appbarSearchFavCart(context, apptitle),
      backgroundColor: colorgreylight,
      body: Container(
          padding: EdgeInsets.only(bottom: 1),
          child: Column(
            children: [
              // filltersortwidget(context, modelProductList,'view all'),
              sizedboxheight(10.0),
              recproductlist(context, dataList),
            ],
          )),
    );
  }
}
