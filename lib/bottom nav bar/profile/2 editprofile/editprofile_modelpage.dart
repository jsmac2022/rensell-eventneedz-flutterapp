// ignore_for_file: avoid_print, prefer_const_constructors, prefer_final_fields, unnecessary_new

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/1%20My%20Profile/myprofile_modelpage.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:eventneedz/common/styles/apierroralertdiloge.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileModel extends ChangeNotifier {
  bool _autovalidatechngpassword = false;
  bool get autovalidatechngpassword => _autovalidatechngpassword;
  toggleautovalidate() {
    _autovalidatechngpassword = !_autovalidatechngpassword;
    notifyListeners();
  }

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController mobile = TextEditingController();

  String _selectedGender = '';
  String get selectedGender => _selectedGender;

  List<String> _selectedGenderList = ['Male', 'Female'];
  List get selectedGenderList => _selectedGenderList;

  gendervalueInitialize(context) {
    final modelprofileview = Provider.of<MyProfileModelPage>(context, listen: false);
    if (selectedGender == '') {
      print(selectedGender);
      _selectedGender = modelprofileview.profileviewList[0]['Customer']['gender'] ?? '';
      // notifyListeners();
      return selectedGender;
    } else {
      print(selectedGender);
      return selectedGender;
    }
  }

  toogleradiobtn(value) {
    _selectedGender = value;
    print(selectedGender);
    notifyListeners();
  }

  bool _isShimmer = false;
  bool get isShimmer => _isShimmer;

  toggleshemmerShow() {
    _isShimmer = true;
    notifyListeners();
  }

  toggleshemmerdismis() {
    _isShimmer = false;
    notifyListeners();
  }

  DateTime? newdob;
  DateTime currentDate = DateTime.now();
  selectDate(context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context, initialDate: currentDate, firstDate: DateTime(1950), lastDate: DateTime.now()) as DateTime;
    if (pickedDate != currentDate) {
      currentDate = pickedDate;
      newdob = pickedDate;
      notifyListeners();
    }
  }

  String? onlydate;
  String? gettext(modelprofileview) {
    if (newdob == null) {
      onlydate = modelprofileview.profileviewList[0]['Customer']['dob'] ?? 'Enter Birth Date';
      // notifyListeners();
      print('select dob ${modelprofileview.profileviewList[0]['Customer']['dob'] ?? 'Enter Birth Date'}');
      return onlydate;
      // return onlydate = DateFormat('dd-MM-yyyy').format(currentDate);
    } else {
      onlydate = DateFormat('dd-MM-yyyy').format(currentDate);
      // notifyListeners();
      print('select dob $onlydate');
      return onlydate;
      // return "${currentDate.day}/${currentDate.month}/${currentDate.year}";
    }
  }

  // reset all fields
  resetAlltextfield() {
    fname.clear();
    lname.clear();
    // mobile.clear();
    onlydate = null;
    newdob = null;
    // _selectedGender = '';
    notifyListeners();
  }

// /edit profile api

  editprofileUpdate(context) async {
    toggleshemmerShow();
    final modelprofileview = Provider.of<MyProfileModelPage>(context, listen: false);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // var useridconvertint = userid?.substring(1, userid.length - 1);

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "firstName":
          fname.text.isNotEmpty ? fname.text : modelprofileview.profileviewList[0]['Customer']['firstName'].toString(),
      "lastName":
          lname.text.isNotEmpty ? lname.text : modelprofileview.profileviewList[0]['Customer']['lastName'].toString(),
      "userId": prefs.getString('userId'),
      "mobile":
          mobile.text.isNotEmpty ? mobile.text : modelprofileview.profileviewList[0]['Customer']['mobile'].toString(),
      "dob": onlydate,
      "gender":
          selectedGender == '' ? modelprofileview.profileviewList[0]['Customer']['gender'].toString() : selectedGender
    };
    print('update profile perams $rawData');
    var response = await dio.post(baseUrl + endpointUpdateProfile,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('update profile responseData $responseData');

    try {
      if (responseData['status'] == true) {
        showFlutterToast('Profile Update Successfull');
        final profileview = Provider.of<MyProfileModelPage>(context, listen: false);
        await profileview.profileViewFatch(context); //ye profile update ko show kr dega

        // Get.off(() => BottomNavBarPage());
        gendervalueInitialize(context);

        resetAlltextfield();
        notifyListeners();
        toggleshemmerdismis();
      } else {
        toggleshemmerdismis();
        print('Error: ${responseData["message"]}');
        apiErrorAlertdialog(context, responseData["message"]);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('Error: ${e.toString()}');
    }
  }

  //  chnage password api

  TextEditingController oldpassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  changepassword(context) async {
    toggleshemmerShow();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "id": prefs.getString('userId'),
      "old_password": oldpassword.text,
      "new_password": newPassword.text
    };
    print('change password perams $rawData');
    var response = await dio.post(baseUrl + endpointchangepassword,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('update profile responseData $responseData');

    try {
      if (responseData['status'] == true) {
        showFlutterToast('Profile Update Successfull');

        Get.back();

        notifyListeners();
        toggleshemmerdismis();
      } else {
        toggleshemmerdismis();
        print('Error: ${responseData["message"]}');
        apiErrorAlertdialog(context, responseData["message"]);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('Error: ${e.toString()}');
    }
  }
}
