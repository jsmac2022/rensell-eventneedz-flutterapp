import 'package:eventneedz/bottom%20nav%20bar/menu/mayorder/myorderwidget.dart';
import 'package:flutter/material.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'myorder_modelpage.dart';

class myorderfilter extends StatefulWidget {
  String status;
  myorderfilter(this.status, {Key? key}) : super(key: key);

  @override
  State<myorderfilter> createState() => _myorderfilterState();
}

class _myorderfilterState extends State<myorderfilter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      if (widget.status == "All") {
        final myorderfilerlist =
            await Provider.of<MyOrderModelPage>(context, listen: false)
                .orderListFatch(context, widget.status);
      }
      if (widget.status == "Ordered") {
        final myorderfilerlist =
            await Provider.of<MyOrderModelPage>(context, listen: false)
                .orderListFatch(context, widget.status);
      }
      if (widget.status == "Shipped") {
        final myorderfilerlist =
            await Provider.of<MyOrderModelPage>(context, listen: false)
                .orderListFatch(context, widget.status);
      }
      if (widget.status == "Delivered") {
        final myorderfilerlist =
            await Provider.of<MyOrderModelPage>(context, listen: false)
                .orderListFatch(context, widget.status);
      }
      if (widget.status == "Cancelled") {
        final myorderfilerlist =
            await Provider.of<MyOrderModelPage>(context, listen: false)
                .orderListFatch(context, widget.status);
      }
      if (widget.status == "On the way") {
        final myorderfilerlist =
            await Provider.of<MyOrderModelPage>(context, listen: false)
                .orderListFatch(context, widget.status);
      }
      if (widget.status == "Return") {
        final myorderfilerlist =
            await Provider.of<MyOrderModelPage>(context, listen: false)
                .orderListFatch(context, widget.status);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyOrderModelPage>(builder: (context, model, _) {
      return Scaffold(
        backgroundColor: colorgreylight,
        appBar: apponlytitle(context, 'My Orders'),
        body:
            // model.orderFalseList == []
            //     ?
            Container(
          child: ListView.builder(
            itemCount: model.orderitemList.length,
            itemBuilder: (context, index) {
              return
                  // Flexible(
                  //   fit: FlexFit.loose,
                  //   child:
                  Card(
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
                            style: textstylesubtitle1(context)!
                                .copyWith(color: colorblack),
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
                // ),
              );
            },
          ),
        ),
        // : Container(
        //     alignment: Alignment.center,
        //     child: Text(
        //       "No Data Found",
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 16,
        //           fontWeight: fontWeight400),
        //     ),
        //   ),
      );
    });
  }
}
