// ignore_for_file: prefer_const_constructors
import 'package:eventneedz/bottom%20nav%20bar/mycart/mycartpaymentbill_modelpage.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// address list not empty show this widget
Widget addressListpage(context, model, pageCome) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: addressDetailShowCard(context, model, pageCome),
  );
}

Widget addressDetailShowCard(context, model, pageCome) {
  return ListView.builder(
      itemCount: model.addressList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: InkWell(
            onTap: () {
              if (pageCome == 'razorpay') {
                Provider.of<MyCartPaymentBillPage>(context, listen: false)
                    .addressSelectedperam(context, model.addressList[index]['Address']);
              }
            },
            child: Container(
              padding: EdgeInsets.only(left: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: colorpinklight,
                            padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                            child: Text(
                              // 'DEFAULT',
                              model.addressList[index]['Address']['address'].toUpperCase().toString(),
                              style: TextStyle(color: colorWhite, fontSize: 12),
                            ),
                          ),
                          TextButton(
                              onPressed: () async {
                                await model.editaddressSelectedperam(context, model.addressList[index]['Address']);
                              },
                              child: Text(
                                'Edit',
                                style: TextStyle(color: colorpinklight),
                              ))
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          showdeleteAlertDialog(context, model, model.addressList[index]['Address']['id']);
                        },
                        icon: Image.asset('assets/icons/delet.png'),
                      )
                    ],
                  ),
                  SizedBox(
                    // width: deviceWidth(context, 0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${model.addressList[index]['Address']['first_name'].toString()} ${model.addressList[index]['Address']['last_name'].toString()}',
                          style: textstylesubtitle1(context),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        sizedboxheight(4.0),
                        Text(
                          "${model.addressList[index]['Address']['flat_no'].toString()}, ${model.addressList[index]['Address']['locality'].toString()}, ${model.addressList[index]['Address']['city'].toString()}, ${model.addressList[index]['Address']['state'].toString()} - ${model.addressList[index]['Address']['pincode'].toString()}",
                          // '119, Rainbow Caste, HMT, Sathavahana, More Super Market, Hyderabad, Telangana, India - 500072',
                          style: TextStyle(color: Colors.black54),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        sizedboxheight(10.0),
                        Row(
                          children: [
                            Text(
                              'Phone : ',
                              style: TextStyle(color: Colors.black54),
                            ),
                            Text(
                              model.addressList[index]['Address']['phone_no'].toString(),
                              style: TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

// --- DELETE ADDRESS BUTTON ---
showdeleteAlertDialog(BuildContext context, model, id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Are you sure you want to delete this address?",
          style: textstylesubtitle1(context),
        ),
        content: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dialognobut(context),
              sizedboxwidth(18.0),
              dialogyesbut(context, model, id),
            ],
          ),
        ),
      );
    },
  );
}

Widget dialognobut(context) {
  return Button(
    borderColor: colorpinklight,
    btnColor: colorWhite,
    buttonName: 'NO',
    textColor: colorpinklight,
    btnHeight: 35,
    btnfontsize: 14,
    btnWidth: deviceWidth(context, 0.25),
    borderRadius: BorderRadius.circular(1),
    key: Key('no'),
    onPressed: () {
      Navigator.pop(context);
      //  Get.to(() => SelectCategry());
    },
  );
}

Widget dialogyesbut(context, model, iddelete) {
  return Button(
    buttonName: 'YES',
    btnHeight: 35,
    btnfontsize: 14,
    btnWidth: deviceWidth(context, 0.25),
    borderRadius: BorderRadius.circular(1),
    key: Key('yes'),
    onPressed: () {
      model.dELETEadrressApi(context, iddelete);
      //  Get.to(() => SelectCategry());
    },
  );
}
