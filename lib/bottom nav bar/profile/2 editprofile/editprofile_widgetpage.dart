// ignore: file_names
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/formtextfield/mytextfield.dart';
import 'package:eventneedz/common/formtextfield/validations_field.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';

Widget firstname(context, model, modelprofileview) {
  return AllInputDesign(
    inputHeaderName: 'First Name',
    key: Key("First Name"),
    fillColor: colorgreylight,
    controller: model.fname,
    hintText: modelprofileview.profileviewList[0]['Customer']['firstName'].toString(),
    autofillHints: [AutofillHints.name],
    textInputAction: TextInputAction.next,
    keyBoardType: TextInputType.name,
    validator: validateName,
    inputFormatterData: [
      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
    ],
    textCapitalization: TextCapitalization.sentences,
  );
}

Widget lasttname(context, model, modelprofileview) {
  return AllInputDesign(
    inputHeaderName: 'Last Name',
    key: Key("Last Name"),
    hintText: modelprofileview.profileviewList[0]['Customer']['lastName'].toString(),
    fillColor: colorgreylight,
    controller: model.lname,
    validatorFieldValue: 'Name',
    inputFormatterData: [
      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
    ],
    textCapitalization: TextCapitalization.sentences,
  );
}

// Widget username(context) {
//   return AllInputDesign(
//     inputHeaderName: 'User Name',

//     key: Key("User Name"),
//     hintText: 'User Name',
//     fillColor: colorgreylight,
//     // controller: model.loginEmail,
//     autofillHints: [AutofillHints.username],
//     validatorFieldValue: 'Name',
//   );
// }

Widget emailnamaddress(context, modelprofileview) {
  return AllInputDesign(
    inputHeaderName: 'Email Address',
    enabled: false,
    hintText: modelprofileview.profileviewList[0]['Customer']['email'].toString(),
    key: Key("Email Address"),
    // hintText:  ,
    fillColor: colorgreylight,
    // controller: model.loginEmail,
    // suffixIcon: TextButton(
    //   onPressed: () {
    //     emailChangeBotom(context);
    //   },
    //   child: Text(
    //     'Change',
    //     style: TextStyle(color: colorpinklight),
    //   ),
    // ),
    keyBoardType: TextInputType.emailAddress,
    validatorFieldValue: 'Email',
  );
}

Widget passeword(context, model,formkeychngpass) {
  return InkWell(
    onTap: () {
      passwordChangeBotam(context, model,formkeychngpass);
    },
    child: AllInputDesign(
      inputHeaderName: 'Password',
      enabled: false,
      key: Key("Password"),
      hintText: 'xxxxxxxxxxxx',

      fillColor: colorgreylight,
      suffixIcon: TextButton(
        onPressed: () {},
        child: Text(
          'Change',
          style: TextStyle(color: colorpinklight),
        ),
      ),
      // controller: model.loginEmail,

      validatorFieldValue: 'Password',
    ),
  );
}

Widget dobeditwidget(context, model, modelprofileview) {
  return InkWell(
    onTap: () {
      model.selectDate(context);
    },
    child: AllInputDesign(
      key: Key("dob"),
      enabled: false,
      inputHeaderName: 'Date Of Birth',
      hintText: model.gettext(modelprofileview) ,
      // labelText: model.gettext(modelprofileview),
      fillColor: colorgreylight,
      suffixIcon: ImageIcon(AssetImage('assets/icons/celender.png')),
      focusedBorderColor: colorpinklight,
      enabledOutlineInputBorderColor: colorblack.withOpacity(0.1),
    ),
  );
}

Widget gendercard(context, model, modelprofileview) {
  return RadioGroup<String>.builder(
    activeColor: colorpinklight,
    direction: Axis.horizontal,
    horizontalAlignment: MainAxisAlignment.start,
    // groupValue: model.selectedGender,
    groupValue: model.gendervalueInitialize(context),
    // groupValue:modelprofileview.profileviewList[0]['Customer']['gender'].toString(),
    onChanged: (value) {
      model.toogleradiobtn(value);
    },
    items: model.selectedGenderList,
    itemBuilder: (item) => RadioButtonBuilder(
      item,
    ),
  );
}

Widget phonnum(context, modelprofileview,model) {
  return AllInputDesign(
    key: Key("Moble No."),
    hintText:modelprofileview.profileviewList[0]['Customer']['mobile'].toString()==''?'mobile': modelprofileview.profileviewList[0]['Customer']['mobile'].toString(),
    // enabled: false,
    fillColor: colorgreylight,
    // suffixIcon: TextButton(
    //   onPressed: () {
    //     // botamshit(context);
    //     numberChangeBotam(context);
    //   },
    //   child: Text(
    //     'Change',
    //     style: TextStyle(color: colorpinklight),
    //   ),
    // ),
    controller: model.mobile,
    keyBoardType: TextInputType.number,
    validatorFieldValue: 'Moble No.',
  );
}

Widget resetbut(context, model) {
  return Button(
    borderColor: colorpinklight,
    btnColor: colorWhite,
    buttonName: 'Reset',
    textColor: colorpinklight,
    btnHeight: 40,
    btnWidth: deviceWidth(context, 0.4),
    borderRadius: BorderRadius.circular(1),
    key: Key('Reset'),
    onPressed: () async {
      FocusScope.of(context).unfocus();
      model.resetAlltextfield();
      //  Get.to(() => SelectCategry());
    },
  );
}

Widget update(context, model) {
  return Button(
    isLoading: model.isShimmer,
    buttonNameloading: 'Update',
    btnHeight: 40,
    btnWidth: deviceWidth(context, 0.4),
    borderRadius: BorderRadius.circular(1),
    key: Key('Update'),
    onPressed: () {
      FocusScope.of(context).unfocus();
      model.editprofileUpdate(context);
      //  Get.to(() => SelectCategry());
    },
  );
}

Future emailChangeBotom(context) {
  return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: MediaQuery.of(context).viewInsets,
          color: colorWhite,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Enter New Email Addres'),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                ),
                dividerHorizontal(context, 1.0, 1.0),
                sizedboxheight(15.0),
                changeemail(context),
                sizedboxheight(15.0),
                changepasseword(context),
                sizedboxheight(15.0),
                conformemailbut(context),
                sizedboxheight(15.0),
              ],
            ),
          ),
        );
      });
}

Widget changeemail(context) {
  return AllInputDesign(
    widthtextfield: deviceWidth(context, 0.85),
    key: Key("Email Address"),
    hintText: 'Email Address',
    fillColor: colorgreylight,
    // controller: model.loginEmail,
    autofillHints: [AutofillHints.email],
    keyBoardType: TextInputType.emailAddress,
    validatorFieldValue: 'Email',
  );
}

Widget changepasseword(context) {
  return AllInputDesign(
    widthtextfield: deviceWidth(context, 0.85),
    key: Key("Password"),
    hintText: 'Password',
    fillColor: colorgreylight,
    // controller: model.loginEmail,
    autofillHints: [AutofillHints.email],
    textInputAction: TextInputAction.done,
    keyBoardType: TextInputType.visiblePassword,
    validatorFieldValue: 'Password',
  );
}

Widget conformemailbut(context) {
  return Button(
    buttonName: 'Conform Email',
    textColor: colorWhite,
    btnWidth: deviceWidth(context, 0.85),
    borderRadius: BorderRadius.circular(1),
    key: Key('Conform'),
    onPressed: () {
      //  Get.to(() => SelectCategry());
    },
  );
}

Future passwordChangeBotam(context, model,formkeychngpass) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: MediaQuery.of(context).viewInsets,
          color: colorWhite,
          child: SingleChildScrollView(
            child: Form(
              key: formkeychngpass,
               autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Change Password'),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close))
                      ],
                    ),
                  ),
                  dividerHorizontal(context, 1.0, 1.0),
                  sizedboxheight(15.0),
                  oldPasseword(context, model),
                  sizedboxheight(15.0),
                  newPasseword(context, model),
                  sizedboxheight(15.0),
                  conformPassBut(context,model,formkeychngpass),
                  sizedboxheight(15.0),
                ],
              ),
            ),
          ),
        );
      });
}

Widget oldPasseword(context, model) {
  return AllInputDesign(
    widthtextfield: deviceWidth(context, 0.85),
    key: Key("oldPassword"),
    hintText: 'Enter old Password',
    fillColor: colorgreylight,
    controller: model.oldpassword,
    autofillHints: [AutofillHints.newPassword],
    keyBoardType: TextInputType.visiblePassword,
    validatorFieldValue: 'Password',
     validator: validaterequired,
  );
}

Widget newPasseword(context, model) {
  return AllInputDesign(
    widthtextfield: deviceWidth(context, 0.85),
    key: Key("Password"),
    hintText: 'EnterNew Password',
    fillColor: colorgreylight,
    controller: model.newPassword,
    autofillHints: [AutofillHints.newPassword],
    textInputAction: TextInputAction.done,
    keyBoardType: TextInputType.visiblePassword,
    validatorFieldValue: 'Password',
     validator: validateNewPassword,

  );
}

Widget conformPassBut(context,model,formkeychngpass) {
  return Button(
    buttonName: 'Conform New Passsword',
    textColor: colorWhite,
    btnWidth: deviceWidth(context, 0.85),
    borderRadius: BorderRadius.circular(1),
    key: Key('Conform'),
    onPressed: () {
       if (formkeychngpass.currentState.validate()) {
       model.changepassword(context);
      } else {
        model.toggleautovalidate();
      }
      
      //  Get.to(() => SelectCategry());
    },
  );
}

Future numberChangeBotam(context) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: MediaQuery.of(context).viewInsets,
          color: colorWhite,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Change Phone Number'),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                ),
                dividerHorizontal(context, 1.0, 1.0),
                sizedboxheight(15.0),
                newNumber(context),
                sizedboxheight(15.0),
                sendOTPPassBut(context),
                sizedboxheight(15.0),
                enterOTPBer(context),
                sizedboxheight(15.0),
                entrrOTPPassBut(context),
                sizedboxheight(15.0),
              ],
            ),
          ),
        );
      });
}

Widget newNumber(context) {
  return AllInputDesign(
    widthtextfield: deviceWidth(context, 0.85),
    key: Key("newNumber"),
    hintText: 'Enter New Phone Number',

    fillColor: colorgreylight,

    // controller: model.loginEmail,
    autofillHints: [AutofillHints.email],
    textInputAction: TextInputAction.next,
    keyBoardType: TextInputType.number,
    validatorFieldValue: 'newNumber',
  );
}

Widget sendOTPPassBut(context) {
  return Button(
    buttonName: 'Send OTP for Verification',
    btnWidth: deviceWidth(context, 0.85),
    borderRadius: BorderRadius.circular(1),
    key: Key('Verification'),
    onPressed: () {
      //  Get.to(() => SelectCategry());
    },
  );
}

Widget enterOTPBer(context) {
  return AllInputDesign(
    widthtextfield: deviceWidth(context, 0.85),
    key: Key("Enter OTP"),
    hintText: 'Enter OTP',
    fillColor: colorgreylight,
    // controller: model.loginEmail,
    textInputAction: TextInputAction.done,
    keyBoardType: TextInputType.number,
    validatorFieldValue: 'Enter OTP',
  );
}

Widget entrrOTPPassBut(context) {
  return Button(
    buttonName: 'Verify & Submit',
    btnWidth: deviceWidth(context, 0.85),
    borderRadius: BorderRadius.circular(1),
    key: Key('Verify & Submit'),
    onPressed: () {
      //  Get.to(() => SelectCategry());
    },
  );
}
