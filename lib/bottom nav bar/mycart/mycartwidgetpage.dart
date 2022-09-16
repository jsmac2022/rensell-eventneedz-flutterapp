// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print, curly_braces_in_flow_control_structures

import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlistpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/address/address_page.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:eventneedz/common/styles/apierroralertdiloge.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mycart_modelpage.dart';

Widget pincodcard(context) {
  return Card(
    elevation: 2,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Check Delivery Time'),
          pinbutton(context),
        ],
      ),
    ),
  );
}

Widget pinbutton(context) {
  return Button(
    borderColor: colorpinklight,
    btnColor: colorWhite,
    buttonName: 'ENTER PIN CODE',
    textColor: colorpinklight,
    btnfontsize: 12,
    btnHeight: 30,
    btnWidth: deviceWidth(context, 0.35),
    borderRadius: BorderRadius.circular(5),
    key: Key('ENTER PIN CODE'),
    onPressed: () {
      showFlutterToast('Coming soon...');
      //  Get.to(() => SelectCategry());
    },
  );
}

Widget itencountcard(context, model) {
  return Card(
    elevation: 2,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Cart (${model.cartlistdata.length} items)',
            style: textstylesubtitle1(context),
          ),
          Text(
            'Total: \u20B9 ${model.totalAmount}',
            style: textstylesubtitle1(context),
          ),
        ],
      ),
    ),
  );
}

Widget additencard(context, model) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: model.cartlistdata.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          child: SizedBox(
            height: 200,
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 140,
                        height: 100,
                        child: Image.network(
                          "$baseImagepath${model.cartlistdata[index].product_url.toString()}",

                          fit: BoxFit.cover,
                          errorBuilder: (context, exception, stackTrack) =>
                              Center(
                                  child: Image(
                                      image:
                                          AssetImage('assets/images/db1.png'),
                                      fit: BoxFit.fill)),
                          // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                        ),
                      ),
                      sizedboxwidth(10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.cartlistdata[index].product_name.toString(),
                            style: textstylesubtitle1(context),
                          ),
                          InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              // ignore: non_constant_identifier_names
                              var module_type = prefs.getString("selectList");
                              print(" mahima ${module_type.runtimeType}");
                            },
                            child: Text(
                              model.cartlistdata[index].module_type.toString(),
                              //          ==
                              //     "SELL"
                              // ? "Sale"
                              // : "Rent",
                              // "${prefs.getString("selectList")}",
                              style: model.cartlistdata[index].module_type
                                          .toString() ==
                                      "SALE"
                                  ? TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: colorgreen)
                                  : TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                            ),
                          ),
                          sizedboxheight(8.0),
                          Text(
                            model.cartlistdata[index].vendor_name.toString(),
                            style: TextStyle(color: colorgrey),
                          ),
                          sizedboxheight(10.0),
                          Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  await model.increseQuantity(
                                      model.cartlistdata[index]);
                                },
                                child: Container(
                                  color: colorgrey,
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, top: 2, bottom: 2),
                                  child: Icon(
                                    Icons.add,
                                    size: 18,
                                  ),
                                ),
                              ),
                              sizedboxwidth(10.0),
                              Text(
                                model.cartlistdata[index].quality.toString(),
                              ),
                              sizedboxwidth(10.0),
                              InkWell(
                                onTap: () async {
                                  if (model.cartlistdata[index].quality >=
                                      (int.parse(model
                                              .cartlistdata[index].minQty) +
                                          1)) {
                                    await model.decreseQuantity(
                                        model.cartlistdata[index]);
                                  }
                                },
                                child: Container(
                                  color: colorgrey,
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, top: 2, bottom: 2),
                                  child: Icon(
                                    Icons.remove,
                                    size: 18,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  sizedboxheight(8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Price:',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                            TextSpan(
                                text:
                                    '\t\u20B9 ${model.cartlistdata[index].actual_price.toString()}\t\t\t',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                              text:
                                  '\u20B9 ${model.cartlistdata[index].product_flat_price.toString()}',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                                text:
                                    '\t\t\t${model.cartlistdata[index].offer.toString()}% OFF',
                                style: TextStyle(
                                    color: colorpinklight, fontSize: 12))
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Deposit:',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                            TextSpan(
                                text:
                                    '\t\u20B9 ${model.cartlistdata[index].desposit_price.toString()}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    endIndent: 1.0,
                  ),
                  sizedboxheight(2.0),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //     "Minimum Quantity : " +
                  //         model.cartlistdata[index].minQty.toString(),
                  //     style: TextStyle(color: Colors.black, fontSize: 12),
                  //     textAlign: TextAlign.start,
                  //   ),
                  // ),
                  // sizedboxheight(2.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            showAlertDialog(
                                context, model.cartlistdata[index], model);
                          },
                          style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 2),
                              alignment: Alignment.centerLeft),
                          child: Text(
                            'REMOVE',
                            style: TextStyle(
                                color: colorpinklight, fontSize: 12.9),
                          )),
                      TextButton(
                        onPressed: () {
                          model.movetofavorites(
                              context, model.cartlistdata[index].id);
                        },
                        style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 2),
                            alignment: Alignment.centerLeft),
                        child: Text(
                          'MOVE TO FAVORITES',
                          style: TextStyle(color: colorblack, fontSize: 12.9),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}

Widget moreaddcard(context) {
  return InkWell(
    onTap: () {
      Get.to(() => WishlistPage());
    },
    child: Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Add more items from Wishlist'),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget orderdetailscard(context, model, data) {
  int gstAmonut = 18;
  int totalGst = model.finalPayableAmount;
  var gst = ((totalGst * gstAmonut) / 100);
  var finalGstAmount = totalGst + gst;
  print("gst amount>>>>>" + finalGstAmount.toString());
  return Consumer<MyCartModelPage>(builder: ((context, data, child) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Details',
              style: textstylesubtitle1(context),
            ),
            sizedboxheight(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cost Amount',
                  style: textstylesubtitle1(context)!
                      .copyWith(color: colorblack54),
                ),
                Text(
                  '\t\u20B9 ${model.totalAmount}',
                  style: textstylesubtitle1(context)!
                      .copyWith(color: colorblack54),
                ),
              ],
            ),
            sizedboxheight(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount',
                  style: textstylesubtitle1(context)!
                      .copyWith(color: colorblack54),
                ),
                Text(
                  // "${model.cartlistdata.offer}% OFF",
                  '\t\u20B9  ${model.totalDiscount}',
                  style: textstylesubtitle1(context)!
                      .copyWith(color: colorpinklight),
                ),
              ],
            ),
            sizedboxheight(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gst(18%)',
                  style: textstylesubtitle1(context)!
                      .copyWith(color: colorblack54),
                ),
                Text(
                  // "${model.cartlistdata.offer}% OFF",
                  '\t\u20B9  ${gst}',
                  style: textstylesubtitle1(context)!
                      .copyWith(color: colorblack54),
                ),
              ],
            ),
            sizedboxheight(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deposit',
                  style: textstylesubtitle1(context)!
                      .copyWith(color: colorblack54),
                ),
                Text(
                  '\t\u20B9 ${model.totalDiposite}',
                  style: textstylesubtitle1(context)!
                      .copyWith(color: colorblack54),
                ),
              ],
            ),
            sizedboxheight(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery',
                  style: textstylesubtitle1(context)!
                      .copyWith(color: colorblack54),
                ),
                Text(
                  '\t\u20B9 00.00',
                  style: textstylesubtitle1(context)!
                      .copyWith(color: colorblack54),
                ),
              ],
            ),
            sizedboxheight(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount',
                  style: textstylesubtitle1(context)!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                Text(
                  '\t\u20B9 ${finalGstAmount}',
                  style: textstylesubtitle1(context)!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ],
            ),
            sizedboxheight(10.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'GST Amount(18%)',
            //       style: textstylesubtitle1(context)!.copyWith(
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 18.0),
            //     ),
            //     Text(
            //       '\t\u20B9 ${finalGstAmount}',
            //       style: textstylesubtitle1(context)!.copyWith(
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 18.0),
            //     ),
            //   ],
            // ),
            // sizedboxheight(10.0),
          ],
        ),
      ),
    );
  }));
}

showAlertDialog(BuildContext context, removeitemdetail, model) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, StateSetter setState) {
        return AlertDialog(
          title: Text(
            "Remove Item from Cart",
            style: textstyleHeading6(context),
          ),
          content: SizedBox(
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Are you sure you want you remove this item from?",
                  style: textstylesubtitle2(context)!
                      .copyWith(color: colorblack54),
                ),
                sizedboxheight(10.0),
                Row(
                  children: [
                    SizedBox(
                      width: 90,
                      height: 70,
                      child: Image.network(
                        "$baseImagepath${removeitemdetail.product_url.toString()}",

                        fit: BoxFit.fill,
                        errorBuilder: (context, exception, stackTrack) =>
                            Center(
                                child: Image(
                                    image: AssetImage('assets/images/db1.png'),
                                    fit: BoxFit.fill)),
                        // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                      ),
                    ),
                    sizedboxwidth(7.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            removeitemdetail.product_name.toString(),
                            style: textstylesubtitle1(context),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          sizedboxheight(5.0),
                          Text(
                            removeitemdetail.vendor_name.toString(),
                            style: TextStyle(color: colorgrey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                sizedboxheight(16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      borderColor: colorgrey,
                      btnColor: colorWhite,
                      buttonName: 'NO',
                      textColor: colorpinklight,
                      btnHeight: 30,
                      btnfontsize: 12,
                      btnWidth: deviceWidth(context, 0.3),
                      borderRadius: BorderRadius.circular(1),
                      key: Key('no'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Button(
                      buttonName: 'YES',
                      textColor: colorWhite,
                      btnHeight: 30,
                      btnWidth: deviceWidth(context, 0.3),
                      borderRadius: BorderRadius.circular(1),
                      key: Key('yes'),
                      onPressed: () {
                        model.removeCartItem(context, removeitemdetail.id);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
    },
  );
}

Widget addOrderBtn(context, model) {
  int gstAmonut = 18;
  int totalGst = model.finalPayableAmount;
  var gst = ((totalGst * gstAmonut) / 100);
  var finalGstAmount = totalGst + gst;
  print("gst amount>>>>>" + finalGstAmount.toString());
  return Container(
    height: 55,
    color: colorWhite,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: TextButton(
            onPressed: () async {
              await model.scrollDown();
            },
            child: Column(
              children: [
                Text(
                  "\u{20B9} ${finalGstAmount}",
                  style: TextStyle(
                    color: colorblack,
                  ),
                ),
                Text(
                  "View Details ",
                  style: TextStyle(color: colorpinklight),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 7),
            child: Button(
              buttonName: 'PLACE ORDER',
              btnHeight: 40,
              borderRadius: BorderRadius.circular(1),
              key: Key('place order'),
              onPressed: () async {
                if (model.cartlistdata.length > 0) {
                  for (var i = 0; i < model.cartlistdata.length; i++) {
                    if (model.cartlistdata[i].quality >=
                        int.parse(model.cartlistdata[i].minQty)) {
                      await model.allbuyproductdata();
                      Get.to(() => AddressPage(
                            pageCome: 'razorpay',
                          ));
                      // Provider.of<RazorpayModelPage>(context, listen: false).openCheckout(context, 100);
                    } else {
                      apiErrorAlertdialog(
                          context,
                          'please enter' +
                              " " +
                              model.cartlistdata[i].minQty +
                              " "
                                  'quantity');
                    }
                  }
                } else
                  apiErrorAlertdialog(context, 'Your Cart is Empty!');
              },
            ),
          ),
        ),
      ],
    ),
  );
}
