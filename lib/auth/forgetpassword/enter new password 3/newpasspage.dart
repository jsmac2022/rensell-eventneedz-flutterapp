// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/auth/forgetpassword/enter%20email%201/forgetpasswidgetpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'newpassmodelpage.dart';
import 'newpasswidgetpage.dart';

class NewPassPage extends StatelessWidget {
  NewPassPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
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
            child: Consumer<NewPassModelPage>(builder: (context, model, _) {
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sizedboxheight(deviceheight(context, 0.1)),
                    InkWell(
                        onTap: () {
                          model.userid();
                        },
                        child: imagetitlesubtitlewidget(context, 'assets/images/picnewpass.png', 'Reset Password?',
                            "Nice", "You have to create new password here!", "")),
                    sizedboxheight(40.0),
                    newPasswordwidget(model),
                    sizedboxheight(20.0),
                    confirmPasswordwidget(model),
                    sizedboxheight(40.0),
                    newpasssavebtn(context, model, formKey),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
