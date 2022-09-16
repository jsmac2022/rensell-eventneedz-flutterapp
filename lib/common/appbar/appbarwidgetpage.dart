// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:eventneedz/bottom%20nav%20bar/Categories/fillter/filtermodelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlistpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/mycart/mycartpage.dart';
import 'package:eventneedz/common/appbar/appbarmodelpage.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbar_modelpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:eventneedz/search%20filter/search_universal_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

Text appbartitlewidget(title, context) {
  return Text(
    title,
    style: textstyleHeading6(context),
  );
}

Widget filterClearAllbtn(context) {
  return TextButton(
      onPressed: () {
        final fmodel = Provider.of<FilterModelPage>(context, listen: false);
        fmodel.clearAllfilter();
      },
      child: Text(
        'Clear All',
        style: TextStyle(fontSize: 16),
      ));
}

IconButton backbtnblackappbar() => IconButton(
    onPressed: () {
      Get.back();
    },
    icon: Icon(Icons.arrow_back));

IconButton backbtnappbarWhite(context, title) => IconButton(
    onPressed: () {
      print('vkkk $title');
      if (title == 'All Categories' ||
          title == 'My Profile' ||
          title == 'App Demo') {
        Provider.of<BottomnavbarModelPage>(context, listen: false)
            .togglebottomindexreset();
      } else {
        Get.back();
      }
    },
    icon: Icon(
      Icons.arrow_back,
      color: colorWhite,
    ));

Widget notificationactionWidget(context) {
  var appbarmodal = Provider.of<AppbarmodalPage>(context, listen: false);
  return Row(
    children: [
      InkWell(
        onTap: () async {
          //  await appbarmodal.counterreset();
          // Get.to(() => NotificationPage());
        },
        child: SizedBox(
          width: 35,
          height: 35,
          child: Stack(
            children: <Widget>[
              Center(
                child: Icon(
                  Icons.notifications,
                  color: colorWhite,
                  size: 23,
                ),
              ),
              appbarmodal.counter != 0
                  ? Positioned(
                      top: 2,
                      right: 5,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Center(
                          child: Text(
                            '${appbarmodal.counter}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    ],
  );
}

Widget favactionWidget(context) {
  // final appbarmodal = Provider.of<AppbarmodalPage>(context, listen: false);
  return Row(
    children: [
      InkWell(
        onTap: () async {
          //  await appbarmodal.counterreset();
          Get.to(() => WishlistPage());
        },
        child: SizedBox(
          width: 35,
          height: 35,
          child: Stack(
            children: <Widget>[
              Center(
                child: Icon(
                  Icons.favorite,
                  color: colorWhite,
                  size: 23,
                ),
              ),
              // appbarmodal.counter != 0
              //     ? Positioned(
              //         top: 2,
              //         right: 2,
              //         child: Container(
              //           padding: EdgeInsets.all(2),
              //           decoration: BoxDecoration(
              //             color: Colors.black,
              //             borderRadius: BorderRadius.circular(6),
              //           ),
              //           constraints: BoxConstraints(
              //             minWidth: 14,
              //             minHeight: 14,
              //           ),
              //           child: Center(
              //             child: Text(
              //               '${appbarmodal.counter}',
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 9,
              //               ),
              //               textAlign: TextAlign.center,
              //             ),
              //           ),
              //         ),
              //       )
              //     : Container()
            ],
          ),
        ),
      ),
    ],
  );
}

Widget appbCartWidget(context) {
  // var appbarmodal = Provider.of<AppbarmodalPage>(context, listen: false);
  return Row(
    children: [
      InkWell(
        onTap: () async {
          //  await appbarmodal.counterreset();
          Get.to(() => MyCart());
        },
        child: SizedBox(
          width: 35,
          height: 35,
          child: Stack(
            children: <Widget>[
              Center(
                child: Icon(
                  Icons.shopping_cart_rounded,
                  color: colorWhite,
                  size: 23,
                ),
              ),
              // appbarmodal.counter != 0
              //     ? Positioned(
              //         top: 2,
              //         right: 2,
              //         child: Container(
              //           padding: EdgeInsets.all(2),
              //           decoration: BoxDecoration(
              //             color: Colors.black,
              //             borderRadius: BorderRadius.circular(6),
              //           ),
              //           constraints: BoxConstraints(
              //             minWidth: 14,
              //             minHeight: 14,
              //           ),
              //           child: Center(
              //             child: Text(
              //               '${appbarmodal.counter}',
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 9,
              //               ),
              //               textAlign: TextAlign.center,
              //             ),
              //           ),
              //         ),
              //       )
              //     : Container()
            ],
          ),
        ),
      ),
    ],
  );
}

Widget appbSearchWidget() {
  return InkWell(
    onTap: () {
      Get.to(() => SearchUniversalPage());
    },
    child: Icon(
      Icons.search,
      color: colorWhite,
      size: 23,
    ),
  );
}
