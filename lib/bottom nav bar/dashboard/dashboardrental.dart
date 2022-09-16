// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/bottom%20nav%20bar/mycart/mycart_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/1%20My%20Profile/myprofile_modelpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../menu/mayorder/myorder_itemdetails/myorder_itemdatails_widgetpage.dart';
import '../menu/mayorder/myorder_itemdetails/myorder_itemdetails_page.dart';
import '../menu/mayorder/myorder_modelpage.dart';
import 'dashboardrentalmodelpage.dart';
import 'dbrentalwidgetpage.dart';
import 'downloadInvoce.dart';

class DashboardPageRental extends StatefulWidget {
  const DashboardPageRental({Key? key}) : super(key: key);

  @override
  State<DashboardPageRental> createState() => _DashboardPageRentalState();
}

class _DashboardPageRentalState extends State<DashboardPageRental> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      final dbmodel = Provider.of<DashboardModelPage>(context, listen: false);
      await dbmodel.findapptypesave(context);

      await dbmodel.bannerImagefatch(context);
      await dbmodel.devicetokenUpdate(context);
      await dbmodel.amountRewardapi(context);

      final pmodel = Provider.of<MyProfileModelPage>(context, listen: false);
      await pmodel.profileViewFatch(context);

      final cmodel = Provider.of<MyCartModelPage>(context, listen: false);
      cmodel.cartlistdata.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DashboardModelPage>(builder: (context, model, data) {
        return SafeArea(
          child: Column(
            children: [
              getSearchBar(context, model, data),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // TextButton(
                      //     onPressed: () async {
                      //       final db = Provider.of<MyOrderModelPage>(context,
                      //           listen: false);
                      //       await db.orderListFatch(context);
                      //       Get.to(() => MyorderItemDetailspage());
                      //       // productDetails(context, model, data);
                      //       // Get.to(() => DownloadInvoice());
                      //       // final pdfFile = await PdfInvoiceApi.generate();

                      //       // // opening the pdf file
                      //       // await FileHandleApi.openFile(pdfFile);
                      //     },
                      //     child: Text('Download')),
                      advertizmentbox(context, model),
                      sizedboxheight(10.0),
                      dbbtn(context, model),
                      sizedboxheight(20.0),
                      hdbCatlist(context, model),
                      InkWell(
                        onTap: () {
                          model.amountRewardapi(context);
                        },
                        child: Text(
                          'PRODUCTS CATALOG',
                          style: textstyleHeading2(context)!
                              .copyWith(fontWeight: fontWeight400),
                        ),
                      ),
                      sizedboxheight(3.0),
                      dividerHorizontal(context, 0.9, 1.0),
                      gridviewlistdashbord(context, model),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
