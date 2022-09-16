// ignore_for_file: prefer_final_fields, avoid_print, prefer_const_constructors

import 'package:eventneedz/api%20url/globales.dart';
import 'package:eventneedz/auth/forgetpassword/enter%20new%20password%203/newpasspage.dart';
import 'package:eventneedz/auth/login%20sinup/enter%20otp%20page%202/enterotp_modelpage.dart';
import 'package:eventneedz/auth/login%20sinup/enter%20otp%20page%202/enterotp_signuppage.dart';
import 'package:eventneedz/auth/login%20sinup/loginsinguppage.dart';
import 'package:eventneedz/auth/selectcatagery.dart';
import 'package:eventneedz/common/styles/apierroralertdiloge.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';
import 'package:sms_autofill/sms_autofill.dart';

class TwillioModelPage extends ChangeNotifier {
  TwilioPhoneVerify _twilioPhoneVerify = TwilioPhoneVerify(
      accountSid: accountSid, // replace with Account SID
      authToken: authToken, // replace with Auth Token
      serviceSid: serviceSid // replace with Service SID
      );

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;

  // otp sand by twilio
  otpsandtwilio(countryCode, mobileNumber, pagecomming1) async {
    print('twillio mob number $countryCode$mobileNumber');
    // toggleshemmerShow();
    var twilioResponse = await _twilioPhoneVerify
        .sendSmsCode('${countryCode ?? "+91"}$mobileNumber');

    if (twilioResponse.successful!) {
      // toggleshemmerdismis();
      _phoneNumber = '${countryCode ?? "+91"}$mobileNumber';
      notifyListeners();
      Get.to(() => EnterOtpSignupPage(pagecomming: pagecomming1,),);

      print('otp sand successfull signature ${SmsAutoFill().getAppSignature}');
    } else {
      // toggleshemmerdismis();
      print(twilioResponse.errorMessage);
    }
  }

  //otp verify by twilio

  String _verificationCode = '';
  String get verificationCode => _verificationCode;

  verificationfun(verification) {
    _verificationCode = verification;
    notifyListeners();
    print('smscode1 $_verificationCode');
  }

  otpverofytwilio(context, pagecomming) async {
    // toggleshemmerShow();
    var twilioResponse = await _twilioPhoneVerify.verifySmsCode(
        phone: phoneNumber, code: verificationCode);

    if (twilioResponse.successful!) {
      if (twilioResponse.verification!.status == VerificationStatus.approved) {
        if (pagecomming == 'signup') {
          Get.offAll(() => LoginPageSignupPage());
          Provider.of<EnterOtpModelPage>(context, listen: false)
              .otpVerifiy(context);
        } else if (pagecomming == 'forgetpassword') {
          Get.off(() => NewPassPage());
        } else if (pagecomming == 'inactivelogin') {
          await Provider.of<EnterOtpModelPage>(context, listen: false)
              .otpVerifiy(context);
          Get.offAll(() => SelectCategry());
        }

        print('Phone number is approved');
        _phoneNumber = '';
        _verificationCode = '';
        notifyListeners();
      } else {
        _phoneNumber = '';
        _verificationCode = '';
        notifyListeners();
        // toggleshemmerdismis();
        apiErrorAlertdialog(context, 'Invalid or wrong code');
        print('Invalid or wrong code');
      }
    } else {
      // toggleshemmerdismis();
      _phoneNumber = '';
      _verificationCode = '';
      notifyListeners();
      // Get.offAll(() => LoginPage());
      // showFlutterToast('Something went wrong');
      print(twilioResponse.errorMessage);
    }
  }

}
