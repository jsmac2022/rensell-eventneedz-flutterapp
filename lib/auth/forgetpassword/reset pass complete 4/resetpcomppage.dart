


// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/auth/forgetpassword/enter%20email%201/forgetpasswidgetpage.dart';
import 'package:eventneedz/auth/login%20sinup/loginsinguppage.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ResetPCompPage extends StatelessWidget {
  const ResetPCompPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
     
      body: Container(
        width: deviceWidth(context, 1.0),
        height: deviceheight(context, 1.0),
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: SingleChildScrollView(
             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      sizedboxheight(deviceheight(context, 0.2)),
                imagetitlesubtitlewidget(context,'assets/images/rpass.png', 'Completed',"Great!","", "") ,
                  sizedboxheight(20.0),
                  justsigninbtn(context),
                      sizedboxheight(20.0),
                ],),
        ),
      ),
      ),
    );
  }
  Widget justsigninbtn(context) {
  return Button(
      buttonName: 'Just Sign In',
      btnColor: colorWhite,textColor: colorredlightbtn,
      borderColor: colorredlightbtn,btnWidth: deviceWidth(context, 0.5),
      key: Key('forget_submit'),
      onPressed: () {
         
         Get.to(() =>LoginPageSignupPage());
     
      
 
      });
}
}