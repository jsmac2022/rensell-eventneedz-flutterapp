// // ignore_for_file: prefer_const_constructors

// import 'package:eventneedz/common/commonwidgets/button.dart';
// import 'package:eventneedz/common/styles/const.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'card save form/cardsevepage.dart';

// // when save card list not empty then show this page widget
// Widget savepaymentCardListpage(context,data) {
//   return SizedBox(
//     width: deviceWidth(context, 1.0),
//     height: deviceheight(context, 1.0),
//     child: SingleChildScrollView(
//       physics: NeverScrollableScrollPhysics(),
//       child: Padding(
//         padding: EdgeInsets.all(12.0),
//         child: Column(children: [
//           sizedboxheight(20.0),
//           addNewpaymentcardBtn(context, data),
//           sizedboxheight(20.0),
//           Card(
//             child: Padding(
//               padding: EdgeInsets.all(15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Image.asset('assets/images/cardaddimage.png'),
//                   IconButton(
//                       onPressed: () async {
//                         SharedPreferences prefs = await SharedPreferences.getInstance();
//                         prefs.setBool(
//                           'addcard',
//                           false,
//                         );
                        
//                       },
//                       icon: Image.asset('assets/icons/delet.png'))
//                 ],
//               ),
//             ),
//           )
//         ]),
//       ),
//     ),
//   );
// }

// Widget addNewpaymentcardBtn(context, data) {
//   return Button(
//     borderRadius: BorderRadius.circular(1.0),
//     btnColor: colorWhite,
//     textColor: colorpinklight,
//     borderColor: colorpinklight,
//     btnWidth: data == false ? deviceWidth(context, 0.65) : deviceWidth(context, 0.9),
//     buttonName: '+ ADD NEW CARD',
//     key: Key('login_submi'),
//     onPressed: () {
//       //Get.to(() => CardSevePage());
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => CardSevePage()));
//     },
//   );
// }
