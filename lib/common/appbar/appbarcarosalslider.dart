// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlistpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/mycart/mycartpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Widget appbarcarosolslider() {
  return Padding(
      padding: EdgeInsets.only(top: 5, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: colorpinklight,
            ),
            height: 30,
            width: 30,
            child: Center(
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: colorWhite,
                  )),
            ),
          ),
          Row(
            children: [
              //             Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     color: Colors.white.withOpacity(0.6),
              //   ),
              //   height: 30,
              //   width: 30,
              //   child: Center(
              //     child: InkWell(
              //         onTap: () {
              //           Get.back();
              //         },
              //         child: Icon(       Icons.share,size: 18,
              //           color: Colors.white,)),
              //   ),
              // ),
              sizedboxwidth(6.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: colorpinklight,
                ),
                height: 30,
                width: 30,
                child: Center(
                  child: InkWell(
                      onTap: () {
                        Get.to(() => WishlistPage());
                      },
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 20,
                      )),
                ),
              ),
              sizedboxwidth(6.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: colorpinklight,
                ),
                height: 30,
                width: 30,
                child: Center(
                  child: InkWell(
                      onTap: () {
                        Get.to(() => MyCart());
                      },
                      child: Icon(
                        Icons.shopping_cart_rounded,
                        size: 18,
                        color: colorWhite,
                      )),
                ),
              ),
            ],
          )
        ],
      ));
}
