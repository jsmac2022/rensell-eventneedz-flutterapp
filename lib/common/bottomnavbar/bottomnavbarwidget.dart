// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:eventneedz/auth/login%20sinup/social%20login/logoutcontroller.dart';
import 'package:eventneedz/bottom%20nav%20bar/dashboard/dashboardrental.dart';
import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlistpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/menu/mayorder/myorderpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/menu/notification/notificationpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/address/address_page.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bottomNavBarPagewidget(context, model) {
  return SizedBox(
    height: 67,
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorWhite,
      selectedItemColor: colorpinklight,
      unselectedItemColor: colorblack,
      showUnselectedLabels: true,
      selectedFontSize: 12.8,
      unselectedFontSize: 12,
      iconSize: 20,
      selectedIconTheme: IconThemeData(color: colorpinklight, size: 30),
      selectedLabelStyle: TextStyle(fontWeight: fontWeight700, color: colorpinklight),
      unselectedLabelStyle: TextStyle(fontWeight: fontWeight500),
      onTap: (index) {
        model.toggle(context, index);
      },
      currentIndex: model.bottombarzindex,
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage('assets/icons/home.png'),
            color: model.bottombarzindex == 0 ? colorpinklight : Colors.black87,
          ),
          // icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            // icon: Icon(Icons.person_outlined),
            icon: Image(
              image: AssetImage('assets/icons/Categires.png'),
              color: model.bottombarzindex == 1 ? colorpinklight : Colors.black87,
            ),
            label: 'Categories'),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () async {
              await botamshit(context);
            },
            child: Image(
              image: AssetImage(
                'assets/icons/allcate.png',
              ),
              width: 30,
              height: 27,
              color: model.bottombarzindex == 2 ? colorpinklight : Colors.black87,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Image(
              image: AssetImage(
                'assets/icons/vcamera.png',
              ),
              width: 20,
              color: model.bottombarzindex == 3 ? colorpinklight : Colors.black87,
            ),
            label: 'App Demo'),
        BottomNavigationBarItem(
            // icon: Icon(Icons.person_outline_rounded),
            icon: GestureDetector(
              onTap: () async {
                await DashboardPageRental();
              },
              child: Image(
                image: AssetImage('assets/icons/pershan.png'),
                color: model.bottombarzindex == 4 ? colorpinklight : Colors.black87,
              ),
            ),
            label: 'Profile'),
      ],
    ),
  );
}

Future botamshit(context) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: colorWhite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              dividerHorizontal(context, 1.0, 1.0),
              botamshitCardFile('assets/icons/filemaneger.png', 'My Order', MyOrderPage()),
              dividercontaner(context),
              botamshitCardFile('assets/icons/darkhard.png', 'My Wishlist', WishlistPage()),
              dividercontaner(context),
              botamshitCardFile('assets/icons/darknotification.png', 'Notification', NotificationPage()),
              dividercontaner(context),
              // botamshitCardFile('assets/icons/redio.png', 'Payments', AddCardPage()),
              // dividercontaner(context),
              //botamshitCardFile('assets/icons/star.png', 'Reviews & Ratings', ReviewsRatings()),
           //   dividercontaner(context),
              botamshitCardFile('assets/icons/locetion.png', 'Address', AddressPage()),
             dividercontaner(context),
              botamshitCardFile('assets/icons/logout.png', 'Logout', "logout"),
              dividercontaner(context),
            ],
          ),
        );
      });
}

Widget botamshitCardFile(image, titel, ontap) {
  return ListTile(
    onTap: () {
       if (ontap == "logout") {
      Get.put(Logoutcontroller().logout());
    } else {
      Get.to(ontap);
    }
    },
    tileColor: colorWhite,
    dense: true,
    leading: Image.asset(
      image,
      color: colorblack,
    ),
    minLeadingWidth: 5,
    title: Text(titel),
    trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
        color: colorblack,
      ),
  );
}

Widget dividercontaner(context) {
  return Container(
    height: 1,
    width: deviceWidth(context, 1.0),
    color: Colors.black26,
  );
}
