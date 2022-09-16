// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Color colorWhite = Colors.white;
Color colorblack = Colors.black;
Color colortransperent = Colors.transparent;

Color colorreddark = HexColor("#C91F42");
Color colorredlightbtn = HexColor("#D95771");
Color colorpinklight = HexColor("#D95771");

Color colorgreen = HexColor("#109A0D");
Color colorgreenlight = HexColor("#F2C6CF");
Color colorgreendark = HexColor('#414D21');

Color colorgrey = HexColor('#C4C4C4');
Color colorgreylight = HexColor('#E4E4E4');
Color colorblack54 = Colors.black54;

Color colorsanderchat = HexColor("#F3F8FF");
Color coloryourchat = HexColor("#FD7235");

const double fontsizeheading28 = 28.0;
const double fontsizeheading25 = 25.0;
const double fontsize22 = 22.0;
const double fontsize18 = 18.0;
const double fontsize16 = 16.0;
const double fontsize15 = 15.0;
const double fontsize14 = 14.0;
const double fontsize11 = 11.0;

const double padding20 = 20.0;
const double padding15 = 15.0;
const double padding10 = 10.0;
const double padding8 = 8.0;
const double padding5 = 5.0;

FontWeight fontWeight600 = FontWeight.w600;
FontWeight fontWeight700 = FontWeight.w700;
FontWeight fontWeight900 = FontWeight.bold;
FontWeight fontWeight400 = FontWeight.w400;
FontWeight fontWeight500 = FontWeight.w500;
FontWeight fontWeightnormal = FontWeight.normal;

TextStyle? textstyleHeading1(context) {
  return Theme.of(context).textTheme.headline1;
}

TextStyle? textstyleHeading2(context) {
  return Theme.of(context).textTheme.headline2;
}

TextStyle? textstyleHeading3(context) {
  return Theme.of(context).textTheme.headline3;
}

TextStyle? textstyleHeading6(context) {
  return Theme.of(context).textTheme.headline6;
}

TextStyle? textstylesubtitle2(context) {
  return Theme.of(context).textTheme.subtitle2;
}

TextStyle? textstylesubtitle1(context) {
  return Theme.of(context).textTheme.subtitle1;
}

double deviceWidth(context, [double size = 1.0]) {
  return MediaQuery.of(context).size.width * size;
}

double deviceheight(context, [double size = 1.0]) {
  return MediaQuery.of(context).size.height * size;
}

BoxBorder borderCustom() {
  return Border.all(color: colorgrey.withOpacity(0.5));
}

BoxBorder borderCustomPink() {
  return Border.all(color: colorgrey);
}

BoxBorder borderCustomlight() {
  return Border.all(color: colorgrey.withOpacity(0.05));
}

Widget sizedboxheight([height = 20.0]) {
  return SizedBox(
    height: height,
  );
}

Widget sizedboxwidth([width = 20.0]) {
  return SizedBox(
    width: width,
  );
}


Widget dividerVertical() {
  return Container(
    width: 1,
    height: double.maxFinite,
    color: Colors.black12,
  );
}

Widget dividerHorizontal(context, width, height) {
  return Center(
    child: Container(
      
      width: deviceWidth(context, width),
      decoration: BoxDecoration(
          color: colorgrey, borderRadius: borderRadiuscircular(20.0)),
      height: height,
    ),
  );
}

Widget dividerHorizontalblack(context) {
  return Center(
    child: Container(
      width: deviceWidth(context),
      height: 1,
      color: Colors.black12,
    ),
  );
}

Decoration decorationtoprounded() {
  return BoxDecoration(
    color: colorWhite,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
    ),
  );
}

BorderRadius borderRadiuscircular(radius) {
  return BorderRadius.circular(radius);
}

boxShadowcontainer() {
  return [
    BoxShadow(
      color: Colors.grey.withOpacity(0.07),
      spreadRadius: 3,
      blurRadius: 4,
      offset: Offset(0, 3),
    ),
  ];
}

mediaText(context) {
  return MediaQuery.of(context).copyWith(textScaleFactor: 0.9);
}
