// ignore_for_file: avoid_print, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:eventneedz/auth/login%20sinup/social%20login/googlesignup_modelpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  var isloding = false.obs;

  var signupUserData;
  loadingdismis() {
    isloding.value = false;
  }

  loadingshow() {
    isloding.value = true;
  }

    final GoogleSignIn _googlesigin = GoogleSignIn();
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onReady() async {
    // _googlesigin = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null; //event != null ye condition chack hogi or ture false assign ho jayega
    });
    super.onReady();
  }

  void handleAuthStateChanged(isLoggedIn) {
    loadingshow();

    if (isLoggedIn) {
      // matlb agar pahle se login h to logout nhi krega jab tk  other account se login ke liye nhi mangega
      // print('vinay currentuser ${firebaseAuth.currentUser}');
      signupUserData = firebaseAuth.currentUser;
      print('vkkkkkkkkkkk google login true data $signupUserData');
      Get.put(GoogleSignupModelPage())
          .signupsubmit(signupUserData.email, signupUserData.phoneNumber, signupUserData.displayName);

      // Get.offAll(
      //   Logout(

      //   ),
      //   arguments: firebaseAuth.currentUser
      // );
      loadingdismis();
    } else {
      // Get.offAll(HomePage());
      loadingdismis();
    }
  }

  login(context) async {
    loadingshow();

    print('vinay 4');
    GoogleSignInAccount? googleSignInAccount = await _googlesigin.signIn();
    if (googleSignInAccount == null) {
      print('vinay6');
      loadingdismis();
// yha simereffect ko dismiss kr de
    } else {
      print('vinay5 pre signind user data null hona chahiye ${firebaseAuth.currentUser}');

      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken, idToken: googleSignInAuthentication.idToken);

      firebaseAuth.signInWithCredential(oAuthCredential);

      // Get.offAll(() => Logout());
      loadingdismis();
    }
  }
 

// google logout
  googleLogout() async {
 
    try {
    //  await _googlesigin.signOut();
      await _googlesigin.disconnect().whenComplete(() async {
        await firebaseAuth.signOut().then((value) async {
          signupUserData = null;
          
          print('google UserData $signupUserData');
           await facebooklogout();
        });
      });
     
    } catch (e) {
      print('google logout fun error $e ');
    }
  }

  // ----- facebook login -------
  var userData;
  facebookLogin() async {
  
    try {
      final result = await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      print('result fb $result');
      if (result.status == LoginStatus.success) {
        userData = await FacebookAuth.i.getUserData();
        print('facebook login userData $userData');
        Get.put(GoogleSignupModelPage()).signupsubmit(
          userData['email'],
          '',
          userData['name'],
        );
      }
    } catch (error) {
      print(error);
    }
  }

// ---- FACEBOOK LOGOUT ----
  facebooklogout() async {
   
    await FacebookAuth.instance.logOut();
    userData = null;
    print('facebook logout successfull');
    // await  FacebookAuth.instance.signOut().then((value) => Navigator.of(context).pushReplacement(ScaledAnimationPageRoute(SignIn())))
  }
}
