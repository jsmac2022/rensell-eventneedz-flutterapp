// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eventneedz/bottom%20nav%20bar/appdemo/appdemo_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/appdemo/appdemopage.dart';
import 'package:eventneedz/bottom%20nav%20bar/appdemo/youtubevideo/youtubevideopage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/shimmereffect.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class AppDemoListPage extends StatefulWidget {
  const AppDemoListPage({Key? key}) : super(key: key);

  @override
  State<AppDemoListPage> createState() => _AppDemoListPageState();
}

class _AppDemoListPageState extends State<AppDemoListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      final appdemomodel =
          Provider.of<AppDemoModelPage>(context, listen: false);
      await appdemomodel.appdemovideofatch(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: apponlytitle(context, 'App Demo'),
        backgroundColor: colorgreylight,
        body: Consumer<AppDemoModelPage>(builder: (context, model, _) {
          return Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 1),
              child: model.isShimmer
                  ? shimmerBox(context, 8, 'dark')
                  : appdemolist(context, model));
        }));
  }
}

Widget appdemolist(context, model) {
  final orientation = MediaQuery.of(context).orientation;
  return GridView.builder(
      // itemCount: model.categoriesList.length,
      itemCount: model.appvideoList.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio:
              deviceWidth(context, 1.0) / deviceheight(context, 0.42)),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            Get.to(() => YoutubePlayerPage(
                  youtubeurl: model.appvideoList[index]['video']['url'],
                ));

            // Get.to(
            //   () => AppDemoPage(
            //     url: model.appvideoList[index]['video']['url'],
            //   ),
            // );
          },
          child: Card(
            child: Column(
              children: [
                // model.thumbnailImageList[index] == null
                //     ? CircularProgressIndicator()
                //     :
                Expanded(
                    child: Stack(
                  children: [
                    Image(
                        image: AssetImage('assets/images/db1.png'),
                        fit: BoxFit.fill),
                    // Container(
                    //   // height: 200,
                    //   // width: 300,
                    //   decoration: BoxDecoration(
                    //     // color: Colors.black26,
                    //   ),
                    //   child: Center(
                    //     child: Icon(
                    //       Icons.ondemand_video_rounded,
                    //       size: 70,
                    //     ),
                    //   ),
                    // ),
                  ],
                )),

                // Expanded(
                //     child: Image.memory(
                //     model.thumbnailImageList[index],
                //     fit: BoxFit.fill,
                //     errorBuilder: (context, exception, stackTrack) =>
                //         Center(
                //             child: Image(
                //                 image: AssetImage('assets/images/db1.png'),
                //                 fit: BoxFit.cover)),
                //   )),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 3),
                    child: Column(
                      children: [
                        Text(
                          model.appvideoList[index]['video']['title']
                              .toString(),
                          // model.categoriesList[index]['category']['name'].toString(),
                          style: textstylesubtitle1(context),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        );
      });
}
