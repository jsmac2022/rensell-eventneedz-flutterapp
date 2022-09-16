// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:eventneedz/bottom%20nav%20bar/Categories/view%20all%20grid%20one%20cat%20List%203/recomprodlistpage.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// ----- LEFT SIDE FILTER BUTTON GROUP ---------
Widget filterbtnscolumn(context, model) {
  return SizedBox(
    width: deviceWidth(context, 0.35),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: model.filterkeybtnname.length,
            itemBuilder: (context, index) {
              return Container(
                color: model.showFilterValues == index
                    ? colorWhite
                    : colorgreylight,
                child: InkWell(
                  onTap: () async {
                    await model.filterbtnkeyTap(index);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 48,
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                model.filterkeybtnname[index],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textstylesubtitle1(context)!
                                    .copyWith(fontWeight: fontWeight600),
                              ),
                            ],
                          )),
                      dividerHorizontalblack(context),
                    ],
                  ),
                ),
              );
            }),
      ],
    ),
  );
}

// ------ right side checkbox -----
Widget filterValuecolumn(context, model) {
  return Expanded(
    child: Container(
      color: colorWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (model.showFilterValues == 0) ...[
            checkboxFilterPrice(context, model, model.filterpriceValues,
                model.toggleCheckboxprice),
          ] else if (model.showFilterValues == 1) ...[
            checkboxFilterPrice(context, model, model.filtercusRValues,
                model.toggleCheckboxcustomerRating),
            // ] else if (model.showFilterValues == 20) ...[
            //   checkboxFilterPrice(context, model, model.filterOfferRValues,
            //       model.toggleCheckboxOffer),
          ] else if (model.showFilterValues == 2) ...[
            checkboxFilterPrice(context, model, model.filterdiscountValues,
                model.toggleCheckboxdiscount),
            // ] else if (model.showFilterValues == 40) ...[
            //   checkboxFilterPrice(context, model, model.filterbudgetValues,
            //       model.toggleCheckboxbudget),
          ] else if (model.showFilterValues == 3) ...[
            checkboxFilterPrice(context, model, model.filteravailabilityValues,
                model.toggleCheckboxavailability),
          ]
        ],
      ),
    ),
  );
}

Widget checkboxFilterPrice(context, model, valueList, ontap) {
  return ListView.builder(
      itemCount: valueList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        //   print('vinay price ${model.selectmulti.toString()}');
        //   print('vinay cr ${model.selectmultiCustomerR.toString()}');
        // print('vinay offer ${model.selectmultiOffer.toString()}');
        // print('vinay discount ${model.selectmultidiscount.toString()}');
        //  print('vinay budget${model.selectmultibudget.toString()}');
        // print('vinay availability ${model.selectmultiavailability.toString()}');
        return Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: valueList[index].isSelect,
              onChanged: (value) {
                ontap(index);
              },
              activeColor: colorredlightbtn,
            ),
            SizedBox(
              child: Text(
                valueList[index].title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: textstylesubtitle1(context),
              ),
            ),
          ],
        );
      });
}

// ---- FILTER BOTTOM BUTTON ------
Widget filterapplybtnRow(context, model) {
  return Row(
    children: [
      Container(
        color: colorWhite,
        width: deviceWidth(context, 0.5),
        height: 45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model.filterProdctlist.length.toString(),
              style: textstyleHeading6(context),
            ),
            Text(
              'Products Found',
              style: textstylesubtitle1(context)!.copyWith(color: colorgrey),
            ),
          ],
        ),
      ),
      Button(
        onPressed: () async {
          print(model.filterProdctlist);
          Get.to(() => RecomProdListPage(
                apptitle: 'Filterd Products',
                dataList: model.filterProdctlist,
              ));
        },
        buttonName: 'APPLY',
        btnWidth: deviceWidth(context, 0.5),
        borderRadius: borderRadiuscircular(0.0),
      )
    ],
  );
}
