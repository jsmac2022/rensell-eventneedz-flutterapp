// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'filtermodelpage.dart';
import 'filterwidgetpage.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterModelPage>(builder: (context, model, _) {
      return Scaffold(
        backgroundColor: colorgreylight,
        appBar: appbartitlebackbtnfilter(context, 'Filters'),
        body: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  filterbtnscolumn(context, model), // left side ke button h
                  filterValuecolumn(context, model), // right side ke checkbox h
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: filterapplybtnRow(context, model),
      );
    });
  }
}
