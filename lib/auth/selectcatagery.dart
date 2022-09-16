// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/common/bottomnavbar/bottomnavbar.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbar_modelpage.dart';
import 'package:eventneedz/common/commonwidgets/commonwidgets.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectCategry extends StatelessWidget {
  const SelectCategry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomnavbarModelPage>(builder: (context, model, _) {
      return WillPopScope(
        onWillPop: () {
          return onWillPop(context);
        },
        child: Scaffold(
          backgroundColor: colorredlightbtn,
          body: SizedBox(
            width: deviceWidth(context, 1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedboxheight(deviceheight(context, 0.2)),
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: borderRadiuscircular(80.0)),
                  child: Image(image: AssetImage('assets/icons/loginlogo.png')),
                ),
                sizedboxheight(deviceheight(context, 0.1)),
                catbtn(context, 'Event Rentals', 'Rent Any Item',
                    BottomNavBarPage(), "RENT"),
                sizedboxheight(deviceheight(context, 0.06)),
                catbtn(context, 'Event Sales', 'Buy Event Material',
                    BottomNavBarPage(), "SALE"),
              ],
            ),
          ),
        ),
      );
    });
  }

  Container catbtn(BuildContext context, title, subtitle, ontap, apptypeChose) {
    return Container(
      width: deviceWidth(context, 0.7),
      height: 55,
      decoration: BoxDecoration(
          color: colorWhite, borderRadius: borderRadiuscircular(20.0)),
      child: MaterialButton(
        onPressed: () async {
          Provider.of<BottomnavbarModelPage>(context, listen: false)
              .togglebottomindexreset();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(
            'apptypeChose',
            apptypeChose,
          );

          Get.offAll(ontap);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: textstyleHeading2(context)!.copyWith(fontSize: 20),
            ),
            Text(
              subtitle,
              style: TextStyle(
                  color: colorgrey, fontStyle: FontStyle.italic, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
