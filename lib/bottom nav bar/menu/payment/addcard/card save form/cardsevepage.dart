// // ignore_for_file: prefer_const_constructors

// import 'package:eventneedz/common/appbar/appbarpage.dart';
// import 'package:eventneedz/common/styles/const.dart';
// import 'package:flutter/material.dart';

// import 'cardsevewidget.dart';

// class CardSevePage extends StatelessWidget {
//   const CardSevePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colorgreylight,
//       appBar: apponlytitle(context, 'Add Card'),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(12.0),
//           child: Column(
//             children: [
//               Card(
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       sizedboxheight(18.0),
//                       Text(
//                         'Add New Credit/Debit Card',
//                         style: textstylesubtitle1(context),
//                       ),
//                       sizedboxheight(26.0),
//                       cardnum(context),
//                       sizedboxheight(26.0),
//                       cardname(context),
//                       sizedboxheight(30.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           expirymonth(context),
//                           expiryyear(context),
//                         ],
//                       ),
//                       sizedboxheight(30.0),
//                       Padding(
//                         padding: EdgeInsets.all(10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             savebut(context),
//                             cancelbut(context),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
