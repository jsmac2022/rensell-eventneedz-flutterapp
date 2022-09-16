// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';

Widget messagebox() {
  return Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), border: borderCustom()),
    child: TextFormField(
      // controller: model.messageController,
      // validator: validaterequired,
      maxLines: 3,
      style: TextStyle(
          color: colorblack, fontWeight: FontWeight.w500, fontSize: 18),
      decoration: InputDecoration(
        counterText: '',
        border: InputBorder.none,
        fillColor: colorWhite,
        filled: true,
        hintText: 'Type Your feedback here....',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: TextStyle(
          color: colorblack,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

Widget logOutBtn(context) {
  return Button(
  
    buttonName: 'SUBMIT',
    textColor: colorWhite,
    btnHeight: 35,
    btnfontsize: 14,
    btnWidth: deviceWidth(context, 0.3),
    borderRadius: BorderRadius.circular(5),
    key: Key('SUBMIT'),
    onPressed: () {
      //  Get.to(() => SelectCategry());
    },
  );
}

Widget feddbackcard(context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      children: [
        Container(
          width: 10,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0)),
            color: colorpinklight,
          ),
        ),
        sizedboxwidth(10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nice App'),
            sizedboxheight(2.0),
            Row(
              children: [
                Icon(
                  Icons.access_time_outlined,
                  size: 15,
                  color: colorgrey,
                ),
                sizedboxwidth(5.0),
                Text(
                  '23 Sep 2021',
                  style: textstylesubtitle2(context),
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}
