// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:eventneedz/bottom%20nav%20bar/profile/1%20My%20Profile/myprofile_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/address/add%20address%20page/addnewaddress_modelpage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'addaddress_widgetpage.dart';

class AddAddressPage extends StatefulWidget {
  AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final GlobalKey<FormState> formkeyaddress = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Provider.of<AddNewAddressModelPage>(context, listen: false)
          .resetCityState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewAddressModelPage>(builder: (context, model, _) {
      final modelprofileview =
          Provider.of<MyProfileModelPage>(context, listen: false);
      return Scaffold(
        backgroundColor: colorgreylight,
        appBar: apponlytitle(context, 'Address'),
        body: Container(
          // color: Colors.amber,
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                            firstname(context, model, modelprofileview),
                            lasttname(context, model, modelprofileview),
                          ],
                        ),
                        sizedboxheight(10.0),
                        mobilenom(context, model, modelprofileview)
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
                        Form(
                          key: formkeyaddress,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  statename(context, model),
                                  city(context, model),
                                ],
                              ),
                              sizedboxheight(10.0),
                              pincode(context, model),
                              sizedboxheight(10.0),
                              fletnumber(context, model),
                              sizedboxheight(10.0),
                              areastreet(context, model),
                              sizedboxheight(10.0),
                            ],
                          ),
                        ),
                        landmark(context, model),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\t\tAddress Info'),
                        addressradio(context, model, modelprofileview),
                        addressChakebox(context, model)
                      ],
                    ),
                  ),
                ),
                sizedboxheight(10.0),
                addcardBtn(context, model, modelprofileview, formkeyaddress),
                sizedboxheight(100.0),
              ],
            ),
          ),
        ),
      );
    });
  }
}
