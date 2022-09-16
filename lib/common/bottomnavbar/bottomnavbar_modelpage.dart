// ignore_for_file: avoid_print, prefer_const_constructors, prefer_final_fields

import 'dart:core';
import 'package:eventneedz/bottom%20nav%20bar/Categories/all%20categorie%20list%201/categoriespage.dart';
import 'package:eventneedz/bottom%20nav%20bar/appdemo/appdemo_listpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/dashboard/dashboardrental.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/1%20My%20Profile/myprofile_page.dart';
import 'package:flutter/cupertino.dart';

class BottomnavbarModelPage extends ChangeNotifier {
  int _bottombarzindex = 0;
  int get bottombarzindex => _bottombarzindex;


  final List _bottombarScreens = [
    DashboardPageRental(),
    CategoriesPage(),
    DashboardPageRental(),
    AppDemoListPage(),
    MyProfilePage()
  ];

  List get bottombarScreens => _bottombarScreens;

  toggle(context, index) async {    
     _bottombarzindex = index;
      notifyListeners();
  }

// ye fun call hone se back btn dasbord start index pr pahuch jayega
  togglebottomindexreset() {
    _bottombarzindex = 0;
    notifyListeners();
  }

  navigatetoCategory() {
    _bottombarzindex = 1;
    notifyListeners();
  }
}
