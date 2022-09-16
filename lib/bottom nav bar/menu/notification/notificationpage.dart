import 'package:eventneedz/bottom%20nav%20bar/menu/notification/notification_modelpage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notificationwidget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List tabnamelist = ['All', 'New', 'Old'];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final model = Provider.of<NotificationModelPage>(context, listen: false);
      model.notificationFatch(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationModelPage>(builder: (context, model, _) {
      return Scaffold(
        backgroundColor: colorgreylight,
        appBar: apponlytitle(context, 'Notifications'),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: DefaultTabController(
              length: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // width: deviceWidth(context, 1.0),
                    margin: EdgeInsets.only(top: 10, bottom: 15),
                    height: 30,
                    child: TabBar(
                      isScrollable: true,
                      labelPadding: EdgeInsets.all(0.0),
                      indicatorWeight: 0.0,
                      unselectedLabelColor: Colors.black54,
                      indicatorSize: TabBarIndicatorSize.label,
                      automaticIndicatorColorAdjustment: false,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: colorredlightbtn),
                      onTap: (value) async {
                        // var list = Provider.of<OpenMatchingmodelpage>(context, listen: false);

                        // if (value == 0) {
                        //   await list.kundlilistview(context);
                        // }
                      },
                      tabs: [
                        tabwidget(context, tabnamelist[0]),
                        tabwidget(context, tabnamelist[1]),
                        tabwidget(context, tabnamelist[2]),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      notificationcard(context, model.notificationAllList),
                      notificationcard(context, model.newNotification),
                      notificationcard(context, model.oldNotification),
                    ]),
                  ),
                ],
              )),
        ),
      );
    });
  }
}
