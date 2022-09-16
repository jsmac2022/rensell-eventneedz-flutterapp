// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/rate_review_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/rate_review_page.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbarwidget.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';

import '../../../dashboard/file_handle_api.dart';
import '../../../dashboard/pdf_invoice_api.dart';

Widget productDetails(context, model, data) {
  return Container(
    width: deviceWidth(context),
    margin: EdgeInsets.all(10.0),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: colorWhite, borderRadius: borderRadiuscircular(5.0)),
    child: Column(
      children: [
        invoiceorderid(context, model, data),
        sizedboxheight(2.0),
        dividercontaner(context),
        itemDetails(context, model, data),
        orderdelevrydate(context, data),
        sizedboxheight(10.0),
        editreview(context, model, data)
      ],
    ),
  );
}

Widget invoiceorderid(context, model, data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Order ID - ${data['order_no'].toString()}',
        style: textstylesubtitle2(context)!.copyWith(color: Colors.black54),
      ),
      ElevatedButton(
          onPressed: () async {
            final pdfFile = await PdfInvoiceApi.generate(data);
            print("PDF File: ${pdfFile}");
            // showImageInvoice(context, "product_image_url", data);
            // opening the pdf file
            // FileHandleApi.openFile(pdfFile);
            await OpenFile.open(
                "/data/user/0/com.rentsell.eventneedz/app_flutter/my_invoice.pdf");

            print(pdfFile);
          },
          child: Text(
            'Download \n Invoice',
            textAlign: TextAlign.center,
            style: textstylesubtitle1(context)!
                .copyWith(color: colorWhite, fontSize: 12.8),
          )),
    ],
  );
}

void showImageInvoice(BuildContext context, String url, dynamic data) {
  showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierColor: Colors.black.withOpacity(0.6),
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(children: [
              Image.network(
                "$baseImagepath${data[url].toString()}",
                // 'assets/images/db1.png',
                height: 65,
                width: 90,
                fit: BoxFit.fill,
              ),
            ]));
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation1),
          child: child,
        );
      });
}

Widget itemDetails(context, model, data) {
  return Container(
    padding: EdgeInsets.all(10.0),
    width: deviceWidth(context),
    decoration: BoxDecoration(),
    // height: deviceheight(context),
    child: InkWell(
      onTap: () {
        print("Hellloooooooo data $data");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          sizedboxheight(3.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "$baseImagepath${data['product_image_url'].toString()}",
                // 'assets/images/db1.png',
                height: 65,
                width: 90,
                fit: BoxFit.fill,
              ),
              sizedboxwidth(10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['product_name'].toString(),
                    style: textstylesubtitle1(context),
                  ),
                  Text(
                    data['vendor_name'].toString(),
                    style: textstylesubtitle2(context),
                  ),
                  Row(
                    children: [
                      Text(
                        "Price : ",
                        style: textstylesubtitle2(context)!
                            .copyWith(color: colorblack54),
                      ),
                      Text(
                        data['actual_price'].toString(),
                        style: textstylesubtitle1(context),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}

String formatDate(String value) {
  DateTime date = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(value);
  String formattedDate = DateFormat('dd MMM yy').format(date);
  return formattedDate;
}

Widget orderdelevrydate(context, data) {
  return Container(
    decoration: BoxDecoration(
        border: borderCustom(), borderRadius: borderRadiuscircular(8.0)),
    padding: EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ordered on',
                style: textstylesubtitle1(context)!
                    .copyWith(fontSize: 12.8, fontWeight: fontWeight700),
              ),
              Text(
                formatDate(data['createddate'].toString()),
                style:
                    textstylesubtitle2(context)!.copyWith(color: colorblack54),
              ),
            ],
          ),
        ),
        // Container(
        //   width: 1,
        //   height: 30,
        //   color: Colors.black12,
        // ),
        // sizedboxwidth(33.0),
        // Expanded(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         'Delivered on',
        //         style: textstylesubtitle1(context)!.copyWith(fontSize: 12.8, fontWeight: fontWeight700),
        //       ),
        //       Text(
        //         'wed, 07 Sep 2021',
        //         style: textstylesubtitle2(context)!.copyWith(color: colorblack54),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    ),
  );
}

Widget editreview(context, model, data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ratingwidget1(context, model),
      Button(
        borderColor: colorpinklight,
        btnColor: colorpinklight,
        isLoading: model.isShimmer,
        buttonNameloading: 'Edit Review',
        btnstyle: textstylesubtitle1(context)!
            .copyWith(color: colorWhite, fontSize: 12.8),
        btnHeight: 30,
        btnWidth: deviceWidth(context, 0.27),
        borderRadius: BorderRadius.circular(3),
        onPressed: () {
          Provider.of<RateReviewModelPage>(context, listen: false)
              .setProductId(data);
          //  model.togglerateapp(rating);
          Get.to(() => RateAndReviewPage(
                pageCome: 'orderDetails',
              ));
          // model.rateAndreviewSubmit(context);
        },
      )
    ],
  );
}

Widget ratingwidget1(context, model) {
  return RatingBar.builder(
    // ignoreGestures: true,
    initialRating: 0,
    itemSize: 30,
    direction: Axis.horizontal,
    // allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: colorpinklight,
    ),
    onRatingUpdate: (rating) {
      model.togglerateapp(rating);
      // print("Button ${model.togglerateapp(rating)}");
    },
  );
}
