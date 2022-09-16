// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:eventneedz/common/commonwidgets/button.dart';
// import 'package:eventneedz/common/formtextfield/mytextfield.dart';
// import 'package:eventneedz/common/styles/const.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../addpaymentcardpage.dart';

// Widget cardnum(context) {
//   return AllInputDesign(
//     key: Key("Card Number"),
//     hintText: 'Card Number',
//     fillColor: colorgreylight,
//     suffixIcon: Image.asset('assets/icons/cardicon.png'),
//     // controller: model.loginEmail,
//     autofillHints: [AutofillHints.creditCardNumber],
//     keyBoardType: TextInputType.number,
//   );
// }

// Widget cardname(context) {
//   return AllInputDesign(
//     key: Key("Card Name"),
//     hintText: 'Card Name',
//     fillColor: colorgreylight,
//     // controller: model.loginEmail,
//     autofillHints: [AutofillHints.creditCardName],
//     keyBoardType: TextInputType.name,
//   );
// }

// Widget expirymonth(context) {
//   return AllInputDesign(
//     key: Key("Expiry Month"),
//     hintText: 'Expiry Month',
//     widthtextfield: deviceWidth(context, 0.42),
//     fillColor: colorgreylight,
//     // controller: model.loginEmail,
//     autofillHints: [AutofillHints.creditCardExpirationMonth],
//     keyBoardType: TextInputType.datetime,
//   );
// }

// Widget expiryyear(context) {
//   return AllInputDesign(
//     widthtextfield: deviceWidth(context, 0.42),
//     key: Key("Expiry Year"),
//     hintText: 'Expiry Year',
//     fillColor: colorgreylight,
//     // controller: model.loginEmail,
//     autofillHints: [AutofillHints.creditCardExpirationYear],
//     textInputAction: TextInputAction.next,
//     keyBoardType: TextInputType.datetime,
//     validatorFieldValue: 'Expiry Year',
//   );
// }

// Widget savebut(context) {
//   return Button(

//     buttonName: 'SAVE CARD',
//     btnHeight: 40,
//     btnfontsize: 14,
//     btnWidth: deviceWidth(context, 0.4),
//     borderRadius: BorderRadius.circular(2),
//     key: Key('SAVE CARD'),
//     onPressed: () async {      
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setBool(
//         'addcard',
//         true,
//       );
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (_) => AddCardPage()));
//     },
//   );
// }

// Widget cancelbut(context) {
//   return Button(
//     borderColor: colorpinklight,
//     btnColor: colorWhite,
//     buttonName: 'CANCEL',
//     textColor: colorpinklight,
//     btnHeight: 40,
//     btnfontsize: 14,
//     btnWidth: deviceWidth(context, 0.4),
//     borderRadius: BorderRadius.circular(2),
//     key: Key('CANCEL'),
//     onPressed: () {
//       //  Get.to(() => SelectCategry());
//     },
//   );
// }