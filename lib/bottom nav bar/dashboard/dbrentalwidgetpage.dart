// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/product%20list%20pageno%202/productlist_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/menu/notification/notificationpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/mycart/mycart_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/mycart/mycartpage.dart';
import 'package:eventneedz/common/appbar/appbarwidgetpage.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbar_modelpage.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:eventneedz/common/formtextfield/mytextfield.dart';
import 'package:eventneedz/common/shimmereffect.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:eventneedz/search%20filter/search_universal_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Categories/product list pageno 2/productlistpage.dart';

Widget getSearchBar(context, model, data) {
  return Container(
    color: colorpinklight,
    height: 95,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showFlutterToast('Coming soon...');
                  },
                  child: Text(
                    'Reward : ${model.amountReward.toString()} ',
                    style: textstylesubtitle1(context)!
                        .copyWith(color: colorWhite),
                  ),
                ),
                sizedboxwidth(45.0),
                InkWell(
                  onTap: () {
                    showFlutterToast('Coming soon...');
                  },
                  child: Text(
                    'Plan Your Event',
                    style: textstylesubtitle1(context)!
                        .copyWith(color: colorWhite),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        var phonenumber = '+919100009770';
                        final urlphone = Uri.parse('tel:$phonenumber');

                        if (await canLaunchUrl(urlphone)) {
                          await launchUrl(urlphone);
                        }

                        // showDialog(
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return AlertDialog(
                        //         title: Text("Customer care number"),
                        //         content: Text("+91 9100009770"),
                        //       );
                        //     });
                      },
                      child: Icon(
                        Icons.headset,
                        size: 20,
                        color: colorWhite,
                      ),
                    ),
                    // appbCartWidget(context),
                    Consumer<MyCartModelPage>(builder: ((context, data, _) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              //  await appbarmodal.counterreset();
                              Provider.of<MyCartModelPage>(context,
                                  listen: false);
                              Get.to(() => MyCart());
                            },
                            child: SizedBox(
                              width: 35,
                              height: 35,
                              child: Stack(
                                children: <Widget>[
                                  Center(
                                    child: Icon(
                                      Icons.shopping_cart_rounded,
                                      color: colorWhite,
                                      size: 23,
                                    ),
                                  ),
                                  Text(
                                    "${data.cartlistdata.length}",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    })),
                    InkWell(
                      onTap: () {
                        Get.to(() => NotificationPage());
                      },
                      child: Icon(
                        Icons.notifications,
                        size: 21,
                        color: colorWhite,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: colorredlightbtn, width: 5)),
          child: InkWell(
            onTap: () {
              Get.to(() => SearchUniversalPage());
            },
            child: AllInputDesign(
              enabled: false,
              key: Key("search"),
              hintText: 'Search For Products, Category & More',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintTextStyleColor: colorgrey,
              enabledBorderRadius: borderRadiuscircular(6.0),
              textInputAction: TextInputAction.done,
              prefixIcon: Icon(Icons.search),
              keyBoardType: TextInputType.emailAddress,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget advertizmentbox(context, model) {
  return model.banerImageList.isEmpty
      ? shimmerBox(context, 1)
      : CarouselSlider.builder(
          itemCount: model.banerImageList.length,

          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return SizedBox(
                width: deviceWidth(context, 1.0),
                child: Image.network(
                  "$baseImagepath${model.banerImageList[itemIndex]['video']['image'].toString()}",
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ));
          },
          // carouselController: model.buttonCarouselController,
          options: CarouselOptions(
            height: 190,
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
              // model.valueset(index);
              // print('vinay11 ${model.activeindex}');
            },
          ),
        );
}

dbbtn(BuildContext context, model) {
  return Button(
    onPressed: () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'apptypeChose',
        model.apptype == "SALE" ? 'RENT' : "SALE",
      );
      model.findapptypesave(context);
    },
    buttonName: model.apptype == 'RENT'
        ? 'Switch to Event Sales'
        : 'Switch to Event Rentals',
    btnWidth: deviceWidth(context, 0.9),
    btnHeight: 35,
  );
}

Widget hdbCatlist(context, model) {
  return SizedBox(
    height: 80,
    width: deviceWidth(context, 1.0),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          sizedboxwidth(12.0),
          InkWell(
            onTap: () {
              Provider.of<BottomnavbarModelPage>(context, listen: false)
                  .navigatetoCategory();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                      color: colorredlightbtn,
                      borderRadius: borderRadiuscircular(22.0)),
                  child: Image(
                    image: AssetImage(
                      'assets/images/menu1.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                sizedboxheight(3.0),
                Text(
                  'All Categories',
                )
              ],
            ),
          ),
          ListView.builder(
              itemCount: model.categoriesList.length,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    await Provider.of<ProductListModelPage>(context,
                            listen: false)
                        .setCategoryId(
                            model.categoriesList[index]['category']['id']);
                    Get.to(() => ProductListPage());
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                    constraints: BoxConstraints(maxWidth: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: borderRadiuscircular(22.0),
                          child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: colorredlightbtn,
                                borderRadius: borderRadiuscircular(22.0),
                              ),
                              child: Image.network(
                                '$baseImagepath${model.categoriesList[index]['category']['image'].toString()}',

                                fit: BoxFit.fill,
                                errorBuilder:
                                    (context, exception, stackTrack) => Center(
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/db11.png'),
                                            fit: BoxFit.fill)),
                                // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                              )),
                        ),
                        sizedboxheight(3.0),
                        Text(
                          model.categoriesList[index]['category']['name']
                              .toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: textstylesubtitle1(context)!
                              .copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    ),
  );
}

Widget gridviewlistdashbord(context, model) {
  final orientation = MediaQuery.of(context).orientation;
  return model.isShimmer || model.categoriesList.isEmpty
      ? shimmerBox(context, 2)
      : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: GridView.builder(
              itemCount: model.categoriesList.length >= 4
                  ? 4
                  : model.categoriesList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio:
                      deviceWidth(context, 1.0) / deviceheight(context, 0.41)),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    await Provider.of<ProductListModelPage>(context,
                            listen: false)
                        .setCategoryId(
                            model.categoriesList[index]['category']['id']);
                    Get.to(() => ProductListPage());

                    // Get.to(() => CategoriesPage());
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          child: Expanded(
                              child: Container(
                            width: double.maxFinite,
                            child: Image.network(
                              '$baseImagepath${model.categoriesList[index]['category']['image'].toString()}',
                              fit: BoxFit.cover,
                              errorBuilder: (context, exception, stackTrack) =>
                                  Center(
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/db1.png'),
                                          fit: BoxFit.cover)),
                              // loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                            ),
                          )),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              model.categoriesList[index]['category']['name']
                                  .toString(),
                              style: textstyleHeading6(context),
                            ))
                      ],
                    ),
                  ),
                );
              }),
        );
}
