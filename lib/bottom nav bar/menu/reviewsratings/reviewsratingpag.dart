// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/bottom%20nav%20bar/menu/reviewsratings/reviewsratingwidget.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';

class ReviewsRatings extends StatelessWidget {
  const ReviewsRatings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorgreylight,
      appBar: apponlytitle(context, 'Ratings & Reviews'),
      body: SizedBox(
        width: deviceWidth(context, 1.0),
        height: deviceheight(context, 1.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: Column(
              children: [
                ratingandreview(context),
                costumerreview(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
