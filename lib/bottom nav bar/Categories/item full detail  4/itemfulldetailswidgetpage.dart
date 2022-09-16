// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/itemfulldetail_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/itemfulldetailspage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/livestriming.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/rate_review_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/product%20list%20pageno%202/productlist_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/product%20list%20pageno%202/productlistwidgetpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/view%20all%20grid%20one%20cat%20List%203/recomprodlistpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/dashboard/dashboardrentalmodelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlist_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlistpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/mycart/mycart_modelpage.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbarwidget.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/commonwidgets/commonwidgets.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget sliderdashboard(context, model) {
  return Container(
    color: colorWhite,
    child: Column(
      children: [
        CarouselSlider.builder(
          itemCount:
              model.selectedItemData['Product']['product_cover_image'].length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return SizedBox(
                width: deviceWidth(context, 1.0),
                child: Image.network(
                  "$baseImagepath${model.selectedItemData['Product']['product_cover_image'][itemIndex].toString()}",
                  fit: BoxFit.fill,
                ));
          },
          carouselController: model.buttonCarouselController,
          options: CarouselOptions(
            height: 280,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            viewportFraction: 1,
            aspectRatio: 16 / 10,
            initialPage: 0,
            onPageChanged: (index, reason) {
              model.valueset(index);
              // print('vinay11 ${model.activeindex}');
            },
          ),
        ),
        SizedBox(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              costumPageIndecatordb(model),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget costumPageIndecatordb(model) {
  return AnimatedSmoothIndicator(
      activeIndex: model.activeindex,
      count: model.selectedItemData['Product']['product_cover_image'].length,
      effect: ScrollingDotsEffect(
          activeStrokeWidth: 1.6,
          activeDotScale: 1.4,
          maxVisibleDots: 5,
          radius: 8,
          spacing: 8,
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: colorpinklight,
          dotColor: Colors.black12));
}

Widget itemDetails(context, model) {
  var stock =
      int.parse(model.selectedItemData['Product']['product_stock_info']);
  return Container(
    // height: 230,
    color: colorWhite,
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.selectedItemData['Product']['product_name'].toString(),
          style: textstyleHeading6(context),
        ),
        Text(
          model.selectedItemData['Product']['selectList'].toString(),
          style: textstyleHeading6(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.selectedItemData['Product']['product_vendor'].toString(),
              style:
                  textstyleHeading6(context)!.copyWith(color: Colors.black45),
            ),
            InkWell(
              onTap: () async {
                print(
                    'product_vendor_id widget ${model.selectedItemData['Product']['product_vendor_id']}');
                await model.selectVanderProductList(
                    model.selectedItemData['Product']['product_vendor_id']);
                print('vanderShopList widget ${model.vanderShopList}');
                print(
                    'vanderShopList length widget ${model.vanderShopList.length}');

                Get.to(() => RecomProdListPage(
                      dataList: model.vanderShopList,
                      apptitle: model.selectedItemData['Product']
                              ['product_vendor']
                          .toString(),
                    ));
              },
              child: Container(
                width: 77,
                height: 22,
                color: colorredlightbtn,
                child: Center(
                    child: Text('VIEW SHOP',
                        style: TextStyle(color: colorWhite, fontSize: 14))),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Price : ',
              style: textstyleHeading6(context)!
                  .copyWith(fontWeight: fontWeight400),
            ),
            Text(
              '\u{20B9}${model.selectedItemData['Product']['product_amount'].toString()}',
              style: textstyleHeading6(context)!
                  .copyWith(fontWeight: fontWeight900),
            ),
            sizedboxwidth(8.0),
            Text(
              '\u{20B9}${model.selectedItemData['Product']['product_flat_price'].toString()}',
              style: textstyleHeading6(context)!.copyWith(
                  fontWeight: fontWeight400,
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough),
            ),
            sizedboxwidth(5.0),
            Text(
              ' ${model.selectedItemData['Product']['product_offcer'].toString()}% OFF',
              style: textstyleHeading6(context)!
                  .copyWith(fontSize: 14, color: Colors.black45),
            ),
          ],
        ),
        model.selectedItemData['Product']['product_quantity'].toString() ==
                    '' ||
                model.selectedItemData['Product']['product_quantity']
                        .toString() ==
                    '0'
            ? Row(
                children: [
                  Text(
                    'Minimum Quantity :',
                    style: textstyleHeading6(context)!
                        .copyWith(fontWeight: fontWeight400),
                  ),
                  Text(
                    "1",
                    style: textstyleHeading6(context)!
                        .copyWith(fontWeight: fontWeight900),
                  ),
                ],
              )
            : Row(
                children: [
                  Text(
                    'Minimum Quantity :',
                    style: textstyleHeading6(context)!
                        .copyWith(fontWeight: fontWeight400),
                  ),
                  Text(
                    model.selectedItemData['Product']
                            ['product_minimum_order_quantity']
                        .toString(),
                    style: textstyleHeading6(context)!
                        .copyWith(fontWeight: fontWeight900),
                  ),
                ],
              ),
        model.selectedItemData['Product']['product_despoit'].toString() == '' ||
                model.selectedItemData['Product']['product_despoit']
                        .toString() ==
                    '0'
            ? Container()
            : Row(
                children: [
                  Text(
                    'Deposit :',
                    style: textstyleHeading6(context)!
                        .copyWith(fontWeight: fontWeight400),
                  ),
                  Text(
                    model.selectedItemData['Product']['product_despoit']
                        .toString(),
                    style: textstyleHeading6(context)!
                        .copyWith(fontWeight: fontWeight900),
                  ),
                ],
              ),
        model.selectedItemData['Product']['product_valid_offer'].toString() ==
                'null'
            ? Container()
            : Text(
                'Order before ${model.selectedItemData['Product']['product_valid_offer'].toString()} days',
                style:
                    textstyleHeading6(context)!.copyWith(color: Colors.black45),
              ),
        Row(
          children: [
            Icon(
              Icons.check,
              color: colorredlightbtn,
            ),
            Text(
              model.selectedItemData['Product']['product_verified'].toString(),
              style: model.selectedItemData['Product']['product_verified']
                          .toString() ==
                      "UnVerified"
                  ? textstyleHeading6(context)!.copyWith(color: Colors.pink)
                  : textstyleHeading6(context)!.copyWith(color: colorgreen),
            ),
          ],
        ),
        Text(
          stock > 0 ? 'Stock Available' : 'Not Available',
          style: textstyleHeading6(context)!.copyWith(color: colorredlightbtn),
        ),
        dividerHorizontalblack(context),
        Column(
          children: [
            sizedboxheight(1.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    model.selectedItemData['Product']['product_rating']
                                    .toString() ==
                                '' ||
                            model.selectedItemData['Product']['product_rating']
                                    .toString() ==
                                'null'
                        ? Container()
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            decoration: BoxDecoration(
                                color: colorredlightbtn,
                                borderRadius: borderRadiuscircular(3.0)),
                            child: Row(
                              children: [
                                Text(
                                  model.selectedItemData['Product']
                                          ['product_rating']
                                      .toString(),
                                  style: textstylesubtitle1(context)!
                                      .copyWith(color: colorWhite),
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
                    model.selectedItemData['Product']['product_all_rating']
                                    .toString() ==
                                '' ||
                            model.selectedItemData['Product']
                                        ['product_all_rating']
                                    .toString() ==
                                'null'
                        ? Container()
                        : Text(
                            model.selectedItemData['Product']
                                    ['product_all_rating']
                                .toString(),
                            style: textstylesubtitle1(context)!.copyWith(
                                fontWeight: fontWeight600,
                                color: Colors.black45),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Live Viewed:',
                      style: textstylesubtitle1(context)!.copyWith(
                          fontWeight: fontWeight600, color: Colors.black45),
                    ),
                    Consumer<LiveStrimingModelPage>(
                        builder: (context, controller, _) {
                      return Container(
                        width: 27,
                        height: 24,
                        color: Colors.green,
                        child: Center(
                            child: Text(
                          controller.productTotalView.toString(),
                          style: TextStyle(
                            color: colorWhite,
                          ),
                        )),
                      );
                    })
                  ],
                )
              ],
            ),
            sizedboxheight(2.0),
          ],
        ),
      ],
    ),
  );
}

// Widget sameProductShortBy(context) {
//   return Container(
//       height: 170,
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//       color: colorWhite,
//       child: Column(children: [
//         SizedBox(
//           height: 45,
//           // padding: EdgeInsets.symmetric(vertical: 15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Same Products',
//                 style: textstyleHeading6(context)!.copyWith(fontSize: 18),
//               ),
//               Button(
//                 onPressed: () {
//                   // Get.to(ontap);
//                 },
//                 btnfontsize: 15,
//                 btnWidth: 90,
//                 buttonName: 'Sort By',
//                 borderRadius: borderRadiuscircular(3.0),
//                 btnHeight: 33,
//               )
//             ],
//           ),
//         ),
//         sizedboxheight(5.0),
//         Padding(
//           padding: const EdgeInsets.only(left: 3),
//           child: Table(columnWidths: {
//             0: IntrinsicColumnWidth(flex: 1.25)
//           }, children: [
//             TableRow(
//                 decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: colorgrey))),
//                 children: [
//                   sameProHeading(context, 'Name'),
//                   sameProHeading(context, 'Price'),
//                   sameProHeading(context, 'Distance'),
//                   sameProHeading(context, 'Rating'),
//                 ]),
//             TableRow(children: [
//               sameProcontaint(context, 'Traditional\n Decorators'),
//               sameProcontaint(context, '\u{20B9} 75000'),
//               sameProcontaintcenter(context, '3.4 km'),
//               sameProcontaintcenter(context, '3.8'),
//             ]),
//             TableRow(
//                 decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: colorgrey))),
//                 children: [
//                   sameProcontaint(context, 'RR Decorators'),
//                   sameProcontaint(context, '\u{20B9}50000'),
//                   sameProcontaintcenter(context, '4.4 km'),
//                   sameProcontaintcenter(context, '4.2'),
//                 ]),
//             TableRow(children: [
//               sameProcontaint(context, 'BirdNBites'),
//               sameProcontaint(context, '\u{20B9}1000000'),
//               sameProcontaintcenter(context, '4.2 Km'),
//               sameProcontaintcenter(context, '3.6'),
//             ]),
//           ]),
//         ),
//       ]));
// }

// Widget sameProHeading(context, text) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 10, top: 3, bottom: 3),
//     child: Text(
//       text,
//       style: textstylesubtitle1(context)!.copyWith(fontWeight: fontWeight600),
//     ),
//   );
// }

// Widget sameProcontaint(context, text) {
//   return Padding(
//     padding: const EdgeInsets.only(top: 3, bottom: 3),
//     child: Text(
//       text,
//       overflow: TextOverflow.ellipsis,
//       maxLines: 2,
//       textAlign: TextAlign.left,
//       style: textstylesubtitle1(context),
//     ),
//   );
// }

// Widget sameProcontaintcenter(context, text) {
//   return Padding(
//     padding: const EdgeInsets.only(top: 3, bottom: 3, left: 15),
//     child: Text(
//       text,
//       textAlign: TextAlign.left,
//       overflow: TextOverflow.ellipsis,
//       maxLines: 2,
//       style: textstylesubtitle1(context),
//     ),
//   );
// }

Widget addTocartbtn(BuildContext context, model) {
  return Row(
    children: [
      Button(
        onPressed: () async {
          await Provider.of<WishListFavModelPage>(context, listen: false)
              .addperams(context, model.selectedItemData['Product']);
          Get.to(() => WishlistPage());
        },
        btnWidth: deviceWidth(context, 0.5),
        buttonName: 'FAVOURITE',
        imageAsset: Icon(
          Icons.favorite_border,
          size: 20,
        ),
        borderRadius: borderRadiuscircular(0.0),
        textColor: colorblack,
        btnColor: colorWhite,
      ),
      Button(
        onPressed: () async {
          await Provider.of<MyCartModelPage>(context, listen: false)
              .addperams(model.selectedItemData['Product']);
          await Provider.of<MyCartModelPage>(context, listen: false)
              .crtListAddItem(context);
        },
        btnWidth: deviceWidth(context, 0.5),
        buttonName: 'ADD TO CART',
        imageAsset: Icon(
          Icons.shopping_cart_rounded,
          size: 18,
          color: colorWhite,
        ),
        borderRadius: borderRadiuscircular(0.0),
      )
    ],
  );
}

Container enterpinbtn(BuildContext context) {
  return Container(
    color: colorWhite,
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: colorredlightbtn,
              size: 16,
            ),
            sizedboxwidth(3.0),
            Text(
              'Deliver to',
              style: textstyleHeading6(context),
            )
          ],
        ),
        InkWell(
          onTap: () {
            showFlutterToast('Coming soon...');
          },
          child: Container(
            width: 100,
            height: 28,
            color: colorredlightbtn,
            child: Center(
                child: Text('Enter Pincode',
                    style: TextStyle(color: colorWhite, fontSize: 16))),
          ),
        ),
      ],
    ),
  );
}

Container productdiscription(BuildContext context, model) {
  return Container(
    width: deviceWidth(context),
    color: colorWhite,
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: headingperawidget(
      context,
      'Product Description',
      model.selectedItemData['Product']['product_description'].toString(),
    ),
  );
}

Widget ratingandreview(BuildContext context, model) {
  return Consumer<RateReviewModelPage>(builder: (context, rmodel, _) {
    return rmodel.totalRatingCount == 0
        ? Container(
            color: colorWhite,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [rateproductbtn(context, model)]))
        : Container(
            color: colorWhite,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                rateproductbtn(context, model),
                rmodel.totalRatingCount == 0
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    // "4.0",
                                    rmodel.totalRating.toString(),
                                    style: TextStyle(fontSize: 47),
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: colorredlightbtn,
                                      ),
                                      sizedboxheight(7.0)
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                '${rmodel.totalRatingCount} Ratings & \n ${rmodel.productReviewCOUNTMap['total_review'].toString()} Reviews',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                          sizedboxwidth(2.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  print(
                                      " Revirewvvhjjhj${rmodel.productReviewCOUNTMap['rating_5'] / rmodel.productReviewCOUNTMap['total_review']}");
                                },
                                child: ratingreviewget(
                                    context,
                                    '5',
                                    (rmodel.productReviewCOUNTMap['rating_5'] /
                                        rmodel.productReviewCOUNTMap[
                                            'total_review']),
                                    Colors.green,
                                    rmodel.productReviewCOUNTMap['rating_5']
                                        .toString()),
                              ),
                              ratingreviewget(
                                  context,
                                  '4',
                                  (rmodel.productReviewCOUNTMap['rating_4'] /
                                      rmodel.productReviewCOUNTMap[
                                          'total_review']),
                                  Colors.green,
                                  rmodel.productReviewCOUNTMap['rating_4']
                                      .toString()),
                              ratingreviewget(
                                  context,
                                  '3',
                                  (rmodel.productReviewCOUNTMap['rating_3'] /
                                      rmodel.productReviewCOUNTMap[
                                          'total_review']),
                                  Colors.green,
                                  rmodel.productReviewCOUNTMap['rating_3']
                                      .toString()),
                              ratingreviewget(
                                  context,
                                  '2',
                                  (rmodel.productReviewCOUNTMap['rating_2'] /
                                      rmodel.productReviewCOUNTMap[
                                          'total_review']),
                                  Colors.yellow,
                                  rmodel.productReviewCOUNTMap['rating_2']
                                      .toString()),
                              ratingreviewget(
                                  context,
                                  '1',
                                  (rmodel.productReviewCOUNTMap['rating_1'] /
                                      rmodel.productReviewCOUNTMap[
                                          'total_review']),
                                  Colors.yellow,
                                  rmodel.productReviewCOUNTMap['rating_1']
                                      .toString()),
                            ],
                          ),
                        ],
                      ),
              ],
            ),
          );
  });
}

Container rateproductbtn(BuildContext context, model) {
  return Container(
    color: colorWhite,
    padding: EdgeInsets.symmetric(vertical: 8),
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Ratings & Reviews',
          style: textstyleHeading6(context),
        ),
        InkWell(
          onTap: () async {
            await Provider.of<RateReviewModelPage>(context, listen: false)
                .setProductId(model.selectedItemData['Product']);
          },
          child: Container(
            width: 100,
            height: 28,
            color: colorredlightbtn,
            child: Center(
                child: Text('Rate Product',
                    style: TextStyle(color: colorWhite, fontSize: 16))),
          ),
        ),
      ],
    ),
  );
}

Widget ratingreviewget(context, star, value, color, review) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          Text(
            star,
            style: TextStyle(fontSize: 18),
          ),
          sizedboxwidth(2.0),
          Icon(
            Icons.star,
            color: Colors.black38,
            size: 18,
          ),
          sizedboxwidth(2.0),
          SizedBox(
              width: deviceWidth(context, 0.4),
              child: ClipRRect(
                  borderRadius: borderRadiuscircular(10.0),
                  child: LinearProgressIndicator(
                      minHeight: 5,
                      backgroundColor: colorgrey,
                      value: value,
                      valueColor: AlwaysStoppedAnimation<Color>(color)))),
          sizedboxwidth(6.0),
        ],
      ),
      Text(
        review,
        style: TextStyle(fontSize: 18),
      )
    ],
  );
}

Widget customerphoto(context) {
  return Consumer<RateReviewModelPage>(builder: (context, rmodel, _) {
    return rmodel.pRImageList.isEmpty
        ? Container()
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: colorWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedboxheight(20.0),
                headingscustomwidget(context,
                    'Customer Photos (${rmodel.pRImageList.length.toString()})'),
                sizedboxheight(10.0),
                SizedBox(
                  width: deviceWidth(context),
                  height: 90,
                  child: ListView.builder(
                      itemCount: rmodel.pRImageList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          color: colorWhite,
                          width: 90,
                          height: 110,
                          child: Image.network(
                            '$baseImagepath${rmodel.pRImageList[index].toString()}',
                            fit: BoxFit.cover,
                            errorBuilder: (context, exception, stackTrack) =>
                                Center(
                                    child: Image(
                                        image:
                                            AssetImage('assets/images/db1.png'),
                                        fit: BoxFit.cover)),
                            // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
  });
}

Widget costumerreview(context) {
  return Consumer<RateReviewModelPage>(builder: (context, rmodel, _) {
    return rmodel.productReviewList.isEmpty
        ? Container()
        : Container(
            color: colorWhite,
            padding: EdgeInsets.symmetric(horizontal: 15),
            // height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedboxheight(20.0),
                headingscustomwidget(context,
                    'Customer Reviews (${rmodel.productReviewList.length.toString()})'),
                ListView.builder(
                    itemCount: rmodel.productReviewList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizedboxheight(16.0),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 5),
                                decoration: BoxDecoration(
                                    color: colorgreendark,
                                    borderRadius: borderRadiuscircular(5.0)),
                                child: Row(
                                  children: [
                                    Text(
                                      rmodel.productReviewList[index]
                                              ['Product_review']['rating']
                                          .toString(),
                                      style: textstylesubtitle1(context)!
                                          .copyWith(
                                              color: colorWhite, fontSize: 16),
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
                              //   '400 Ratings,',
                              //   style: textstyleHeading3(context)!.copyWith(
                              //     fontWeight: fontWeight600,
                              //   ),
                              // ),
                            ],
                          ),
                          sizedboxheight(7.0),
                          Text(
                            rmodel.productReviewList[index]['Product_review']
                                    ['message']
                                .toString(),
                            style: textstylesubtitle1(context),
                          ),
                          sizedboxheight(3.0),
                          rmodel.productReviewList[index]['Product_review']
                                              ['image']
                                          .toString() ==
                                      'null' ||
                                  rmodel.productReviewList[index]
                                              ['Product_review']['image']
                                          .toString() ==
                                      ''
                              ? Container()
                              : SizedBox(
                                  width: deviceWidth(context),
                                  height: 90,
                                  child: ListView.builder(
                                      itemCount: 1,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        return Container(
                                          margin: EdgeInsets.only(right: 10),
                                          color: colorWhite,
                                          width: 90,
                                          height: 110,
                                          child: Image.network(
                                            '$baseImagepath${rmodel.productReviewList[index]['Product_review']['image'].toString()}',
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, exception,
                                                    stackTrack) =>
                                                Center(
                                                    child: Image(
                                                        image: AssetImage(
                                                            'assets/images/db1.png'),
                                                        fit: BoxFit.cover)),
                                            // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                                          ),
                                        );
                                      }),
                                ),
                          sizedboxheight(7.0),
                          // Text(
                          //   'Vijay Kumar, Hyderabad',
                          //   style: textstylesubtitle1(context),
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Checkbox(
                          //           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          //           shape: CircleBorder(),
                          //           // value: model.checkboxvalue,
                          //           value: true,
                          //           onChanged: (value) {
                          //             // model.toggleCheckbox();
                          //           },
                          //           activeColor: colorgreendark,
                          //         ),
                          //         Text(
                          //           'Certified Buyer',
                          //           overflow: TextOverflow.ellipsis,
                          //           maxLines: 2,
                          //           style: textstylesubtitle1(context),
                          //         ),
                          //       ],
                          //     ),
                          //     Text(
                          //       '1 week ago',
                          //       overflow: TextOverflow.ellipsis,
                          //       maxLines: 2,
                          //       style: textstylesubtitle1(context),
                          //     ),
                          //     sizedboxwidth(3.0),
                          //     Row(
                          //       children: [
                          //         Image(image: AssetImage('assets/icons/like.png')),
                          //         sizedboxwidth(3.0),
                          //         Text('15', style: textstylesubtitle1(context)),
                          //         sizedboxwidth(8.0),
                          //         Image(
                          //           image: AssetImage('assets/icons/dislike.png'),
                          //         ),
                          //         sizedboxwidth(3.0),
                          //         Text('1', style: textstylesubtitle1(context)),
                          //       ],
                          //     ),
                          //     sizedboxwidth(3.0),
                          //   ],
                          // ),
                          dividerHorizontal(context, 0.9, 1.0)
                        ],
                      );
                    }),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(50, 30),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {},
                  child: Text(
                    'View all reviews',
                    style: textstyleHeading6(context)!
                        .copyWith(fontSize: 16, color: colorredlightbtn),
                  ),
                ),
              ],
            ),
          );
  });
}

//more products button
Widget moreProductbtn(context, model) {
  return InkWell(
    onTap: () {
      Get.to(() => RecomProdListPage(
            dataList: model.vanderShopList,
            apptitle:
                '${model.selectedItemData['Product']['product_vendor'].toString()}\n${model.vanderShopList.length.toString()} items',
          ));
    },
    child: Container(
      color: colorWhite,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'More Products by ${model.selectedItemData['Product']['product_vendor'].toString()}',
              style: textstyleHeading6(context),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 18,
          ),
        ],
      ),
    ),
  );
}

//your  intersted widget
Widget yourIntestedwidget(context) {
  return Container(
    color: colorWhite,
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'You might be interested in',
            style: textstyleHeading6(context)!.copyWith(fontSize: 16),
          ),
        ),
        Consumer<DashboardModelPage>(builder: (context, dbcontroller, _) {
          return ListView.builder(
              physics: ScrollPhysics(),
              itemCount: dbcontroller.categoriesList.length >= 4
                  ? 4
                  : dbcontroller.categoriesList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        final pmodel = Provider.of<ProductListModelPage>(
                            context,
                            listen: false);

                        await pmodel.productFatchforDpage(
                            context,
                            dbcontroller.categoriesList[index]['category']
                                ['id']);

                        Get.to(() => RecomProdListPage(
                              apptitle: 'Recently View',
                              dataList: pmodel.productListDpage,
                            ));
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(right: 8, top: 7, bottom: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: deviceWidth(context, 0.28),
                                  height: 80,
                                  child: Image.network(
                                    '$baseImagepath${dbcontroller.categoriesList[index]['category']['image'].toString()}',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, exception,
                                            stackTrack) =>
                                        Center(
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/images/db1.png'),
                                                fit: BoxFit.cover)),
                                    // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                                  ),
                                ),
                                sizedboxwidth(7.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dbcontroller.categoriesList[index]
                                              ['category']['name']
                                          .toString(),
                                      style: textstylesubtitle1(context)!
                                          .copyWith(fontWeight: fontWeight600),
                                    ),
                                    sizedboxheight(3.0),
                                    // Text(
                                    //   "Min 10%",
                                    //   style: textstylesubtitle2(context)!.copyWith(color: colorpinklight),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            Center(
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                              ),
                            ),
                            //  sizedboxwidth(2.0),
                          ],
                        ),
                      ),
                    ),
                    index == 3 ? Container() : dividercontaner(context)
                  ],
                );
              });
        }),
      ],
    ),
  );
}

//recently view
Widget recentlyViewed(context, model) {
  return model.recentviewproductList.length == 0
      ? Container()
      : Container(
          color: colorWhite,
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          height: 315,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              viewAllheading(
                  context,
                  'Recently Viewed',
                  'View All',
                  RecomProdListPage(
                    apptitle: 'Recently View',
                    dataList: model.recentviewproductList,
                  )),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.recentviewproductList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (() async {
                          final detailmodel =
                              Provider.of<ItemFullDetailModelPage>(context,
                                  listen: false);
                          await detailmodel.setSelectedItemData(
                              model.recentviewproductList[index]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemFullDetailsPage()));
                        }),
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(border: borderCustom()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 270,
                                height: 160,
                                child: Image.network(
                                  "$baseImagepath${model.recentviewproductList[index]['Product']['product_cover_image'][0].toString()}",

                                  fit: BoxFit.fill,
                                  errorBuilder:
                                      (context, exception, stackTrack) => Image(
                                          image: AssetImage(
                                              'assets/images/db1.png'),
                                          fit: BoxFit.fill),
                                  // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.recentviewproductList[index]
                                              ['Product']['product_name']
                                          .toString(),
                                      style: textstyleHeading6(context)!
                                          .copyWith(fontSize: 17),
                                    ),
                                    sizedboxheight(3.0),
                                    Text(
                                      model.recentviewproductList[index]
                                              ['Product']['product_vendor']
                                          .toString(),
                                      style: textstylesubtitle1(context),
                                    ),
                                    sizedboxheight(3.0),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            model.resetREcentView();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ItemFullDetailsPage()),
                                            );
                                          },
                                          child: Text(
                                            'Price : ',
                                            style: textstylesubtitle1(context),
                                          ),
                                        ),
                                        Text(
                                          '\u{20B9}${model.recentviewproductList[index]['Product']['product_amount'].toString()}',
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  fontWeight: fontWeight900),
                                        ),
                                        sizedboxwidth(8.0),
                                        Text(
                                          '\u{20B9}${model.recentviewproductList[index]['Product']['product_flat_price'].toString()}',
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  fontWeight: fontWeight400,
                                                  fontSize: 16,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        ),
                                        Text(
                                          ' ${model.recentviewproductList[index]['Product']['product_offcer'].toString()}% OFF',
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    // sizedboxheight(3.0),
                                    model.recentviewproductList[index]
                                                        ['Product']
                                                        ['product_despoit']
                                                    .toString() ==
                                                '' ||
                                            model.recentviewproductList[index]
                                                        ['Product']
                                                        ['product_despoit']
                                                    .toString() ==
                                                '0'
                                        ? Container()
                                        : Row(
                                            children: [
                                              Text(
                                                'Deposit :',
                                                style:
                                                    textstylesubtitle1(context),
                                              ),
                                              Text(
                                                '\u{20B9}${model.recentviewproductList[index]['Product']['product_despoit'].toString()}',
                                                style:
                                                    textstyleHeading3(context)!
                                                        .copyWith(fontSize: 17),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
}

Widget recommanded(context, model) {
  return model.recomandedproductList.length == 0
      ? Container()
      : Container(
          color: colorWhite,
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          height: 315,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              viewAllheading(
                  context,
                  'Recommended',
                  'View All',
                  RecomProdListPage(
                    apptitle: 'Recommended',
                    dataList: model.recomandedproductList,
                  )),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.recomandedproductList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (() async {
                          final detailmodel =
                              Provider.of<ItemFullDetailModelPage>(context,
                                  listen: false);
                          await detailmodel.setSelectedItemData(
                              model.recomandedproductList[index]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemFullDetailsPage()));
                        }),
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(border: borderCustom()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 270,
                                height: 160,
                                child: Image.network(
                                  "$baseImagepath${model.recomandedproductList[index]['Product']['product_cover_image'][0].toString()}",

                                  fit: BoxFit.fill,
                                  errorBuilder:
                                      (context, exception, stackTrack) => Image(
                                          image: AssetImage(
                                              'assets/images/db1.png'),
                                          fit: BoxFit.fill),
                                  // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.recomandedproductList[index]
                                              ['Product']['product_name']
                                          .toString(),
                                      style: textstyleHeading6(context)!
                                          .copyWith(fontSize: 17),
                                    ),
                                    sizedboxheight(3.0),
                                    Text(
                                      model.recomandedproductList[index]
                                              ['Product']['product_vendor']
                                          .toString(),
                                      style: textstylesubtitle1(context),
                                    ),
                                    sizedboxheight(3.0),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            model.resetREcentView();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ItemFullDetailsPage()),
                                            );
                                          },
                                          child: Text(
                                            'Price : ',
                                            style: textstylesubtitle1(context),
                                          ),
                                        ),
                                        Text(
                                          '\u{20B9}${model.recomandedproductList[index]['Product']['product_amount'].toString()}',
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  fontWeight: fontWeight900),
                                        ),
                                        sizedboxwidth(8.0),
                                        Text(
                                          '\u{20B9}${model.recomandedproductList[index]['Product']['product_flat_price'].toString()}',
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  fontWeight: fontWeight400,
                                                  fontSize: 16,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        ),
                                        Text(
                                          ' ${model.recomandedproductList[index]['Product']['product_offcer'].toString()}% OFF',
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    // sizedboxheight(3.0),
                                    model.recomandedproductList[index]
                                                        ['Product']
                                                        ['product_despoit']
                                                    .toString() ==
                                                '' ||
                                            model.recomandedproductList[index]
                                                        ['Product']
                                                        ['product_despoit']
                                                    .toString() ==
                                                '0'
                                        ? Container()
                                        : Row(
                                            children: [
                                              Text(
                                                'Deposit :',
                                                style:
                                                    textstylesubtitle1(context),
                                              ),
                                              Text(
                                                '\u{20B9}${model.recomandedproductList[index]['Product']['product_despoit'].toString()}',
                                                style:
                                                    textstyleHeading3(context)!
                                                        .copyWith(fontSize: 17),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
}
