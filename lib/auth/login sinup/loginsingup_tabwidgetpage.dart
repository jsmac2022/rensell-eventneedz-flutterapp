// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'login/loginwidgetpage.dart';
import 'signup/signupwidgetpage.dart';

Widget tabbarloginsignup(context,model,formkeyLogin) {
  return DefaultTabController(
    length: 2,
    child: Column(
      children: [
        TabBar(
          controller: model.tabController,
          isScrollable: false,
          indicatorColor: colorblack,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            SizedBox(
                width: deviceWidth(context, 0.2),
                child: Center(
                    child: Text(
                 'LOGIN',
                  style: textstyleHeading3(context)!.copyWith(fontWeight: fontWeight900),
                ))),
            SizedBox(
                width: deviceWidth(context, 0.38),
                child: Center(
                    child: Text(
                 'SIGNUP',
                  style: textstyleHeading3(context)!.copyWith(fontWeight: fontWeight900),
                ))),
          ],
          
          onTap: (value) async {

            print('vinay111 ${model.tabController.toString()}');
            model.toggelappbartitle(value);
    
    
          },
        ),
        Container(
          
          height: deviceheight(context, 0.6),
          child: TabBarView(
               controller: model.tabController,
                physics: NeverScrollableScrollPhysics(),
            children: [
            
            loginChildrens(context,formkeyLogin),
            signupChildrens(context),
    
      
          ]),
        ),
      ],
    ),
  );
}
