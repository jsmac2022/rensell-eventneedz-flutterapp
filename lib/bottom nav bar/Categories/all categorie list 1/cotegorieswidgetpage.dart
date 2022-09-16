// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/product%20list%20pageno%202/productlist_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/product%20list%20pageno%202/productlistpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

Widget categorieslist(context, model) {
  final orientation = MediaQuery.of(context).orientation;
  return GridView.builder(
      itemCount: model.categoriesList.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio:
              deviceWidth(context, 1.0) / deviceheight(context, 0.42)),
      itemBuilder: (context, index) {
        print(
            "$baseImagepath${model.categoriesList[index]['category']['image'].toString()}");
        return InkWell(
          onTap: () async {
            print('vkkk id ${model.categoriesList[index]['category']['id']}');
            await Provider.of<ProductListModelPage>(context, listen: false)
                .setCategoryId(model.categoriesList[index]['category']['id']);
            Get.to(() => ProductListPage());
          },
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    child: Image.network(
                      "$baseImagepath${model.categoriesList[index]['category']['image'].toString()}",
                      fit: BoxFit.fill,
                      errorBuilder: (context, exception, stackTrack) => Center(
                          child: Image(
                              image: AssetImage('assets/images/db1.png'),
                              fit: BoxFit.cover)),
                      // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 3),
                    child: Column(
                      children: [
                        Text(
                          model.categoriesList[index]['category']['name']
                              .toString(),
                          style: textstylesubtitle1(context),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        );
      });
}
