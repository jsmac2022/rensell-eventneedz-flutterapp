// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/auth/login%20sinup/loginsinguppage.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/2%20editprofile/editprofile_page.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/shimmereffect.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget profileheader(context, model) {
  return Container(
    color: colorWhite,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: model.isShimmer || model.profileviewList.isEmpty
          ? shimmersmall()
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: colorpinklight,
                  child: model.profileviewList[0]['Customer']['lastName'] == ''|| model.profileviewList[0]['Customer']['lastName'] == null
                      ? Text(
                          model.profileviewList[0]['Customer']['firstName'][0],
                          style: textstyleHeading2(context)!.copyWith(color: colorgrey),
                        )
                      : Text(
                          '${model.profileviewList[0]['Customer']['firstName'][0].toString()}${model.profileviewList[0]['Customer']['lastName'][0]}',
                          style: textstyleHeading2(context)!.copyWith(color: colorgrey),
                        ),
                ),
                sizedboxwidth(10.0),
                SizedBox(
                  width: deviceWidth(context, 0.7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${model.profileviewList[0]['Customer']['firstName'].toString()}\t${model.profileviewList[0]['Customer']['lastName'].toString()}',
                            style: textstyleHeading6(context),
                          ),
                          sizedboxheight(6.0),
                          Text(
                            model.profileviewList[0]['Customer']['email'].toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                          sizedboxheight(6.0),
                          Text(model.profileviewList[0]['Customer']['mobile'].toString()),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => EditProfilePage());
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(color: colorpinklight),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    ),
  );
}

Widget profileListtile(context, image, titel, page) {
  return ListTile(
    tileColor: colorWhite,
    dense: true,
    minLeadingWidth: 5,
    onTap: () {
      Get.to(page);
    },
    leading: Image.asset(image),
    title: Text(titel),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      size: 17,
    ),
  );
}

Widget pListtileLeadingTrailing(titel, context, page) {
  return ListTile(
    onTap: () {
      Get.to(page);
    },
    tileColor: colorWhite,
    dense: true,
    title: Text(titel),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      size: 17,
    ),
  );
}

Widget logOutBtn(context) {
  return Button(
    borderColor: colorpinklight,
    btnColor: colorWhite,
    buttonName: 'LOGOUT',
    textColor: colorpinklight,
    btnWidth: deviceWidth(context, 0.9),
    key: Key('log out'),
    borderRadius: borderRadiuscircular(1.1),
    onPressed: () {
      Get.offAll(() => LoginPageSignupPage());
    },
  );
}
