// ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace

import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbarwidget.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';

Widget wishlistwidget(context, model) {
  final orientation = MediaQuery.of(context).orientation;
  return Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GridView.builder(
          itemCount: model.wishlistList.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 9,
              childAspectRatio:
                  deviceWidth(context, 0.9) / deviceheight(context, 0.80)),
          itemBuilder: (context, index) {
            return /*InkWell(
              onTap: () async {
                print(
                    'vvvv ${model.wishlistList[index]['Add_card'].toString()}');
              },
              child:*/
                Container(
              height: 250.0,
              color: colorWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 120,
                        child: Image.network(
                          "$baseImagepath${model.wishlistList[index]['Add_card']['product_url'][0].toString()}",

                          fit: BoxFit.fill,
                          errorBuilder: (context, exception, stackTrack) =>
                              Image(
                                  image: AssetImage('assets/images/db1.png'),
                                  fit: BoxFit.fill),
                          // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          child: IconButton(
                              onPressed: () {
                                model.removeFromWishlistItem(
                                    context,
                                    model.wishlistList[index]['Add_card']
                                        ['id']);
                              },
                              icon: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      // color: colorblack,
                                      borderRadius: borderRadiuscircular(15.0)),
                                  child: Center(
                                      child: Icon(
                                    Icons.cancel_schedule_send,
                                    color: Colors.pink,
                                    size: 20,
                                  ))))),
                      // Positioned(
                      //     right: 10,
                      //     bottom: -1,
                      //     child: Container(
                      //         width: 50,
                      //         height: 50,
                      //         decoration: BoxDecoration(
                      //             color: colorWhite,
                      //             borderRadius: borderRadiuscircular(25.0)),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Text(
                      //               '${model.wishlistList[index]['Add_card']['offer'].toString()}%',
                      //               textAlign: TextAlign.center,
                      //               style: TextStyle(
                      //                   fontSize: 17,
                      //                   fontWeight: fontWeight700,
                      //                   color: colorredlightbtn),
                      //             ),
                      //             Text(
                      //               'OFF',
                      //               textAlign: TextAlign.center,
                      //               style: TextStyle(
                      //                   fontSize: fontsize15,
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
                            model.wishlistList[index]['Add_card']
                                    ['product_name']
                                .toString(),
                            style: textstyleHeading3(context)!
                                .copyWith(fontSize: 16),
                          ),
                          Text(
                            model.wishlistList[index]['Add_card']['vendor_name']
                                .toString(),
                            style: textstyleHeading6(context)!
                                .copyWith(fontSize: 16, color: Colors.black45),
                          ),
                          Wrap(
                            children: [
                              Text(
                                'Price : ',
                                style: textstyleHeading6(context)!.copyWith(
                                    fontSize: 16, fontWeight: fontWeight400),
                              ),
                              Text(
                                '\u{20B9}${model.wishlistList[index]['Add_card']['actual_price'].toString()}',
                                style: textstyleHeading3(context)!.copyWith(
                                    fontSize: 16, fontWeight: fontWeight900),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              /* sizedboxwidth(5.0),
                              Text(
                                '\u{20B9}50000',
                                style: textstyleHeading6(context)!.copyWith(
                                    fontWeight: fontWeight400,
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),*/
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Deposit :',
                                style: textstyleHeading6(context)!.copyWith(
                                    fontSize: 16, fontWeight: fontWeight400),
                              ),
                              Text(
                                model.wishlistList[index]['Add_card']
                                        ['desposit_price']
                                    .toString(),
                                style: textstyleHeading6(context)!.copyWith(
                                    fontSize: 16, fontWeight: fontWeight900),
                              ),
                            ],
                          ),
                          dividercontaner(context),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () async {
                                    print("click");
                                    await model.moveToCart(
                                        model.wishlistList[index]['Add_card']
                                            ['id'],
                                        model.wishlistList[index]['Add_card']
                                            ['module_type']);
                                    await model.wishListFatch(context);
                                    model.wishlistList[index]['Add_card']
                                            ['module_type']
                                        .toString();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'MOVE TO CART ->',
                                      style: TextStyle(
                                          color: colorpinklight,
                                          fontWeight: fontWeight500),
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              // ),
            );
          }),
    ),
  );
}
