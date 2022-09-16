// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:eventneedz/auth/login%20sinup/enter%20otp%20page%202/enterotp_modelpage.dart';
import 'package:eventneedz/auth/login%20sinup/loginsinguppage.dart';
import 'package:eventneedz/auth/twillio/twillio_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/fillter/filtermodelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/itemfulldetail_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/image%20picker/imagepic_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/livestriming.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/rate_review/rate_review_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/product%20list%20pageno%202/productlist_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/product%20list%20pageno%202/sortbuttton.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/view%20all%20grid%20one%20cat%20List%203/viewall_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/appdemo/appdemo_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/appdemo/youtubevideo/youtubevideopage.dart';
import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlist_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/menu/notification/notification_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/mycart/mycart_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/mycart/mycartpaymentbill_modelpage.dart';
import 'package:eventneedz/common/appbar/appbarmodelpage.dart';
import 'package:eventneedz/common/bottomnavbar/bottomnavbar.dart';
import 'package:eventneedz/razorpay%20payment/razorpaypayment_modelpage.dart';
import 'package:eventneedz/search%20filter/search_universal_modelpage.dart';
import 'package:eventneedz/splash%20screen/intro_page.dart';
import 'package:eventneedz/auth/selectcatagery.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'auth/forgetpassword/enter email 1/forgetpassmodelpage.dart';
import 'auth/forgetpassword/enter new password 3/newpassmodelpage.dart';
import 'auth/forgetpassword/enter new password 3/newpasspage.dart';
import 'auth/login sinup/login/loginmodelpage.dart';
import 'auth/login sinup/signup/signupmodelpage.dart';
import 'bottom nav bar/dashboard/dashboardrentalmodelpage.dart';
import 'bottom nav bar/menu/mayorder/myorder_modelpage.dart';
import 'bottom nav bar/menu/notification/flutter_local_notification.dart';
import 'bottom nav bar/profile/1 My Profile/myprofile_modelpage.dart';
import 'bottom nav bar/profile/2 editprofile/editprofile_modelpage.dart';
import 'bottom nav bar/profile/address/add address page/addnewaddress_modelpage.dart';
import 'common/bottomnavbar/bottomnavbar_modelpage.dart';
import 'common/styles/const.dart';
import 'common/styles/matrialcolor.dart';

//when app terminate the notification massage reseve
Future<void> backGroundMessageHandler(RemoteMessage message) async {
  print('vvv app terminate ${message.data.toString()}');
  print('vvv app terminate ${message.notification!.title}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backGroundMessageHandler);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LoginModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => SignUpModelpage(),
      ),
      ChangeNotifierProvider(
        create: (context) => NewPassModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => ForgetPassModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => AppbarmodalPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => DashboardModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => BottomnavbarModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => EditProfileModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => FilterModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => MyOrderModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProductListModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => ItemFullDetailModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => EnterOtpModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => SearchUniversalModelPage(),
      ),
      // ChangeNotifierProvider(
      //   create: (context) => CategoriesModelPage(),
      // ),
      ChangeNotifierProvider(
        create: (context) => MyProfileModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => RateReviewModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => WishListFavModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => MyCartModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => RazorpayModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => AppDemoModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => AddNewAddressModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => MyCartPaymentBillPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => NotificationModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => ViewAllModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => ImagePickerModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => TwillioModelPage(),
      ),
      ChangeNotifierProvider(
        create: (context) => LiveStrimingModelPage(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Event Needz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: buildMaterialColor(colorpinklight),
        scaffoldBackgroundColor: colorWhite,
        primaryTextTheme: TextTheme(headline2: TextStyle(color: colorblack)),
        textTheme: TextTheme(
          headline1: TextStyle(
              color: colorblack,
              fontSize: fontsizeheading28,
              letterSpacing: 0.5,
              fontWeight: fontWeight900),
          headline2: TextStyle(
            color: colorblack,
            fontSize: fontsizeheading25,
            letterSpacing: 0.5,
            fontWeight: fontWeight600,
          ),
          headline3: TextStyle(
            color: colorblack,
            fontSize: fontsize22,
            letterSpacing: 0.5,
            fontWeight: fontWeight900,
            overflow: TextOverflow.ellipsis,
          ),
          headline6: TextStyle(
            color: colorblack,
            fontSize: 17,
            letterSpacing: 0.5,
            fontWeight: fontWeight500,
          ),
          subtitle1: TextStyle(
            color: colorblack,
            letterSpacing: 0.5,
            fontSize: fontsize15,
          ),
          subtitle2: TextStyle(
            color: colorgrey,
            letterSpacing: 0.5,
            fontSize: fontsize14,
          ),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: colorWhite,
          iconTheme: IconThemeData(color: colorblack, size: 27),
          elevation: 0,
          // textTheme: TextTheme(
          //     bodyText1: TextStyle(color: colorblack, fontSize: 50))
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => IntroPage(),
        '/l': (context) => LoginPageSignupPage(),
        '/c': (context) => SelectCategry(),
        '/d': (context) => BottomNavBarPage(),
        '/a': (context) => SortButtonProductList(),
        '/z': (context) => NewPassPage(),

        ///YoutubePlayerDemoApp
        // '/y': (context) => MyHomePage1(),
      },
    );
  }
}
