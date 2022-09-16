// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:eventneedz/bottom%20nav%20bar/profile/address/add%20address%20page/addnewaddress_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/address/edit%20address/editaddress_widgetpage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditUpdateAddressPage extends StatelessWidget {
  EditUpdateAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewAddressModelPage>(builder: (context, model, _) {
      return Scaffold(
        backgroundColor: colorgreylight,
        appBar: apponlytitle(context, 'Address'),
        body: SizedBox(
          width: deviceWidth(context, 1.0),
          height: deviceheight(context, 1.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                sizedboxheight(10.0),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Contact Info'),
                        sizedboxheight(10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            firstnameUpdate(context, model),
                            lasttnameUpdate(context, model),
                          ],
                        ),
                        sizedboxheight(10.0),
                        mobilenomUpdate(context, model)
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Address Info'),
                        sizedboxheight(10.0),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                statenameUpdate(context, model),
                                cityUpdate(context, model),
                              ],
                            ),
                            sizedboxheight(10.0),
                            pincodeUpdate(context, model),
                            sizedboxheight(10.0),
                            fletnumberUpdate(context, model),
                            sizedboxheight(10.0),
                            areastreetUpdate(context, model),
                            sizedboxheight(10.0),
                          ],
                        ),
                        landmarkUpdate(context, model),
                      ],
                    ),
                  ),
                ),
                sizedboxheight(10.0),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\t\tAddress Info'),
                        addressradioUpdate(context, model),
                        addressChakeboxUpdate(context, model)
                      ],
                    ),
                  ),
                ),
                sizedboxheight(10.0),
                addcardBtnUpdate(context, model),
                sizedboxheight(100.0),
              ],
            ),
          ),
        ),
      );
    });
  }
}
