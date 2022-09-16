// ignore_for_file: avoid_print, prefer_final_fields, unnecessary_new, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/api%20url/globales.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/address/edit%20address/editaddress_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewAddressModelPage extends ChangeNotifier {
  bool _autovalidateLogin = false;
  bool get autovalidateLogin => _autovalidateLogin;

  toggleautovalidate() {
    _autovalidateLogin = !_autovalidateLogin;
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

  String? _selectedAddressInfo;
  String? get selectedAddressInfo => _selectedAddressInfo;

  List<String> _selectedGenderList = ['Home', 'Office', 'other'];
  List get selectedGenderList => _selectedGenderList;

  addressinfoInitializeUpdateApi(context) {
    if (selectedAddressInfo == null) {
      _selectedAddressInfo = addressselectForUpdate['address'] ?? 'Home';
      notifyListeners();
      return selectedAddressInfo;
    } else {
      return selectedAddressInfo;
    }
  }

  addadreesradioInitialize(context) {
    if (selectedAddressInfo == null) {
      _selectedAddressInfo = '';
      notifyListeners();
      return selectedAddressInfo;
    } else {
      return selectedAddressInfo;
    }
  }

  toogleradiobtn(value) {
    _selectedAddressInfo = value;
    print(selectedAddressInfo);
    notifyListeners();
  }

  bool _checkBoxaddressDefault = false;
  bool get checkBoxaddressDefault => _checkBoxaddressDefault;

  addressdefualt(value) {
    _checkBoxaddressDefault = !_checkBoxaddressDefault;
    notifyListeners();
  }

// ---- view address List api -----

  List _addressList = [];
  List get addressList => _addressList;

  viewadrressApi(context) async {
    _addressList = [];

    // notifyListeners();
    toggleshemmerShow();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "userId": prefs.getString('userId'),
    };

    print(' view address list peram $rawData');
    var response = await dio.post(baseUrl + endpointviewAddress, data: rawData);

    final responseData = json.decode(response.toString());
    print('view address list responceData $responseData');

    try {
      if (responseData['status'] == true) {
        _addressList = responseData['data'];
        notifyListeners();
        // print('view address list ${addressList}');
        toggleshemmerdismis();
      } else {
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

// ------- add address api ---- ADD NEW ADDRESS PAGE

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController fletnumber = TextEditingController();
  TextEditingController areastreet = TextEditingController();
  TextEditingController landmark = TextEditingController();

  addressaddApi(context, modelprofileview) async {
    toggleshemmerShow();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "user_id": prefs.getString('userId'),
      "first_name": fname.text.isNotEmpty
          ? fname.text
          : modelprofileview.profileviewList[0]['Customer']['firstName']
              .toString(),
      "last_name": lname.text.isNotEmpty
          ? lname.text
          : modelprofileview.profileviewList[0]['Customer']['lastName']
              .toString(),
      "phone_no": mobile.text.isNotEmpty
          ? mobile.text
          : modelprofileview.profileviewList[0]['Customer']['mobile']
              .toString(),
      "pincode": pincode.text,
      "city": chosenCityprofile,
      "state": chosenstate,
      "locality": areastreet.text,
      "flat_no": fletnumber.text,
      "land_mark": landmark.text.isEmpty ? '' : landmark.text,
      "address": selectedAddressInfo
    };

    print(' add address peram $rawData');

    var response = await dio.post(baseUrl + endpointaddAdrress,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('add address responceData $responseData');

    try {
      if (responseData['status'] == true) {
        // _categoriesList = responseData['data'];
        toggleshemmerdismis();
        await viewadrressApi(context);
        Get.back();
        fname.clear();
        lname.clear();
        mobile.clear();
        pincode.clear();
        fletnumber.clear();
        areastreet.clear();
        landmark.clear();
        _selectedAddressInfo == null;
        notifyListeners();
      } else {
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

  // ------ EDIT UPDATE ADDRESS ------

  Map _addressselectForUpdate = {};
  Map get addressselectForUpdate => _addressselectForUpdate;

  editaddressSelectedperam(context, address) async {
    _addressselectForUpdate = {};
    _addressselectForUpdate = await address;
    print(' edit select adreess $addressselectForUpdate');
    notifyListeners();
    Get.to(() => EditUpdateAddressPage());
  }

  editAddressapi(context) async {
    print('vkkkkkk ${addressselectForUpdate}');
    toggleshemmerShow();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "id": addressselectForUpdate['id'],
      "first_name": fname.text.isNotEmpty
          ? fname.text
          : addressselectForUpdate['first_name'],
      "last_name": lname.text.isNotEmpty
          ? lname.text
          : addressselectForUpdate['last_name'],
      "phone_no": mobile.text.isNotEmpty
          ? mobile.text
          : addressselectForUpdate['phone_no'],
      "pincode": pincode.text.isNotEmpty
          ? pincode.text
          : addressselectForUpdate['pincode'],
      "city": chosenCityprofile ?? addressselectForUpdate['city'],
      "state": chosenstate ?? addressselectForUpdate['state'],
      "locality": areastreet.text.isNotEmpty
          ? areastreet.text
          : addressselectForUpdate['locality'],
      "flat_no": fletnumber.text.isNotEmpty
          ? fletnumber.text
          : addressselectForUpdate['flat_no'],
      "land_mark": landmark.text.isNotEmpty
          ? landmark.text
          : addressselectForUpdate['land_mark'] ?? '',
      "address": selectedAddressInfo == null
          ? selectedAddressInfo
          : addressselectForUpdate['address'],
    };

    print(' edit address peram $rawData');

    var response = await dio.post(baseUrl + endpointeditAdrress,
        options: Options(
          headers: {"authorization": prefs.getString('headerToken')},
        ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('edit address responceData $responseData');

    try {
      if (responseData['status'] == true) {
        // _categoriesList = responseData['data'];

        toggleshemmerdismis();
        await viewadrressApi(context);
        Get.back();
        fname.clear();
        lname.clear();
        mobile.clear();
        pincode.clear();

        fletnumber.clear();

        areastreet.clear();
        landmark.clear();
        _addressselectForUpdate = {};
        _selectedAddressInfo == null;
        notifyListeners();
      } else {
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

// ------- DELETE ADDRESS -------

  dELETEadrressApi(context, iddelete) async {
    print('vkkkk iddelete $iddelete');
    toggleshemmerShow();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "id": iddelete,
      "user_id": prefs.getString('userId'),
    };

    print('delete address peram $rawData');
    var response = await dio.post(baseUrl + endpointdeleteAddress,
        // options: Options(
        //   headers: {"authorization": prefs.getString('headerToken')},
        // ),
        data: rawData);

    final responseData = json.decode(response.toString());
    print('view address list responceData $responseData');

    try {
      if (responseData['success'] == true) {
        notifyListeners();
        Get.back();
        viewadrressApi(context);
        // print('view address list ${addressList}');
        toggleshemmerdismis();
      } else {
        toggleshemmerdismis();
        print(responseData['message']);
      }
    } catch (e) {
      toggleshemmerdismis();
      print('error $e');
    }
  }

// --------------------------- state api -----------------
  resetCityState() {
    _chosenstate = null;
    _chosenCityprofile = null;
    _citydataList = [];
    notifyListeners();
    print('reset city state work');
    print(chosenstate);
    print(chosenCityprofile);
  }

  String? _chosenstate;
  String? get chosenstate => _chosenstate;

  toggleState(value) async {
    _chosenstate = value;
    notifyListeners();

    for (var i = 0; i < listdata.length; i++) {
      if (listdata[i]['name'] == value) {
        print('Using loop: ${listdata[i]}');
        cityFetch(listdata[i]['iso2']);
        notifyListeners();

        return;
      }
    }
  }

  List _stateList = [];
  List get stateList => _stateList;

  List _listdata = [];
  List get listdata => _listdata;

  stateFetch(context) async {
    resetCityState();
    _stateList = [];
    _listdata = [];

    notifyListeners();
    // toggleshemmerShow();

    Dio dio = new Dio();

    var response = await dio.get(
      cityStateApiUrl,
      options: Options(
        headers: {"X-CSCAPI-KEY": cityStateApikey},
      ),
    );

    try {
      _listdata = response.data;

      for (var i = 0; i < listdata.length; i++) {
        _stateList.add(listdata[i]['name']);
        notifyListeners();
      }
      notifyListeners();
      print('cart list fatch stateList $stateList');
    } catch (e) {
      // toggleshemmerdismis();
      print('error $e');
    }
  }

  // --------- city by state ---------------
  String? _chosenCityprofile;
  String? get chosenCityprofile => _chosenCityprofile;

  toggleCity(value) {
    _chosenCityprofile = value;
    notifyListeners();
  }

  List _citydataList = [];
  List get citydataList => _citydataList;
  cityFetch(ios) async {
    _citydataList = [];
    notifyListeners();

    notifyListeners();
    // toggleshemmerShow();

    Dio dio = new Dio();

    var response = await dio.get(
      'https://api.countrystatecity.in/v1/countries/IN/states/$ios/cities',
      options: Options(
        headers: {
          "X-CSCAPI-KEY":
              "dUdVUFc5R21XZmJZR3QyQUNFQkFWbTBDMHBNQUFRQ0FwZTNWMUdveg=="
        },
      ),
    );

    try {
      var listdata = response.data;
      print('city listdata $listdata');

      for (var i = 0; i < listdata.length; i++) {
        _citydataList.add(listdata[i]['name']);
        notifyListeners();
      }
      _chosenCityprofile = listdata[0]['name'];
      notifyListeners();
      print('cart list fatch city $citydataList');
    } catch (e) {
      // toggleshemmerdismis();
      print('error $e');
    }
  }
}
