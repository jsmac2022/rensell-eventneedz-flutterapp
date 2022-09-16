// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';
import 'styles/const.dart';

Widget shimmerBox(context,[int itemCount=2,String title='light']) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
    child: Shimmer.fromColors(
        baseColor:title!='light'?Colors.white: Colors.grey[300]!,
        highlightColor:title!='light'?  Colors.grey[200]!:Colors.grey[100]!,
        // period: Duration(milliseconds: 1700),
        child: ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemCount,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: deviceWidth(context, 0.43),
                      height: deviceWidth(context, 0.35),
                      decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(7)),
                    ),
                    sizedboxheight(5.0),
                    Container(
                      width: deviceWidth(context, 0.43),
                      height: 10,
                      decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(3.0)),
                    ),
                    sizedboxheight(5.0),
                    Container(
                      width: deviceWidth(context, 0.43),
                      height: 20,
                      decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(3.0)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: deviceWidth(context, 0.43),
                      height: deviceWidth(context, 0.35),
                      decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(7)),
                    ),
                    sizedboxheight(5.0),
                    Container(
                      width: deviceWidth(context, 0.43),
                      height: 10,
                      decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(3.0)),
                    ),
                    Container(
                      width: deviceWidth(context, 0.43),
                      height: 20,
                      decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(3.0)),
                    )
                  ],
                ),
              ],
            ),
          );
        })),
  );
}
Widget shimmertext(text) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
    child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: Duration(milliseconds: 1700),
        child:Text(text)),
  );
}

Widget loadingwidget() {
  return Center(
      child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [HexColor('#FDCD35'), HexColor('#FD7235')]),
            // borderRadius: borderRadiuscircular(10.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpinKitFadingCircle(
                color: colorWhite,
              ),
              sizedboxheight(5.0),
              Text(
                'Loading...',
                textAlign: TextAlign.right,
                style: TextStyle(color: colorWhite, fontSize: 16),
              )
            ],
          )));
}


Widget shimmer() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: Shimmer.fromColors(
      // baseColor: Colors.grey[300]!,
      baseColor: Colors.white60,
      // highlightColor: Colors.grey[100]!,
      highlightColor: Colors.black12,
      period: Duration(milliseconds: 2500),
      child: SingleChildScrollView(
        child: Column(
          children: [0, 1, 2, 3, 4, 5, 6, 7, ]
              .map((_) => Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(7)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 18.0,
                                decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(5)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(5)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                              ),
                              Container(
                                width: 100.0,
                                height: 8.0,
                                decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(5)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                              ),
                              Container(
                                width: 20.0,
                                height: 8.0,
                                decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(5)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    ),
  );
}

Widget shimmersmall() {
  return SizedBox(
    width: double.infinity,
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          children: [0]
              .map((_) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(7)),
                  ),
                 sizedboxwidth(8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 14.0,
                          decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(3.5)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                        ),
                        Container(
                          width: 180,
                          height: 8.0,
                          decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(5)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                        ),
                        Container(
                          width: 100.0,
                          height: 8.0,
                          color: colorWhite,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                        ),
                        Container(
                          width: 50.0,
                          height: 8.0,
                          decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    ),
                  )
                ],
              ))
              .toList(),
        ),
      ),
    ),
  );
}
