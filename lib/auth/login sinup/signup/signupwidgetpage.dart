// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:eventneedz/auth/login%20sinup/login/loginwidgetpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/privacypolicy/privacypolicy.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:eventneedz/common/formtextfield/mytextfield.dart';
import 'package:eventneedz/common/formtextfield/validations_field.dart';
import 'package:eventneedz/common/styles/apierroralertdiloge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'signupmodelpage.dart';

Widget signupChildrens(context) {
  return SingleChildScrollView(
    // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

    child: Consumer<SignUpModelpage>(builder: (context, model, _) {
      return Form(
        key: model.formKeysignup,
        // autovalidate: model.autovalidateSignup,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              sizedboxheight(15.0),
              signupfname(model),
              sizedboxheight(22.0),
              signuplname(model),
              sizedboxheight(22.0),
              signupmobile(model),
              sizedboxheight(22.0),
              signupemail(model),
              sizedboxheight(22.0),
              signupPassword(context, model),
              checkboxTC(context, model),
              sizedboxheight(22.0),
              signupBtn(context, model),
              sizedboxheight(22.0),
              sininwithAccount(context, "Or sign in with"),
              sizedboxheight(22.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  googleboxbtn2(context),
                  sizedboxwidth(15.0),
                  fbboxbtn1(),

                  //  Consumer<GoogleSignUpModelPage>(builder: (context,googlesignupmodel,_){
                  //  return  googleboxbtn2(context,googlesignupmodel);
                  //  }),
                  // sizedboxwidth(15.0),
                  // boxbtn3(),

                ],
              ),
              sizedboxheight(22.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    Text(
                      'By Continuing you agree to EventNeedz',
                      textAlign: TextAlign.center,
                      style: textstylesubtitle1(context),
                    ),
                    sizedboxheight(3.0),
                    InkWell(
                      onTap: () {
                        Get.to(() => PrivacyPolicy());
                      },
                      child: Text(
                        'Privacy Policy',
                        textAlign: TextAlign.center,
                        style: textstylesubtitle1(context)!.copyWith(
                            color: colorreddark, fontWeight: fontWeight900),
                      ),
                    ),
                  ],
                ),
              ),
              sizedboxheight(75.0),
            ],
          ),
        ),
      );
    }),
  );
}

Widget signupfname(model) {
  return AllInputDesign(
    key: Key("fname"),
    inputHeaderName: 'First Name',
    controller: model.signupFirstName,
    autofillHints: [AutofillHints.namePrefix],
    keyBoardType: TextInputType.emailAddress,
    validatorFieldValue: 'name',
    validator: validateName,
    inputFormatterData: [
      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
    ],
    textCapitalization: TextCapitalization.sentences,
  );
}

Widget signuplname(model) {
  return AllInputDesign(
    key: Key("lname"),
    inputHeaderName: 'Last Name',
    controller: model.signupLastName,
    autofillHints: [AutofillHints.nameSuffix],
    validatorFieldValue: 'name',
    validator: validateName,
    inputFormatterData: [
      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
    ],
    textCapitalization: TextCapitalization.sentences,
  );
}

Widget signupmobile(model) {
  return AllInputDesign(
    key: Key("mobile"),
    inputHeaderName: 'Mobile',
    controller: model.signupMobile,
    maxLength: 10,
    counterText: '',
    autofillHints: [AutofillHints.telephoneNumberCountryCode],
    keyBoardType: TextInputType.number,
    validatorFieldValue: 'mobile',
    validator: validateMobile,
    inputFormatterData: [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    ],
  );
}

Widget signupemail(model) {
  return AllInputDesign(
    key: Key("signupemail"),
    inputHeaderName: 'Email',
    controller: model.signupemail,
    autofillHints: [AutofillHints.email],
    keyBoardType: TextInputType.emailAddress,
    validatorFieldValue: 'email',
    validator: validateEmailField,
  );
}

Widget signupPassword(context, model) {
  return AllInputDesign(
    key: Key("signuppassword"),
    inputHeaderName: 'Password',
    controller: model.signupPassword,
    obsecureText: model.obscuretext,
    textInputAction: TextInputAction.done,
    autofillHints: [AutofillHints.password],
    suffixIcon: TextButton(
        key: Key('password_visibility'),
        onPressed: () {
          model.toggle();
        },
        child: model.obscuretext
            ? Text(
                'Show',
                style: textstyleHeading6(context)!
                    .copyWith(color: colorredlightbtn),
              )
            : Text(
                'Hide',
                style: textstyleHeading6(context)!
                    .copyWith(color: colorredlightbtn),
              )),
    validatorFieldValue: 'password',
    validator: validatePassword,
    keyBoardType: TextInputType.text,
  );
}

Widget checkboxTC(context, model) {
  return Row(
    children: [
      Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        value: model.checkboxvalue,
        onChanged: (value) {
          model.toggleCheckbox();
        },
        activeColor: colorredlightbtn,
      ),
      SizedBox(
        width: deviceWidth(context, 0.7),
        child: Text(
          'I would like to receive your newsletter and other promotional information.',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: textstylesubtitle1(context),
        ),
      ),
    ],
  );
}

Widget signupBtn(context, model) {
  return Button(
    btnWidth: deviceWidth(context, 1.0),
    isLoading: model.isShimmer,
    buttonNameloading: 'Create Account',
    key: Key('signup_submit'),
    btnColor: colorgrey,
    onPressed: () async {
      FocusScope.of(context).unfocus();
      if (model.formKeysignup.currentState.validate()) {
        if (model.checkboxvalue == false) {
          apiErrorAlertdialog(context, 'Please Check Term & Condition');
        } else {
          await model.signupsubmit(context);
          // succesfulldialog(context, 'REGISTRATION SUCCESSFUL');

        }
      } else {
        // model.toggleautovalidate();
        showFlutterToast('please fill all fields');
      }
    },
  );
}
