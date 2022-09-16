// ignore_for_file: prefer_const_constructors_in_immutables, prefer_final_fields

import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';

class SortButtonProductList extends StatefulWidget {
  SortButtonProductList({Key? key}) : super(key: key);

  @override
  State<SortButtonProductList> createState() => _SortButtonProductListState();
}

class _SortButtonProductListState extends State<SortButtonProductList> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: DropdownButton(
                dropdownColor: colorpinklight,
                focusColor: colorpinklight,
                // buttonPadding: EdgeInsetsGeometry.lerp(
                //     EdgeInsetsDirectional.zero, EdgeInsetsDirectional.zero, 100),
                // value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Price",
                      style: textstylesubtitle1(context)!
                          .copyWith(color: colorWhite),
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Alphabetical",
                        style: textstylesubtitle1(context)!
                            .copyWith(color: colorWhite)),
                    value: 2,
                  ),
                  DropdownMenuItem(
                      child: Text("Distance",
                          style: textstylesubtitle1(context)!
                              .copyWith(color: colorWhite)),
                      value: 3),
                  DropdownMenuItem(
                      child: Text("Rating",
                          style: textstylesubtitle1(context)!
                              .copyWith(color: colorWhite)),
                      value: 4)
                ],
                onChanged: (value) {
                  setState(() {
                    value = _value;
                  });
                  Text("Sort",
                      style: textstylesubtitle1(context)!
                          .copyWith(color: colorpinklight));
                })));
  }
}
