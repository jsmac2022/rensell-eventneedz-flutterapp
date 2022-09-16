// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/bottom%20nav%20bar/menu/mayorder/myorder_itemdetails/myorder_itemdetails_page.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbar.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbar_modelpage.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbarwidget.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/formtextfield/mytextfield.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:provider/provider.dart';

Widget getSearchBar(context) {
  return Container(
    decoration:
        BoxDecoration(border: Border.all(color: colorblack54, width: 0.005)),
    child: InkWell(
      onTap: () {
        //  Get.to(() => MapPage());
      },
      child: AllInputDesign(
        widthtextfield: deviceWidth(context, 0.9),
        key: Key("search"),
        hintText: 'Search by Customer, Product or Order Id',
        textInputAction: TextInputAction.done,
        inputLableColor: colorgrey,
        prefixIcon: Icon(Icons.search),
      ),
    ),
  );
}

Widget orderlistshowtypebtn(context, text) {
  return Container(
    margin: EdgeInsets.only(right: 10.0, bottom: 5, top: 5),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
        color: colorgreylight, borderRadius: borderRadiuscircular(16.0)),
    child: Text(
      text,
      style: textstylesubtitle1(context)!.copyWith(color: colorgrey),
    ),
  );
}

// Widget multiselect(_items, _selectedAnimals4) {
//   return StatefulBuilder(builder: (context, setState) {
//     return MultiSelectChipField(
//       title: Text(
//         "",
//         style: textstyleHeading2(context)!.copyWith(fontWeight: fontWeight900, fontSize: 1),
//       ),
//       textStyle: TextStyle(color: colorgrey, fontSize: 14),
//       scroll: false,
//       items: _items,
//       initialValue: [],
//       chipShape: StadiumBorder(side: BorderSide(color: colorgreylight)),
//       headerColor: Colors.white,
//       decoration: BoxDecoration(
//           // border: Border.all(color: Colors.white, width: 0.8),
//           ),
//       chipColor: colorgreylight,
//       selectedChipColor: colorpinklight,
//       selectedTextStyle: TextStyle(color: Colors.white, fontSize: 14),
//       onTap: (values) {},
//     );
//   });
// }

Widget orderplacedList(context, model) {
  return Flexible(
    fit: FlexFit.loose,
    child: Card(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.oredertimeradio,
                  style:
                      textstylesubtitle1(context)!.copyWith(color: colorblack),
                ),
                TextButton(
                  onPressed: () {
                    changeordertimebottomsheet(context, model);
                  },
                  child: Text(
                    'Change',
                    style: textstylesubtitle1(context)!
                        .copyWith(color: colorpinklight),
                  ),
                )
              ],
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    model.orderitemList.isEmpty
                        ? noOrederPlaced(context)
                        : orderitemlistview(context, model)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

// no order then this widget show
Widget noOrederPlaced(context) {
  return Column(
    children: [
      sizedboxheight(36.0),
      Image.asset(
        'assets/icons/shoping.png',
        scale: 1.2,
      ),
      sizedboxheight(10.0),
      Text(
        'No Orders Placed',
        style: textstylesubtitle1(context)!.copyWith(color: colorblack54),
      ),
      sizedboxheight(40.0),
      continusShopingBtn(context)
    ],
  );
}

Widget continusShopingBtn(context) {
  return Button(
    borderRadius: BorderRadius.circular(0.1),
    buttonName: 'Continue Shoping',
    key: Key('Continus Shoping'),
    onPressed: () async {
      await Provider.of<BottomnavbarModelPage>(context, listen: false)
          .togglebottomindexreset();
      Get.to(() => BottomNavBarPage());
    },
  );
}

//bottom sheat
Future<void> changeordertimebottomsheet(context, model) {
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
                        Text('Order Time'),
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
                    horizontalAlignment: MainAxisAlignment.start,
                    groupValue: model.oredertimeradio,
                    textStyle: textstylesubtitle1(context),
                    onChanged: (value) {
                      setState(() {
                        model.toogleradiobtn(value);
                      });
                    },
                    items: model.oredertimeradioList,
                    itemBuilder: (item) => RadioButtonBuilder(
                      item,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      });
}

// bottom sheat widget  buy item
Widget orderitemlistview(context, model) {
  return ListView.builder(
      physics: ScrollPhysics(),
      itemCount: model.orderitemList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => MyorderItemDetailspage(
                          data: model.orderitemList[index]['Booking'],
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: deviceWidth(context, 0.3),
                            child: Image.network(
                              // model.orderitemList[index]['Booking']
                              //         ['product_image_url']
                              //     .toString(),

                              '$baseImagepath${model.orderitemList[index]['Booking']['product_image_url'].toString()}',

                              // 'assets/images/db1.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          sizedboxwidth(7.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.orderitemList[index]['Booking']
                                        ['product_name']
                                    .toString(),
                                style: textstylesubtitle1(context)!
                                    .copyWith(fontWeight: fontWeight600),
                              ),
                              sizedboxheight(5.0),
                              Text(
                                model.orderitemList[index]['Booking']
                                        ['vendor_name']
                                    .toString(),
                                style: textstylesubtitle2(context),
                              ),
                              sizedboxheight(5.0),
                              Text(
                                "Delivered on 13 sep 2021",
                                style: textstylesubtitle1(context)!
                                    .copyWith(fontWeight: fontWeight600),
                              ),
                              sizedboxheight(5.0),
                              Text(
                                "Write a Review",
                                style: textstylesubtitle2(context)!
                                    .copyWith(color: colorpinklight),
                              ),
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
                model.orderitemList.length == index + 1
                    ? Container()
                    : Column(
                        children: [
                          sizedboxheight(7.0),
                          dividercontaner(context),
                        ],
                      ),
              ],
            ),
          ),
        );
      });
}
