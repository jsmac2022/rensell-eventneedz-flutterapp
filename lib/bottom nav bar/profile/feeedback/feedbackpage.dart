// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';

import 'feedbackwidget.dart';

class FeedBackPage extends StatelessWidget {
  FeedBackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apponlytitle(context, 'App Feedback'),
      backgroundColor: colorgreylight,
      body: SizedBox(
        width: deviceWidth(context, 1.0),
        height: deviceheight(context, 1.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                messagebox(),
                sizedboxheight(10.0),
                logOutBtn(context),
                sizedboxheight(30.0),
                feddbackcard(context),
                feddbackcard(context),
                feddbackcard(context),
                feddbackcard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
