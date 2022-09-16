// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/formtextfield/mytextfield.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';

var confirmPass;

Widget newPasswordwidget(model) {
  return AllInputDesign(
    key: Key("cpassword"),
    inputHeaderName: 'Password *',
    enabledBorderRadius: borderRadiuscircular(20.0),
    obsecureText: model.obscuretext1,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    textInputAction: TextInputAction.next,
    controller: model.newPassword,
    suffixIcon: GestureDetector(
      key: Key('password_visibility'),
      child: Icon(Icons.visibility,
          size: 20.0,
          color: !model.obscuretext1 ? colorredlightbtn : Colors.black45),
      onTap: () {
        model.toggle1();
      },
    ),
    validatorFieldValue: 'password',
    validator: (value) {
      confirmPass = value;
      if (value.isEmpty) {
        return "Please Enter New Password";
      } else if (value.length < 6) {
        return "Password must be atleast 6 characters long";
      } else {
        return null;
      }
    },
    keyBoardType: TextInputType.emailAddress,
  );
}

Widget confirmPasswordwidget(model) {
  return AllInputDesign(
    key: Key("cnpassword"),
    inputHeaderName: 'Confirm Password *',
    enabledBorderRadius: borderRadiuscircular(20.0),
    obsecureText: model.obscuretext2,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    textInputAction: TextInputAction.done,
    controller: model.cnfPassword,
    suffixIcon: GestureDetector(
      key: Key('password_visibility'),
      child: Icon(Icons.visibility,
          size: 20.0,
          color:  !model.obscuretext2 ? colorredlightbtn : Colors.black45),
      onTap: () {
        model.toggle2();
      },
    ),
    validatorFieldValue: 'password',
    validator: (value) {
      if (value.isEmpty) {
        return "Please Re-Enter New Password";
      } else if (value.length < 6) {
        return "Password must be atleast 6 characters long";
      } else if (value != confirmPass) {
        return "Password must be same as above";
      } else {
        return null;
      }
    },
    keyBoardType: TextInputType.emailAddress,
  );
}

Widget newpasssavebtn(context, model,formKey) {
  return Button(
       isLoading:model.isShimmer,
    buttonNameloading:'Reset Password',   
      key: Key('forget_submit'),
      onPressed: () async{
        if (formKey.currentState.validate()) {
     await      model.changepasswordsubmit(context);
         
        } else {
          model.toggleautovalidate();
        }
      });
}
