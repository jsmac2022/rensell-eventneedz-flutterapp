// ignore_for_file: prefer_final_fields, unnecessary_new, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'checkboxmodel.dart';

class FilterModelPage extends ChangeNotifier {
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

  // --------
  int _showFilterValues = 0;
  int get showFilterValues => _showFilterValues;

  filterbtnkeyTap(index) {
    _showFilterValues = index;
    notifyListeners();
  }

  List filterkeybtnname = [
    'Price',
    'Customer Ratings',
    // 'Offers',
    'Discount',
    // 'Budget',
    'Availability'
  ];

  // price value get
  List<MultiselectCheckbox> filterpriceValues = [
    MultiselectCheckbox(
        title: 'Rs.1000 and Below', value: "'0' and '1000'", isSelect: false),
    MultiselectCheckbox(
        title: 'Rs.1001 - Rs.2000',
        value: "'1001' and '2000'",
        isSelect: false),
    MultiselectCheckbox(
        title: 'Rs.2001 - Rs.3000',
        value: "'2001' and '3000'",
        isSelect: false),
    MultiselectCheckbox(
        title: 'Rs.3001 - Rs.4000',
        value: "'3001' and '4000'",
        isSelect: false),
    MultiselectCheckbox(
        title: 'Rs.4001 - Rs.5000',
        value: "'4001' and '5000'",
        isSelect: false),
    MultiselectCheckbox(
        title: 'Rs.5001 - Rs.6000',
        value: "'5001' and '6000'",
        isSelect: false),
    MultiselectCheckbox(
        title: 'Rs.6001 - Rs.7000',
        value: "'6001' and '7000'",
        isSelect: false),
    MultiselectCheckbox(
        title: 'Rs.7001 - Rs.8000',
        value: "'7001' and '8000'",
        isSelect: false),
    MultiselectCheckbox(
        title: 'Rs.8001 - Rs.9000',
        value: "'8001' and '9000'",
        isSelect: false),
    MultiselectCheckbox(
        title: 'Rs.9001 - Rs.10000',
        value: "'9001' and '10000'",
        isSelect: false),
  ];
  List selectmulti = [];

  toggleCheckboxprice(index) async {
    filterpriceValues[index].isSelect = !filterpriceValues[index].isSelect;
    notifyListeners();
    if (filterpriceValues[index].isSelect == true) {
      selectmulti.add(filterpriceValues[index].value);
      notifyListeners();
    } else {
      selectmulti.remove(filterpriceValues[index].value);
      notifyListeners();
    }
    await filterdatafatch();
  }

  //filter custumer ratings
  List<MultiselectCheckbox> filtercusRValues = [
    MultiselectCheckbox(title: '4 ★ and Above ', value: 4, isSelect: false),
    MultiselectCheckbox(title: '3 ★ and Above ', value: 3, isSelect: false),
    MultiselectCheckbox(title: '2 ★ and Above ', value: 2, isSelect: false),
    MultiselectCheckbox(title: '1 ★ and Above ', value: 1, isSelect: false),
  ];
  List selectmultiCustomerR = [];

  toggleCheckboxcustomerRating(index) async {
    filtercusRValues[index].isSelect = !filtercusRValues[index].isSelect;
    notifyListeners();
    if (filtercusRValues[index].isSelect == true) {
      selectmultiCustomerR.add(filtercusRValues[index].value);
      notifyListeners();
    } else {
      selectmultiCustomerR.remove(filtercusRValues[index].value);
      notifyListeners();
    }
    await filterdatafatch();
  }

  //offers
  // List<MultiselectCheckbox> filterOfferRValues = [
  //   MultiselectCheckbox(
  //       title: 'Buy More, Save More',
  //       value: 'Buy More, Save More',
  //       isSelect: false),
  //   MultiselectCheckbox(
  //       title: 'Exchange Offer', value: 'Exchange Offer', isSelect: false),
  //   MultiselectCheckbox(
  //       title: 'No Cost EMI', value: 'No Cost EMI', isSelect: false),
  //   MultiselectCheckbox(
  //       title: 'Special Price', value: 'Special Price', isSelect: false),
  // ];
  // List selectmultiOffer = [];

  // toggleCheckboxOffer(index) async {
  //   filterOfferRValues[index].isSelect = !filterOfferRValues[index].isSelect;
  //   notifyListeners();
  //   if (filterOfferRValues[index].isSelect == true) {
  //     selectmultiOffer.add(filterOfferRValues[index].value);
  //     notifyListeners();
  //   } else {
  //     selectmultiOffer.remove(filterOfferRValues[index].value);
  //     notifyListeners();
  //   }
  //   await filterdatafatch();
  // }

  //discount
  List<MultiselectCheckbox> filterdiscountValues = [
    MultiselectCheckbox(
      title: '10% or more',
      value: "10",
      isSelect: false,
    ),
    MultiselectCheckbox(title: '20% or more', value: "20", isSelect: false),
    MultiselectCheckbox(title: '30% or more', value: "30", isSelect: false),
    MultiselectCheckbox(title: '40% or more', value: "40", isSelect: false),
    MultiselectCheckbox(title: '50% or more', value: "50", isSelect: false),
    MultiselectCheckbox(title: '60% or more', value: "60", isSelect: false),
    MultiselectCheckbox(title: '70% or more', value: "70", isSelect: false),
    MultiselectCheckbox(title: '80% or more', value: "80", isSelect: false),
  ];
  List selectmultidiscount = [];

  toggleCheckboxdiscount(index) async {
    filterdiscountValues[index].isSelect =
        !filterdiscountValues[index].isSelect;
    notifyListeners();
    if (filterdiscountValues[index].isSelect == true) {
      selectmultidiscount.add(filterdiscountValues[index].value);
      notifyListeners();
    } else {
      selectmultidiscount.remove(filterdiscountValues[index].value);
      notifyListeners();
    }
    await filterdatafatch();
  }

  //budget
  // List<MultiselectCheckbox> filterbudgetValues = [
  //   MultiselectCheckbox(
  //       title: 'Rs.1000 and Below', value: '0-1000', isSelect: false),
  //   MultiselectCheckbox(
  //       title: 'Rs.1001 - Rs.2000', value: '1001-2000', isSelect: false),
  //   MultiselectCheckbox(
  //       title: 'Rs.2001 - Rs.3000', value: '2001-3000', isSelect: false),
  //   MultiselectCheckbox(
  //       title: 'Rs.3001 - Rs.4000', value: '3001-4000', isSelect: false),
  //   MultiselectCheckbox(
  //       title: 'Rs.4001 - Rs.5000', value: '4001-5000', isSelect: false),
  //   MultiselectCheckbox(
  //       title: 'Rs.5001 - Rs.6000', value: '5001-6000', isSelect: false),
  //   MultiselectCheckbox(
  //       title: 'Rs.6001 - Rs.7000', value: '6001-7000', isSelect: false),
  //   MultiselectCheckbox(
  //       title: 'Rs.7001 - Rs.8000', value: '7001-8000', isSelect: false),
  //   MultiselectCheckbox(
  //       title: 'Rs.8001 - Rs.9000', value: '8001-9000', isSelect: false),
  //   MultiselectCheckbox(
  //       title: 'Rs.9001 - Rs.10000', value: '9001-10000', isSelect: false),
  // ];
  // List selectmultibudget = [];

  // toggleCheckboxbudget(index) async {
  //   filterbudgetValues[index].isSelect = !filterbudgetValues[index].isSelect;
  //   notifyListeners();
  //   if (filterbudgetValues[index].isSelect == true) {
  //     selectmultibudget.add(filterbudgetValues[index].value);
  //     notifyListeners();
  //   } else {
  //     selectmultibudget.remove(filterbudgetValues[index].value);
  //     notifyListeners();
  //   }
  //   await filterdatafatch();
  // }

  //aviailability
  List<MultiselectCheckbox> filteravailabilityValues = [
    MultiselectCheckbox(
        title: 'Include our of Stock',
        value: 'Include our of Stock',
        isSelect: false),
  ];
  List selectmultiavailability = [];

  toggleCheckboxavailability(index) async {
    filteravailabilityValues[index].isSelect =
        !filteravailabilityValues[index].isSelect;
    notifyListeners();
    if (filteravailabilityValues[index].isSelect == true) {
      selectmultiavailability.add(filteravailabilityValues[index].value);
      notifyListeners();
    } else {
      selectmultiavailability.remove(filteravailabilityValues[index].value);
      notifyListeners();
    }
    await filterdatafatch();
  }

  // ---------- FILTERS DATA API ----------

  List _filterProdctlist = [];
  List get filterProdctlist => _filterProdctlist;

  filterdatafatch() async {
    toggleshemmerShow();
    Dio dio = new Dio();

    Map<String, dynamic> rawData = {
      "priceFilter": selectmulti,
      "discountFilters": selectmultidiscount,
      "rating": selectmultiCustomerR
    };
    print('filter api perams $rawData');

    var response = await dio.post(baseUrl + endpointfilterproduct,
        // options: Options(
        //   headers: {"authorization": prefs.getString('headerToken')},
        // ),
        data: rawData);

    final responseData = json.decode(response.toString());
    // print('appdemovideofatch responceData $responseData');

    try {
      if (responseData['status'] == true) {
        _filterProdctlist = await responseData['data'];
        // await genrateThumbnil();
        print('filterd List ${filterProdctlist.length}');
        notifyListeners();
        print('filterd list length ${filterProdctlist.length}');
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

  // ----- CLEAR ALL BTN ------
  clearAllfilter() async {
    _showFilterValues = 0;
    _filterProdctlist = [];
    selectmulti = [];
    selectmultidiscount = [];
    selectmultiCustomerR = [];
    await resetCheckbox(filterpriceValues);
    await resetCheckbox(filtercusRValues);
    await resetCheckbox(filterdiscountValues);
    await resetCheckbox(filteravailabilityValues);

    notifyListeners();
  }

  // --- reset all button ----

  resetCheckbox(list) {
    for (var i = 0; i < list.length; i++) {
      list[i].isSelect = false;
      notifyListeners();
    }
  }
}
