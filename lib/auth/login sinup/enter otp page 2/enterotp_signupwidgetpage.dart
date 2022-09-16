// ignore_for_file: prefer_const_constructors
import 'package:eventneedz/auth/twillio/twillio_modelpage.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:provider/provider.dart';

Widget otptypeWidgetsignup(context, model) {
  return OtpTextField(
    keyboardType: TextInputType.visiblePassword,
    numberOfFields: 5,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    // borderColor: colorredlightbtn,
    focusedBorderColor: colorreddark,
    borderRadius: BorderRadius.circular(15.0),
    fieldWidth: 40.0,

    // showFieldAsBox: true, //set to true to show as box or false to show as dash
    onCodeChanged: (String code) {
      //handle validation or checks here
    },
    onSubmit: (String verificationCode) {
      Provider.of<TwillioModelPage>(context, listen: false)
          .verificationfun(verificationCode);
    },
  );
}

Widget otpveryfiBtnsignup(context, model, pagecomming) {
  return Button(
    isLoading: model.isShimmer,
    buttonNameloading: 'Verify',
    key: Key('login_submi'),
    onPressed: () async {
      // await model.otpVerifiy(context, ontap);
      Provider.of<TwillioModelPage>(context, listen: false)
          .otpverofytwilio(context, pagecomming);
    },
  );
}

Widget resandotprowforgetSignup(context, model) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      OtpTimerButton(
        controller: model.controller,
        onPressed: () {},
        text: Text('Resend OTP'),
        duration: 60,
      ),

      // TimerButton(
      //     buttonType: ButtonType.TextButton,
      //     label: "Send OTP Again",
      //     timeOutInSeconds: 30,
      //     onPressed: () {
      //       // model.submitPhoneNumber();
      //     },
      //     disabledColor: Colors.white,
      //     color: Colors.white,
      //     disabledTextStyle:
      //         textstyleHeading6(context)!.copyWith(color: Colors.black45),
      //     activeTextStyle: textstyleHeading3(context)!.copyWith(
      //         color: colorredlightbtn,
      //         fontSize: 18,
      //         fontWeight: fontWeight700)),

    ],
  );
}
