// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_element, avoid_print

import 'package:eventneedz/auth/forgetpassword/enter%20email%201/forgetpasspage.dart';
import 'package:eventneedz/auth/login%20sinup/social%20login/google_login_controller.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/commonwidgets/toast.dart';
import 'package:eventneedz/common/formtextfield/mytextfield.dart';
import 'package:eventneedz/common/formtextfield/validations_field.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'loginmodelpage.dart';

Widget loginChildrens(context, formkeyLogin) {
  return Form(
    child: SingleChildScrollView(
      // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Consumer<LoginModelPage>(builder: (context, model, _) {
        return Form(
          key: formkeyLogin,
          // autovalidate: model.autovalidateLogin,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              sizedboxheight(22.0),
              loginemail(model),
              sizedboxheight(22.0),
              loginPassword(context, model),
              forgetpassword(context),
              sizedboxheight(10.0),
              loginBtn(context, model, formkeyLogin),
              sizedboxheight(22.0),
              sininwithAccount(context, "Or sign in with"),
              sizedboxheight(22.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  googleboxbtn2(context),
                  sizedboxwidth(15.0),
                  fbboxbtn1(),

                  //  Consumer<GoogleSignUpModelPage>(builder: (context,googlesignupmodel,_){
                  //    return  googleboxbtn2(context,googlesignupmodel);
                  //  }),

                  // sizedboxwidth(15.0),
                  // boxbtn3(),
                ],
              ),
              sizedboxheight(22.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: Text(
                  'It the readable content of a page when looking at its layout. The point',
                  textAlign: TextAlign.center,
                  style: textstylesubtitle1(context),
                ),
              )
            ],
          ),
        );
      }),
    ),
  );
}

Widget loginemail(model) {
  return AllInputDesign(
    inputHeaderName: 'User Name',
    key: Key("email1"),
    hintText: 'Email',
    controller: model.loginEmail,
    autofillHints: [AutofillHints.email],
    textInputAction: TextInputAction.next,
    prefixIcon: Image(image: AssetImage('assets/icons/email.png')),
    keyBoardType: TextInputType.emailAddress,
    validatorFieldValue: 'email',
    validator: validateEmailField,
  );
}

Widget loginPassword(context, model) {
  return AllInputDesign(
    key: Key("password11"),
    obsecureText: model.obscuretext,
    fillColor: colorWhite,
    hintText: 'Password',
    textInputAction: TextInputAction.done,
    autofillHints: [AutofillHints.password],
    controller: model.loginPassword,
    // onEditingComplete: ()=>TextInput.finishAutofillContext(),
    prefixIcon: Image(image: AssetImage('assets/icons/lock.png')),
    suffixIcon: TextButton(
        key: Key('password_visibility'),
        onPressed: () {
          model.toggle();
        },
        // icon: Icon(Icons.visibility, size: 20.0, color: model.isTapVissible ? colorredlightbtn :Colors.black45 ),
        child: model.obscuretext
            ? Text(
                'Show',
                style: textstyleHeading6(context)!
                    .copyWith(color: colorredlightbtn),
              )
            : Text(
                'Hide',
                style: textstyleHeading6(context)!
                    .copyWith(color: colorredlightbtn),
              )),
    validatorFieldValue: 'password',
    validator: validaterequired,
    keyBoardType: TextInputType.visiblePassword,
  );
}

Widget forgetpassword(context) {
  return Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () async {
        Get.to(() => ForgetPassPage());
      },
      child: Text(
        'Forgot Password ?',
        style: textstyleHeading6(context),
      ),
    ),
  );
}

Widget loginBtn(context, model, formkeyLogin) {
  return Button(
    isLoading: model.isShimmer,
    buttonNameloading: 'Login',
    key: Key('login_submi'),
    onPressed: () {
      if (formkeyLogin.currentState.validate()) {
        model.signInsubmit(context);
      } else {
        // model.toggleautovalidate();
        showFlutterToast('please fill all fields');
      }
    },
  );
}

Widget sininwithAccount(context, leadingtext) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      dividerHorizontal(context, 0.2, 1.1),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Text(leadingtext,
            style: textstyleHeading6(
              context,
            )!
                .copyWith(fontSize: 16)),
      ),
      dividerHorizontal(context, 0.2, 1.1),
    ],
  );
}

Widget fbboxbtn1() {
  return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(30),
          border: borderCustom(),
          boxShadow: boxShadowcontainer()),
      child: MaterialButton(
          onPressed: () async {
            Get.put(LoginController()).facebookLogin();
          },
          child: Image(
            image: AssetImage('assets/icons/fb.png'),
            // color: Colors.blueAccent,
          )));
}

Widget googleboxbtn2(context) {
  final controller = Get.put(LoginController());
  return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(30),
          border: borderCustom(),
          boxShadow: boxShadowcontainer()),
      child: MaterialButton(
          onPressed: () async {
            await controller.login(context);
          },
          child: Container(
            margin: EdgeInsets.only(top: 4),
            width: 35,
            height: 35,
            child: Image(
              image: AssetImage('assets/icons/google.png'),
              // color: Colors.blueAccent,
            ),
          )));
}
