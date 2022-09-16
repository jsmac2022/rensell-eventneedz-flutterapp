// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:eventneedz/common/formtextfield/mytextfield.dart';
import 'package:eventneedz/common/formtextfield/validations_field.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imagetitlesubtitlewidget(
    context, asset, title1, title2, title3, title4) {
  return Column(
    children: [
      Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: colorgreylight, borderRadius: borderRadiuscircular(75.0)),
        child: Image(
          image: AssetImage(asset),
          fit: BoxFit.fill,
        ),
      ),
      sizedboxheight(12.0),
      Text(
        title1,
        textAlign: TextAlign.center,
        style: textstyleHeading3(context),
      ),
      sizedboxheight(8.0),
      Text(
        title2,
        style: textstyleHeading3(context)!.copyWith(fontSize: 14),
      ),
      sizedboxheight(12.0),
      Text(
        title3,
        textAlign: TextAlign.center,
        style: textstyleHeading6(context),
      ),
      sizedboxheight(12.0),
      Text(
        title4,
        textAlign: TextAlign.center,
        style: textstylesubtitle2(context)!.copyWith(fontSize: 14),
      ),
    ],
  );
}

Widget fpassemail(model) {
  return AllInputDesign(
    key: Key("signupemail"),
    hintText: 'Type Your Mobile no',
    controller: model.fpassemail,
    // controller: model.fpassemail,
    // autofillHints: [AutofillHints.email],
    textInputAction: TextInputAction.done,
    keyBoardType: TextInputType.number,
    validatorFieldValue: 'Phone number ',
    validator: validateMobile,
  );
}

Widget fpassBtn(context, model, formKey1) {
  return Button(
    buttonName: 'Next',
    key: Key('login_submi'),
    onPressed: () async {
      if (formKey1.currentState.validate()) {
        await model.sandOtpfpass(context);
      } else {
        // model.toggleautovalidate();
        showFlutterToast('please fill all fields');
      }
    },
  );
}
