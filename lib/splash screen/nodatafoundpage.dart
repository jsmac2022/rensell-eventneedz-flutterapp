
// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';

class Nodatafound extends StatefulWidget {
  Nodatafound({Key? key}) : super(key: key);

  @override
  State<Nodatafound> createState() => _NodatafoundState();
}

class _NodatafoundState extends State<Nodatafound> {
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbartitlebackbtn(context, ''),
      body:nodataFoundWidget(context)
      
    
    );
  }
}

Widget nodataFoundWidget(context){
  return Container(
    color: colorWhite,
    child: Center(child: Text("No Data Found",style: textstyleHeading1(context),),),
  );
}

Widget nodataFoundWidgetfull(context,text){
  return Expanded(
    child: Center(child: Text(text,style: textstyleHeading2(context)!.copyWith(color: colorpinklight,fontWeight: fontWeight700),),),
  );
}
