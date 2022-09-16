// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:eventneedz/bottom%20nav%20bar/appdemo/appdemopage.dart';
import 'package:eventneedz/bottom%20nav%20bar/appdemo/youtubevideo/youtubevideopage.dart';
import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlistpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/menu/mayorder/myorderpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/menu/notification/notificationpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/1%20My%20Profile/myprofile_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/2%20editprofile/editprofile_page.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/aboutus/aboutau.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/address/address_page.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/blog/blog.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/cancellationrefund/cancellationrefund_page.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/desclaimer/deseclaimer.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/faq/faqs.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/privacypolicy/privacypolicy.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/termsconditions/termconditions.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/whoweare/whoweare.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myprofile_widgetpage.dart';

class MyProfilePage extends StatefulWidget {
  MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Future.delayed(Duration(milliseconds: 700));
      final dbmodel = Provider.of<MyProfileModelPage>(context, listen: false);
      await dbmodel.profileViewFatch(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarSearchFavCart(context, 'My Profile'),
      // appBar: apponlytitle(context, 'My Profile'),
      backgroundColor: colorgreylight,
      body: SingleChildScrollView(
        child: Consumer<MyProfileModelPage>(builder: (context, model, _) {
          return Column(
            children: [
              // sizedboxheight(10.0),
              profileheader(context, model),
              sizedboxheight(10.0),
              profileListtile(context, 'assets/icons/order.png', 'My Orders',
                  MyOrderPage()),
              dividerHorizontalblack(context),
              profileListtile(context, 'assets/icons/haerd.png', 'My Favorites',
                  WishlistPage()),
              dividerHorizontalblack(context),
              profileListtile(context, 'assets/icons/wnotification.png',
                  'Notifications', NotificationPage()),
              dividerHorizontalblack(context),
              // profileListtile(context, 'assets/icons/redio.png', 'Payments', AddCardPage()),
              // dividerHorizontalblack(context),
              // profileListtile(context, 'assets/icons/wstar.png', 'Ratings & Reviews', ReviewsRatings()),
              // dividerHorizontalblack(context),
              sizedboxheight(8.0),
              profileListtile(context, 'assets/icons/locetion.png', 'Address',
                  AddressPage()),
              dividerHorizontalblack(context),
              profileListtile(context, 'assets/icons/haerd.png',
                  'Profile Details', EditProfilePage()),
              dividerHorizontalblack(context),
              profileListtile(
                  context,
                  'assets/icons/vrecorder.png',
                  'App Demo',
                  // AppDemoPage()
                  YoutubePlayerPage()),
              dividerHorizontalblack(context),
              sizedboxheight(8.0),
              pListtileLeadingTrailing('FAQs', context, FAQSpage()),
              dividerHorizontalblack(context),
              pListtileLeadingTrailing('Blog', context, Blog()),
              dividerHorizontalblack(context),
              pListtileLeadingTrailing('About Us', context, AboutUs()),
              dividerHorizontalblack(context),
              pListtileLeadingTrailing('Who We Are', context, WhoWeAre()),
              dividerHorizontalblack(context),
              pListtileLeadingTrailing('Disclaimer', context, Desclaimer()),
              dividerHorizontalblack(context),
              pListtileLeadingTrailing(
                  'Terms & Conditions', context, TermConditions()),
              dividerHorizontalblack(context),
              pListtileLeadingTrailing(
                  'Privacy Policy', context, PrivacyPolicy()),
              dividerHorizontalblack(context),
              pListtileLeadingTrailing('Cancellation and refund Policy',
                  context, CancellationRefundPage()),
              dividerHorizontalblack(context),
              // pListtileLeadingTrailing('Feedback', context, FeedBackPage()),
              // dividerHorizontalblack(context),
              sizedboxheight(20.0),
              logOutBtn(context),
              sizedboxheight(20.0),
            ],
          );
        }),
      ),
    );
  }
}
