// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:eventneedz/auth/selectcatagery.dart';
import 'package:eventneedz/bottom%20nav%20bar/dashboard/dashboardrental.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/address/add%20address%20page/addaddress_page.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbar.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbar_modelpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'appbarwidgetpage.dart';

// app bar white background, black back btn, center title black
AppBar appbartitlebackbtn(context, title) {
  return AppBar(
    leading: backbtnblackappbar(),
    title: Text(
      title,
      style: textstyleHeading6(context),
    ),
  );
}

//pink background, action fav - notification
AppBar appbarnotifav(context, title) {
  return AppBar(
    elevation: 5,
    backgroundColor: colorredlightbtn,
    leading: backbtnblackappbar(),
    title: Text(
      title,
      style: textstyleHeading6(context)!.copyWith(color: colorWhite),
    ),
    actions: [
      favactionWidget(context),
      notificationactionWidget(context),
    ],
  );
}

//back btn, pink background, left title, search - favorite -cart action
AppBar appbarSearchFavCart(context, title) {
  return AppBar(
    elevation: 5,
    leadingWidth: 30,
    centerTitle: false,
    backgroundColor: colorredlightbtn,
    leading: backbtnappbarWhite(context, title),
    title: Text(
      title,
      style: textstyleHeading6(context)!.copyWith(color: colorWhite),
    ),
    actions: [
      appbSearchWidget(),
      title == 'My Favorites' ? Container() : favactionWidget(context),
      title == 'My Profile' ? Container() : appbCartWidget(context),
    ],
  );
}

// app bar red background, white back btn, left title white
AppBar apponlytitle(context, title) {
  return AppBar(
    elevation: 5,
    leadingWidth: 30,
    backgroundColor: colorredlightbtn,
    centerTitle: false,
    leading: backbtnappbarWhite(context, title),
    title: Text(
      title,
      style: textstyleHeading6(context)!.copyWith(color: colorWhite),
    ),
    actions: [
      TextButton(
          onPressed: () async {
            await Provider.of<BottomnavbarModelPage>(context, listen: false)
                .togglebottomindexreset();
            Get.to(() => BottomNavBarPage());

            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => BottomNavBarPage()),
            //     (Route<dynamic> route) => route is BottomNavBarPage);
          },
          child: Text(
            "Continue to Shopping ",
            style: textstyleHeading6(context)!.copyWith(color: colorWhite),
          ))
    ],
  );
}

AppBar apponlytitle1(context, title) {
  return AppBar(
    elevation: 5,
    leadingWidth: 30,
    backgroundColor: colorredlightbtn,
    centerTitle: false,
    leading: backbtnappbarWhite(context, title),
    title: Text(
      title,
      style: textstyleHeading6(context)!.copyWith(color: colorWhite),
    ),
    // actions: [
    //   TextButton(
    //       onPressed: () {
    //         Get.to(() => DashboardPageRental());
    //       },
    //       child: Text(
    //         "Continue to Shopping ",
    //         style: textstyleHeading6(context)!.copyWith(color: colorWhite),
    //       ))
    // ],

  );
}

// app bar red background, white back btn, left title white
AppBar apponlyReviewProduct(context, title) {
  return AppBar(
    elevation: 5,
    leadingWidth: 36,
    backgroundColor: colorredlightbtn,
    centerTitle: false,
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Icons.clear,
        color: colorWhite,
        size: 25,
      ),
    ),
    title: Text(
      title,
      style: textstyleHeading6(context)!.copyWith(color: colorWhite),
    ),
  );
}

// app bar pink background, white back btn, left title white, add address action btn
AppBar apponlytitledreess(context, title) {
  return AppBar(
    elevation: 5,
    leadingWidth: 30,
    backgroundColor: colorredlightbtn,
    centerTitle: false,
    leading: backbtnappbarWhite(context, title),
    title: Text(
      title,
      style: textstyleHeading6(context)!.copyWith(color: colorWhite),
    ),
    actions: [
      TextButton(
          onPressed: () {
            Get.to(() => AddAddressPage());
          },
          child: Text(
            '+ Add Address',
            style: textstyleHeading6(context)!
                .copyWith(color: colorWhite, fontSize: 17),
          ))
    ],
  );
}

//appbar white background, back black btn, center title
AppBar appbartitlebackbtnfilter(context, title) {
  return AppBar(
    leading: backbtnblackappbar(),
    elevation: 4,
    centerTitle: false,
    titleSpacing: 0,
    title: appbartitlewidget(title, context),
    actions: [
      title == 'Filters' ? filterClearAllbtn(context) : Container(),
      sizedboxwidth(10.0)
    ],
  );
}
