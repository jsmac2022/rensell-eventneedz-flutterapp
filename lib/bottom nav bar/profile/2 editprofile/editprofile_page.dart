// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/bottom%20nav%20bar/profile/1%20My%20Profile/myprofile_modelpage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'editprofile_widgetpage.dart';
import 'editprofile_modelpage.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> formkeychngpass = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final dbmodel = Provider.of<EditProfileModel>(context, listen: false);
      dbmodel.gendervalueInitialize(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelprofileview =
        Provider.of<MyProfileModelPage>(context, listen: false);
    bool socialSignin = modelprofileview.profileviewList[0]['Customer']
            ['logintype'] ==
        'GOOGLE';
    return Consumer<EditProfileModel>(builder: (context, model, _) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: apponlytitle(context, 'Profile Details'),
          backgroundColor: colorgreylight,
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                sizedboxheight(10.0),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        firstname(context, model, modelprofileview),
                        sizedboxheight(10.0),
                        lasttname(context, model, modelprofileview),
                        sizedboxheight(10.0),
                        // username(context),
                        // sizedboxheight(10.0),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        emailnamaddress(context, modelprofileview),
                        sizedboxheight(10.0),
                        socialSignin
                            ? Container()
                            : passeword(context, model, formkeychngpass),
                        socialSignin ? Container() : sizedboxheight(10.0),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        dobeditwidget(context, model, modelprofileview),
                        sizedboxheight(10.0),
                        gendercard(context, model, modelprofileview),
                        phonnum(context, modelprofileview, model),
                        sizedboxheight(10.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            width: deviceWidth(context, 1.0),
            color: colorWhite,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  resetbut(context, model),
                  update(context, model),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
