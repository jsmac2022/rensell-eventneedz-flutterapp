// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


   showFlutterToast(String toast) {
    return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xff21335A),
      textColor: Colors.white,
    );
  }

