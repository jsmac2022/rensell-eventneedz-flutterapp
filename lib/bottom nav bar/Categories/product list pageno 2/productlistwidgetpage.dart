// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print

import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/fillter/fillterpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/itemfulldetail_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/itemfulldetailspage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/view%20all%20grid%20one%20cat%20List%203/recomprodlistpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/view%20all%20grid%20one%20cat%20List%203/viewall_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlist_modelpage.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:provider/provider.dart';

Container filltersortwidget(BuildContext context, model, page) {
  return Container(
    color: colorWhite,
    height: 50,
    child: Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              // shortbottomsheet(context, model);
              shortbottomsheet2(context, model, page);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/icons/short.png')),
                sizedboxwidth(6.0),
                Text(
                  'Sort',
                  style: textstylesubtitle1(context),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              Get.to(() => FilterPage());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/icons/filter.png')),
                sizedboxwidth(6.0),
                Text(
                  'Filter',
                  style: textstylesubtitle1(context),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// short bottom sheat
Future<void> shortbottomsheet(context, model) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            color: colorWhite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Short By'),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: colorgrey,
                            ))
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  RadioGroup<String>.builder(
                    activeColor: colorpinklight,
                    horizontalAlignment: MainAxisAlignment.spaceAround,
                    groupValue: model.shortradio,
                    textStyle: textstylesubtitle1(context),
                    onChanged: (value) {
                      setState(() {
                        model.toogleradiobtn(value);
                      });
                    },
                    items: model.shortradioList,
                    itemBuilder: (item) => RadioButtonBuilder(item,
                        textPosition: RadioButtonTextPosition.left),
                  ),
                ],
              ),
            ),
          );
        });
      });
}

Future shortbottomsheet2(context, model, page) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: model.shortradioList.length,
              itemBuilder: (context, index) {
                return Container(
                  // height: 36,
                  color: colorgreylight,
                  margin: EdgeInsets.symmetric(vertical: 1),
                  child: RadioListTile(
                    dense: true,
                    value: index,
                    groupValue: model.listtileradiogroupvalue,
                    onChanged: (value) {
                      setState(() {
                        if (page == 'view all') {
                          Provider.of<ViewAllModelPage>(context, listen: false)
                              .toogleshortradiobtn(value);
                        } else {
                          model.toogleradiobtn(value);
                        }
                      });
                    },
                    title: Text(
                      model.shortradioList[index],
                      style: textstylesubtitle1(context),
                    ),
                    toggleable: true,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                );
              });
        });
      });
}

Widget recommendedList(context, model) {
  return Container(
    color: colorWhite,
    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        viewAllheading(
            context,
            'Recommended Products',
            'View All',
            RecomProdListPage(
              apptitle: 'Recommended Products',
              dataList: model.recomandedproductList,
            )),
        SizedBox(
          height: 380,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model.recomandedproductList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var stock = int.parse(model.recomandedproductList[index]
                    ['Product']['product_stock_info']);
                return InkWell(
                  onTap: () async {
                    final detailmodel = Provider.of<ItemFullDetailModelPage>(
                        context,
                        listen: false);
                    await detailmodel.setSelectedItemData(
                        model.recomandedproductList[index]);
                    await detailmodel
                        .setRecommandedList(model.recomandedproductList);
                    Get.to(() => ItemFullDetailsPage());
                  },
                  child: Container(
                    height: 380,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(border: borderCustom()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: colorgreylight,
                          width: 300,
                          height: 180,
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 300,
                                height: 180,
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
                              Positioned(
                                  right: 0,
                                  child: Consumer<WishListFavModelPage>(
                                      builder: (context, wmodel, _) {
                                    return IconButton(
                                        onPressed: () async {
                                          await wmodel.addperams(
                                              context,
                                              model.recomandedproductList[index]
                                                  ['Product']);
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
                                              wmodel.wishlistIDList.contains(
                                                      model.recomandedproductList[
                                                              index]['Product']
                                                          ['product_id'])
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: wmodel.wishlistIDList.contains(
                                                      model.recomandedproductList[
                                                              index]['Product']
                                                          ['product_id'])
                                                  ? Colors.pink
                                                  : Colors.pink,
                                              size: 20,
                                            ))));
                                  }))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sizedboxheight(2.0),
                              Text(
                                model.recomandedproductList[index]['Product']
                                        ['product_name']
                                    .toString(),
                                style: textstyleHeading6(context),
                              ),
                              Text(
                                model.recomandedproductList[index]['Product']
                                        ['selectList']
                                    .toString(),
                                style: textstyleHeading6(context),
                              ),
                              Text(
                                model.recomandedproductList[index]['Product']
                                        ['product_vendor']
                                    .toString(),
                                style: textstyleHeading6(context)!
                                    .copyWith(color: Colors.black45),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: colorredlightbtn,
                                        borderRadius:
                                            borderRadiuscircular(3.0)),
                                    child: Row(
                                      children: [
                                        /* Text(
                                          model.recomandedproductList[index]
                                                  ['Product']
                                                  ['product_rating']
                                              .toString(),
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  fontWeight: fontWeight400),
                                        ),*/
                                        Text(
                                          model.recomandedproductList[index]
                                                          ['Product']
                                                          ['product_rating']
                                                      .toString() ==
                                                  "0"
                                              ? "No Rating"
                                              : model
                                                  .recomandedproductList[index]
                                                      ['Product']
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
                                    '\u{20B9}${model.recomandedproductList[index]['Product']['product_amount'].toString()}',
                                    style: textstyleHeading6(context)!
                                        .copyWith(fontWeight: fontWeight900),
                                  ),
                                  sizedboxwidth(8.0),
                                  Text(
                                    '\u{20B9}${model.recomandedproductList[index]['Product']['product_flat_price'].toString()}',
                                    style: textstyleHeading6(context)!.copyWith(
                                        fontWeight: fontWeight400,
                                        fontSize: 16,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  Text(
                                    '${model.recomandedproductList[index]['Product']['product_offcer'].toString()}% OFF',
                                    style: textstyleHeading6(context)!
                                        .copyWith(color: Colors.black45),
                                  ),
                                ],
                              ),
                              model.recomandedproductList[index]['Product']
                                                  ['product_despoit']
                                              .toString() ==
                                          '' ||
                                      model.recomandedproductList[index]
                                                  ['Product']['product_despoit']
                                              .toString() ==
                                          '0'
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text(
                                          'Deposit :',
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  fontWeight: fontWeight400),
                                        ),
                                        Text(
                                          '\u{20B9}${model.recomandedproductList[index]['Product']['product_despoit'].toString()}',
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  fontWeight: fontWeight900),
                                        ),
                                      ],
                                    ),
                              model.recomandedproductList[index]['Product']
                                              ['product_valid_offer']
                                          .toString() ==
                                      'null'
                                  ? Container()
                                  : Text(
                                      'Order before ${model.recomandedproductList[index]['Product']['product_valid_offer'].toString()} days',
                                      style: textstyleHeading6(context)!
                                          .copyWith(color: Colors.black45),
                                    ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: colorredlightbtn,
                                  ),
                                  Text(
                                    model.recomandedproductList[index]
                                            ['Product']['product_verified']
                                        .toString(),
                                    style: model.recomandedproductList[index]
                                                    ['Product']
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
                                style: textstyleHeading6(context)!
                                    .copyWith(color: colorredlightbtn),
                              ),
                              sizedboxheight(2.0),
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

Widget viewAllheading(context, title, btnName, ontap) {
  return SizedBox(
    height: 50,
    // padding: EdgeInsets.symmetric(vertical: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textstyleHeading6(context)!.copyWith(fontSize: 18),
        ),
        Button(
          onPressed: () {
            Get.to(ontap);
          },
          btnfontsize: 15,
          btnWidth: 90,
          buttonName: btnName,
          borderRadius: borderRadiuscircular(3.0),
          btnHeight: 33,
        )
      ],
    ),
  );
}

Widget popularproductList(context, model) {
  return Container(
    color: colorWhite,
    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    // height: 500,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        viewAllheading(
            context,
            'Popular Products',
            'View All',
            RecomProdListPage(
              dataList: model.popularList,
              apptitle: 'Popular Product',
            )),
        SizedBox(
          height: 400,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: model.popularList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var stock = int.parse(
                  model.popularList[index]['Product']['product_stock_info']);
              return InkWell(
                onTap: () async {
                  final detailmodel = Provider.of<ItemFullDetailModelPage>(
                      context,
                      listen: false);
                  await detailmodel
                      .setSelectedItemData(model.popularList[index]);
                  await detailmodel
                      .setRecommandedList(model.recomandedproductList);
                  Get.to(() => ItemFullDetailsPage());
                },
                child: Container(
                  // width: 300,
                  height: 370,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(border: borderCustom()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: colorgreylight,
                        width: 300,
                        height: 180,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 300,
                              height: 180,
                              child: Image.network(
                                "$baseImagepath${model.popularList[index]['Product']['product_cover_image'][0].toString()}",
                                fit: BoxFit.fill,
                                errorBuilder:
                                    (context, exception, stackTrack) => Image(
                                        image:
                                            AssetImage('assets/images/db1.png'),
                                        fit: BoxFit.fill),
                                // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            Positioned(
                                right: 0,
                                child: Consumer<WishListFavModelPage>(
                                    builder: (context, wmodel, _) {
                                  return IconButton(
                                      onPressed: () async {
                                        await wmodel.addperams(
                                            context,
                                            model.popularList[index]
                                                ['Product']);
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
                                            wmodel.wishlistIDList.contains(model
                                                        .popularList[index]
                                                    ['Product']['product_id'])
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: wmodel.wishlistIDList
                                                    .contains(
                                                        model.popularList[index]
                                                                ['Product']
                                                            ['product_id'])
                                                ? Colors.pink
                                                : Colors.pink,
                                            size: 20,
                                          ))));
                                }))
                          ],
                        ),
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
                                model.popularList[index]['Product']
                                        ['product_name']
                                    .toString(),
                                style: textstyleHeading6(context),
                              ),
                              Text(
                                model.popularList[index]['Product']
                                        ['selectList']
                                    .toString(),
                                style: textstyleHeading6(context),
                              ),
                              Text(
                                model.popularList[index]['Product']
                                        ['product_vendor']
                                    .toString(),
                                style: textstyleHeading6(context)!
                                    .copyWith(color: Colors.black45),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: colorredlightbtn,
                                        borderRadius:
                                            borderRadiuscircular(3.0)),
                                    child: Row(
                                      children: [
                                        Text(
                                          model.productList[index]['Product']
                                                          ['product_rating']
                                                      .toString() ==
                                                  "0"
                                              ? "No Rating"
                                              : model.productList[index]
                                                      ['Product']
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
                                    '\u{20B9}${model.popularList[index]['Product']['product_amount'].toString()}',
                                    style: textstyleHeading6(context)!
                                        .copyWith(fontWeight: fontWeight900),
                                  ),
                                  sizedboxwidth(8.0),
                                  Text(
                                    '\u{20B9}${model.popularList[index]['Product']['product_flat_price'].toString()}',
                                    style: textstyleHeading6(context)!.copyWith(
                                        fontWeight: fontWeight400,
                                        fontSize: 16,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  Text(
                                    ' ${model.popularList[index]['Product']['product_offcer'].toString()}% OFF',
                                    style: textstyleHeading6(context)!
                                        .copyWith(color: Colors.black45),
                                  ),
                                ],
                              ),
                              model.popularList[index]['Product']
                                                  ['product_despoit']
                                              .toString() ==
                                          '' ||
                                      model.popularList[index]['Product']
                                                  ['product_despoit']
                                              .toString() ==
                                          '0'
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text(
                                          'Deposit :',
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  fontWeight: fontWeight400),
                                        ),
                                        Text(
                                          '\u{20B9}${model.popularList[index]['Product']['product_despoit'].toString()}',
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  fontWeight: fontWeight900),
                                        ),
                                      ],
                                    ),
                              model.popularList[index]['Product']
                                              ['product_valid_offer']
                                          .toString() ==
                                      'null'
                                  ? Container()
                                  : Text(
                                      'Order before ${model.popularList[index]['Product']['product_valid_offer'].toString()} days',
                                      style: textstyleHeading6(context)!
                                          .copyWith(color: Colors.black45),
                                    ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: colorredlightbtn,
                                  ),
                                  Text(
                                    model.popularList[index]['Product']
                                            ['product_verified']
                                        .toString(),
                                    style: model.popularList[index]['Product']
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
                                style: textstyleHeading6(context)!
                                    .copyWith(color: colorredlightbtn),
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
            },
          ),
        ),
      ],
    ),
  );
}

Widget productList11(context, model, page) {
  return Container(
    color: colorWhite,
    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    // height: 500,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        viewAllheading(
            context,
            page == 'details' ? 'Similar Products' : 'Product Lists',
            'View All',
            RecomProdListPage(
              dataList: model.productList,
              apptitle: 'Product List',
            )),
        SizedBox(
          height: 400,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: model.productList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var stock = int.parse(
                  model.productList[index]['Product']['product_stock_info']);
              return InkWell(
                onTap: () async {
                  final detailmodel = Provider.of<ItemFullDetailModelPage>(
                      context,
                      listen: false);
                  await detailmodel
                      .setSelectedItemData(model.productList[index]);
                  await detailmodel
                      .setRecommandedList(model.recomandedproductList);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemFullDetailsPage()),
                  );
                  // Get.to(() => ItemFullDetailsPage());
                },
                child: Container(
                  height: 370,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(border: borderCustom()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: colorgreylight,
                        width: 300,
                        height: 180,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 300,
                              height: 180,
                              child: Image.network(
                                "$baseImagepath${model.productList[index]['Product']['product_cover_image'][0].toString()}",

                                fit: BoxFit.fill,
                                errorBuilder:
                                    (context, exception, stackTrack) => Image(
                                        image:
                                            AssetImage('assets/images/db1.png'),
                                        fit: BoxFit.fill),
                                // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            Positioned(
                                right: 0,
                                child: Consumer<WishListFavModelPage>(
                                    builder: (context, wmodel, _) {
                                  return IconButton(
                                      onPressed: () async {
                                        await wmodel.addperams(
                                            context,
                                            model.productList[index]
                                                ['Product']);
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
                                            wmodel.wishlistIDList.contains(model
                                                        .productList[index]
                                                    ['Product']['product_id'])
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: wmodel.wishlistIDList
                                                    .contains(
                                                        model.productList[index]
                                                                ['Product']
                                                            ['product_id'])
                                                ? Colors.pink
                                                : Colors.pink,
                                            size: 20,
                                          ))));
                                }))
                          ],
                        ),
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
                                model.productList[index]['Product']
                                        ['product_name']
                                    .toString(),
                                style: textstyleHeading6(context),
                              ),
                              Text(
                                model.productList[index]['Product']
                                        ['selectList']
                                    .toString(),
                                style: textstyleHeading6(context),
                              ),
                              Text(
                                model.productList[index]['Product']
                                        ['product_vendor']
                                    .toString(),
                                style: textstyleHeading6(context)!
                                    .copyWith(color: Colors.black45),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: colorredlightbtn,
                                        borderRadius:
                                            borderRadiuscircular(3.0)),
                                    child: Row(
                                      children: [
                                        /* Text(
                                            // "No Rating"
                                            model.productList[index]['Product']
                                                    ['product_rating']
                                                .toString(),
                                            style: textstyleHeading6(context)!
                                                .copyWith(
                                                    fontWeight: fontWeight400),
                                          ),*/
                                        Text(
                                          model.productList[index]['Product']
                                                          ['product_rating']
                                                      .toString() ==
                                                  "0"
                                              ? "No Rating"
                                              : model.productList[index]
                                                      ['Product']
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
                                  //   '(12,835)',
                                  //   style: textstyleHeading6(context)!.copyWith(color: Colors.black45),
                                  // ),
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
                                    '\u{20B9}${model.productList[index]['Product']['product_amount'].toString()}',
                                    style: textstyleHeading6(context)!
                                        .copyWith(fontWeight: fontWeight900),
                                  ),
                                  sizedboxwidth(8.0),
                                  Text(
                                    '\u{20B9}${model.productList[index]['Product']['product_flat_price'].toString()}',
                                    style: textstyleHeading6(context)!.copyWith(
                                        fontWeight: fontWeight400,
                                        fontSize: 16,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  Text(
                                    ' ${model.productList[index]['Product']['product_offcer'].toString()}% OFF',
                                    style: textstyleHeading6(context)!
                                        .copyWith(color: Colors.black45),
                                  ),
                                ],
                              ),
                              model.productList[index]['Product']
                                                  ['product_despoit']
                                              .toString() ==
                                          '' ||
                                      model.productList[index]['Product']
                                                  ['product_despoit']
                                              .toString() ==
                                          '0'
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text(
                                          'Deposit :',
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  fontWeight: fontWeight400),
                                        ),
                                        Text(
                                          '\u{20B9}${model.productList[index]['Product']['product_despoit'].toString()}',
                                          style: textstyleHeading6(context)!
                                              .copyWith(
                                                  fontWeight: fontWeight900),
                                        ),
                                      ],
                                    ),
                              model.productList[index]['Product']
                                              ['product_valid_offer']
                                          .toString() ==
                                      'null'
                                  ? Container()
                                  : Text(
                                      'Order before ${model.productList[index]['Product']['product_valid_offer'].toString()} days',
                                      style: textstyleHeading6(context)!
                                          .copyWith(color: Colors.black45),
                                    ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: colorredlightbtn,
                                  ),
                                  Text(
                                    model.productList[index]['Product']
                                            ['product_verified']
                                        .toString(),
                                    style: model.productList[index]['Product']
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
                                style: textstyleHeading6(context)!
                                    .copyWith(color: colorredlightbtn),
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
            },
          ),
        ),
      ],
    ),
  );
}
