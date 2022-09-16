// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:eventneedz/auth/login%20sinup/loginsinguppage.dart';
import 'package:eventneedz/auth/login%20sinup/social%20login/google_login_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logoutcontroller extends GetxController {
  // LoginController loginController = Get.find<LoginController>();
  // late User user;

  // @override
  // void onInit() async {
  //   super.onInit();
  //   user = Get.arguments;
  //   print('userlogout controller $user');
  //   print('userlogout controller ${user.runtimeType}');
  // }

  logout() async {
 
    SharedPreferences prefs = await SharedPreferences.getInstance();
await    prefs.remove('apptypeChose');
await    prefs.remove('userId');
await    prefs.remove('headerToken');
await    prefs.remove('isLoggedIn');

  await  Get.put(LoginController()).googleLogout(); //google login ko logout krega
    Get.offAll(() => LoginPageSignupPage());
  }
}
