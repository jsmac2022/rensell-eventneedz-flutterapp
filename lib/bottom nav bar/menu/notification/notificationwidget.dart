// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget tabwidget(context, tabname) {
  return Container(
      decoration: BoxDecoration(border: borderCustomPink()),
      width: 80,
      child: Center(
          child: Text(
        tabname,
        style: TextStyle(fontSize: 15),
      )));
}

Widget notificationcard(context, notificationList) {
  return notificationList.isEmpty
      ? Center(
          child: Text(
            'There are \n No  New Notifications',
            style: textstyleHeading2(context),
            textAlign: TextAlign.center,
          ),
        )
      : ListView.builder(
          itemCount: notificationList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.asset(
                        'assets/images/db1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    sizedboxwidth(8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notificationList[index]["Notification"]["title"]
                                .toString(),
                            style: textstylesubtitle1(context)!
                                .copyWith(fontWeight: fontWeight500),
                          ),
                          sizedboxheight(3.0),
                          Text(
                            notificationList[index]["Notification"]["message"]
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: textstylesubtitle1(context)!
                                .copyWith(color: colorblack54, fontSize: 12.9),
                          ),
                          sizedboxheight(3.0),
                          Text(
                            DateFormat("EEE, MMM d, yyyy")
                                .format(DateTime.parse(notificationList[index]
                                    ["Notification"]["creationDate"]))
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: textstylesubtitle1(context)!
                                .copyWith(fontSize: 12.9),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
}
