// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'add address page/addaddress_page.dart';

Widget addnewaddressBtn(context) {
  return Button(
    borderRadius: BorderRadius.circular(1.0),
    btnColor: colorWhite,
    textColor: colorpinklight,
    borderColor: colorpinklight,
    btnWidth: deviceWidth(context, 0.65),
    btnfontsize: 16,
    buttonName: '+ ADD NEW ADDRESS',
    key: Key('login_submi'),
    onPressed: () {
      Get.to(() => AddAddressPage());
    },
  );
}

Future addadressBotomsheet(context) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: colorWhite,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/locetionlogo.png',
                        scale: 1.5,
                      ),
                      sizedboxheight(20.0),
                      Text(
                        'You have no addresses',
                        style: textstyleHeading6(context),
                      ),
                      sizedboxheight(8.0),
                      Text(
                        'Add an addresses for faster checkout experience',
                        textAlign: TextAlign.center,
                        style: textstylesubtitle1(context),
                      ),
                      sizedboxheight(20.0),
                      addnewcardBtnbotamsheet(context),
                      sizedboxheight(46.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

Widget addnewcardBtnbotamsheet(context) {
  return Button(
    borderRadius: BorderRadius.circular(5.0),
    btnWidth: deviceWidth(context, 0.9),
    buttonName: '+ ADD NEW ADDRESS',
    key: Key('ADD NEW ADDRESS'),
    onPressed: () {
      Navigator.pop(context);
      Get.to(() => AddAddressPage());
    },
  );
}
