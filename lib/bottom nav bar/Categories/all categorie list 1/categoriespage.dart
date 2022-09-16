// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:eventneedz/bottom%20nav%20bar/dashboard/dashboardrentalmodelpage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/shimmereffect.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cotegorieswidgetpage.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final dbmodel = Provider.of<DashboardModelPage>(context, listen: false);
      dbmodel.categouriesFatch(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarSearchFavCart(context, 'All Categories'),
      backgroundColor: colorgreylight,
      body: Consumer<DashboardModelPage>(builder: (context, model, _) {
        return model.isShimmer
            ? shimmerBox(context, 4, 'dark')
            : Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 1),
                child: categorieslist(context, model));
      }),
    );
  }
}
