// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/itemfulldetail_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/itemfulldetailspage.dart';
import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlist_modelpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

Widget recproductlist(context, dataList) {
  final orientation = MediaQuery.of(context).orientation;
  // print('datalist $dataList');
  return Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
          itemCount: dataList.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio:
                  deviceWidth(context, 0.8) / deviceheight(context, 0.76)),
          itemBuilder: (context, index) {
            var stock = int.parse(
              dataList[index]['Product']['product_stock_info'] ?? 0,
            );
            // var stock = 0;
            return InkWell(
              onTap: () async {
                await Provider.of<ItemFullDetailModelPage>(context,
                        listen: false)
                    .setSelectedItemData(dataList[index]);

                Get.to(() => ItemFullDetailsPage());
              },
              child: Container(
                color: colorWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 120,
                          color: colorblack,
                          child: Image.network(
                            "$baseImagepath${dataList[index]['Product']['product_cover_image'][0].toString()}",
                            // dataList[index]['Product']['product_cover_image'].toString(),
                            fit: BoxFit.fill,
                            errorBuilder: (context, exception, stackTrack) =>
                                Center(
                                    child: Image(
                                        image:
                                            AssetImage('assets/images/db1.png'),
                                        fit: BoxFit.cover)),
                            // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            child: IconButton(
                                onPressed: () async {
                                  await Provider.of<WishListFavModelPage>(
                                          context,
                                          listen: false)
                                      .addperams(
                                          context, dataList[index]['Product']);
                                },
                                icon: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        // color: colorblack,
                                        borderRadius:
                                            borderRadiuscircular(15.0)),
                                    child: Center(
                                        child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.pink,
                                      size: 20,
                                    ))))),
                        // Positioned(
                        //     right: 10,
                        //     bottom: -12,
                        //     child: Container(
                        //         width: 50,
                        //         height: 50,
                        //         decoration: BoxDecoration(
                        //             color: colorWhite,
                        //             borderRadius: borderRadiuscircular(25.0)),
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Text(
                        //               '${dataList[index]['Product']['product_offcer'].toString()}% OFF',
                        //               textAlign: TextAlign.center,
                        //               style: TextStyle(
                        //                   fontSize: fontsize18,
                        //                   fontWeight: fontWeight700,
                        //                   color: colorredlightbtn),
                        //             ),
                        //           ],
                        //         ))),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedboxheight(2.0),
                            Text(
                              dataList[index]['Product']['product_name']
                                  .toString(),
                              style: textstyleHeading3(context)!
                                  .copyWith(fontSize: 15),
                            ),
                            Text(
                              dataList[index]['Product']['selectList']
                                  .toString(),
                              style: textstyleHeading3(context)!
                                  .copyWith(fontSize: 15),
                            ),
                            Text(
                              dataList[index]['Product']['product_vendor']
                                  .toString(),
                              style: textstyleHeading6(context)!.copyWith(
                                  fontSize: 15, color: Colors.black45),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  decoration: BoxDecoration(
                                      color: colorredlightbtn,
                                      borderRadius: borderRadiuscircular(3.0)),
                                  child: Row(
                                    children: [
                                      Text(
                                        dataList[index]['Product']
                                                        ['product_rating']
                                                    .toString() ==
                                                "0"
                                            ? "No Rating"
                                            : dataList[index]['Product']
                                                    ['product_rating']
                                                .toString(),
                                        style: textstyleHeading6(context)!
                                            .copyWith(
                                                fontWeight: fontWeight400,
                                                color: Colors.white),
                                      ),
                                      sizedboxwidth(2.0),
                                      Icon(
                                        Icons.star,
                                        color: colorWhite,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                                sizedboxwidth(8.0),
                                // Text(
                                //   '(835)',
                                //   style: textstyleHeading6(context)!.copyWith(
                                //       fontSize: 15, color: Colors.black45),
                                // ),
                              ],
                            ),
                            Wrap(
                              children: [
                                Text(
                                  'Price : ',
                                  style: textstyleHeading6(context)!.copyWith(
                                      fontSize: 15, fontWeight: fontWeight400),
                                ),
                                Text(
                                  '\u{20B9}${dataList[index]['Product']['product_amount'].toString()}',
                                  style: textstyleHeading3(context)!.copyWith(
                                      fontSize: 15, fontWeight: fontWeight900),
                                ),
                                sizedboxwidth(8.0),
                                Text(
                                  '\u{20B9}${dataList[index]['Product']['product_flat_price'].toString()}',
                                  style: textstyleHeading6(context)!.copyWith(
                                      fontWeight: fontWeight400,
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Deposit :',
                                  style: textstyleHeading6(context)!.copyWith(
                                      fontSize: 15, fontWeight: fontWeight400),
                                ),
                                Text(
                                  dataList[index]['Product']['product_despoit']
                                      .toString(),
                                  style: textstyleHeading6(context)!.copyWith(
                                      fontSize: 15, fontWeight: fontWeight900),
                                ),
                              ],
                            ),
                            dataList[index]['Product']['product_valid_offer']
                                        .toString() ==
                                    'null'
                                ? Container()
                                : Text(
                                    'Order before ${dataList[index]['Product']['product_valid_offer'].toString()} days',
                                    style: textstyleHeading6(context)!.copyWith(
                                        fontSize: 15, color: Colors.black45),
                                  ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: colorredlightbtn,
                                  size: 15,
                                ),
                                Text(
                                  dataList[index]['Product']['product_verified']
                                      .toString(),
                                  style: dataList[index]['Product']
                                                  ['product_verified']
                                              .toString() ==
                                          "UnVerified"
                                      ? textstyleHeading6(context)!
                                          .copyWith(color: Colors.pink)
                                      : textstyleHeading6(context)!
                                          .copyWith(color: colorgreen),
                                ),
                              ],
                            ),
                            Text(
                              stock > 0
                                  ? 'Stock Available $stock'
                                  : 'Not Available',
                              style: textstyleHeading6(context)!.copyWith(
                                  fontSize: 15, color: colorredlightbtn),
                            ),
                            sizedboxheight(2.0),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    ),
  );
}
