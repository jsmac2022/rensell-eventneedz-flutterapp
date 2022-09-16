// // ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables

// import 'package:eventneedz/common/appbar/appbarpage.dart';
// import 'package:eventneedz/common/styles/const.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'addpaymentcard_widgetpage.dart';

// class AddCardPage extends StatefulWidget {
//   AddCardPage({Key? key}) : super(key: key);
//   @override
//   _AddCardPageState createState() => _AddCardPageState();
// }

// class _AddCardPageState extends State<AddCardPage> {
//   var data = false;
//   @override
//   void initState() {
//     super.initState();
//     demo();
//   }

//   void demo() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     data = prefs.getBool('addcard')!;
//     print('amantest1111...$data');
//   }

//   @override
//   Widget build(BuildContext context) {
//     setState(() {
//       demo();
//     });
//     print('aman...$data');
//     return Scaffold(
//       backgroundColor: colorgreylight,
//       appBar: data == false
//           ? apponlytitle(context, 'Add Card')
//           : apponlytitle(context, 'Manage Saved Cards'),
//       body: data == false
//           ? SizedBox(
//               width: deviceWidth(context, 1.0),
//               height: deviceheight(context, 1.0),
//               child: SingleChildScrollView(
//                 physics: NeverScrollableScrollPhysics(),
//                 child: Padding(
//                   padding: EdgeInsets.all(12.0),
//                   child: Column(
//                     children: [
//                       sizedboxheight(20.0),
//                       Image.asset('assets/images/cardimage.png'),
//                       sizedboxheight(20.0),
//                       Text(
//                         'SAVE YOUR CREDIT /DEVIT CARD',
//                         style: textstyleHeading6(context),
//                       ),
//                       sizedboxheight(20.0),
//                       Text(
//                         'It\'s convenient to pay with saved card.\n'
//                         'You ccard information will be secure.',
//                         style: textstylesubtitle1(context),
//                       ),
//                       sizedboxheight(20.0),
//                       addNewpaymentcardBtn(context, data)
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           : savepaymentCardListpage(context,data),
//     );
//   }
// }
