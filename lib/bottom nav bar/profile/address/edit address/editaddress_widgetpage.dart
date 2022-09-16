// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/formtextfield/mytextfield.dart';
import 'package:eventneedz/common/formtextfield/validations_field.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';

Widget firstnameUpdate(context, model) {
  return AllInputDesign(
    widthtextfield: deviceWidth(context, 0.45),
    key: Key("First Name"),
    hintText: model.addressselectForUpdate['first_name'].toString(),
    fillColor: colorgreylight,
    controller: model.fname,
    autofillHints: [AutofillHints.namePrefix],
    validatorFieldValue: 'Name',
    inputFormatterData: [
      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
    ],
    textCapitalization: TextCapitalization.sentences,
  );
}

Widget lasttnameUpdate(context, model) {
  return AllInputDesign(
    key: Key("Last Name"),
    widthtextfield: deviceWidth(context, 0.45),
    hintText: model.addressselectForUpdate['last_name'].toString(),
    fillColor: colorgreylight,
    controller: model.lname,
    autofillHints: [AutofillHints.nameSuffix],
    validatorFieldValue: 'Name',
    inputFormatterData: [
      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
    ],
    textCapitalization: TextCapitalization.sentences,
  );
}

Widget mobilenomUpdate(context, model) {
  return AllInputDesign(
    key: Key("Mobile Number"),
    hintText: model.addressselectForUpdate['phone_no'].toString(),
    fillColor: colorgreylight,
    controller: model.mobile,
    textInputAction: TextInputAction.next,
    keyBoardType: TextInputType.phone,
    autofillHints: [AutofillHints.telephoneNumberCountryCode],
    validatorFieldValue: 'Mobile Number',
    inputFormatterData: [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    ],
  );
}

Widget pincodeUpdate(context, model) {
  return AllInputDesign(
    key: Key("pincod"),
    // widthtextfield: deviceWidth(context, 0.45),
    hintText: model.addressselectForUpdate['pincode'].toString(),
    fillColor: colorgreylight,
    controller: model.pincode,
    keyBoardType: TextInputType.number,
    counterText: '',
    validatorFieldValue: 'pincod',
    validator: validaterequired,
    maxLength: 6,
    inputFormatterData: [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    ],
  );
}

// ----- city state ------

Widget statenameUpdate(context, model) {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 5),
    width: deviceWidth(context, 0.4),
    height: 50,
    decoration: BoxDecoration(
        color: colorgreylight,
        borderRadius: borderRadiuscircular(2.0),
        border: borderCustom()),
    child: DropdownButton<String>(
      isExpanded: true,
      focusColor: Colors.white,
      // underline: Container(height: 1, color: colorblacklight),
      // value: model.chosenstate,
      iconSize: 20,
      //elevation: 5,
      style: TextStyle(color: Colors.white),
      iconEnabledColor: Colors.grey,
      items: model.stateList.map<DropdownMenuItem<String>>((value1) {
        return DropdownMenuItem<String>(
          value: value1,
          child: Text(
            value1,
            style: textstyleHeading6(context),
          ),
        );
      }).toList(),
      hint: Text(model.chosenstate ??
          model.addressselectForUpdate['state'].toString() ??
          'State'),
      onChanged: (value) {
        print('');
        model.toggleState(value);
      },
    ),
  );
}

Widget cityUpdate(context, model) {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 5),
    width: deviceWidth(context, 0.45),
    height: 50,
    decoration: BoxDecoration(
        color: colorgreylight,
        borderRadius: borderRadiuscircular(2.0),
        border: borderCustom()),
    child: DropdownButton<String>(
      isExpanded: true,
      focusColor: Colors.white,

      // value: model.chosenCityprofile,
      iconSize: 20,

      style: TextStyle(color: Colors.white),
      iconEnabledColor: Colors.grey,
      items: model.citydataList.map<DropdownMenuItem<String>>((value1) {
        return DropdownMenuItem<String>(
          value: value1,
          child: Text(
            value1,
            style: textstyleHeading6(context),
          ),
        );
      }).toList(),
      // hint: Text(
      //   modelprofileview.userdataMap['country'].toString() == 'null'
      //       ? 'Contry'
      //       : modelprofileview.userdataMap['country'].toString(),
      //   style: textstyleHeading6(context),
      // ),
      hint: Text(model.chosenCityprofile ??
          model.addressselectForUpdate['city'].toString() ??
          'City'),
      onChanged: (value) {
        model.toggleCity(value);
      },
    ),
  );
}

// ------------------------

// Widget cityUpdate(context, model) {
//   return AllInputDesign(
//     key: Key("City"),
//     widthtextfield: deviceWidth(context, 0.45),
//     hintText: model.addressselectForUpdate['city'].toString(),
//     fillColor: colorgreylight,
//     controller: model.city,
//     validatorFieldValue: 'City',
//     validator: validaterequired,
//        inputFormatterData: [
//       FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
//     ],
//   );
// }

// Widget statenameUpdate(context, model) {
//   return AllInputDesign(
//     key: Key("state"),
//    hintText: model.addressselectForUpdate['state'].toString(),
//     fillColor: colorgreylight,
//     controller: model.statename,
//     validator: validaterequired,
//        inputFormatterData: [
//       FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
//     ],
//   );
// }

Widget fletnumberUpdate(context, model) {
  return AllInputDesign(
    key: Key("pincode"),
    hintText: model.addressselectForUpdate['flat_no'].toString(),
    fillColor: colorgreylight,
    controller: model.fletnumber,
    keyBoardType: TextInputType.number,
    counterText: '',
    validatorFieldValue: 'pincode',
    validator: validaterequired,
    maxLength: 6,
    inputFormatterData: [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    ],
  );
}

Widget areastreetUpdate(context, model) {
  return AllInputDesign(
    key: Key("Location/Area/Street"),
    hintText:
        model.addressselectForUpdate['locality'] ?? "Location/Area/Street",
    fillColor: colorgreylight,
    controller: model.areastreet,
    validatorFieldValue: 'Area',
    validator: validaterequired,
  );
}

Widget landmarkUpdate(context, model) {
  return AllInputDesign(
    key: Key("Landmark (Optional)"),
    hintText:
        model.addressselectForUpdate['land_mark'] ?? "Landmark (Optional)",
    fillColor: colorgreylight,
    controller: model.landmark,
    validatorFieldValue: 'Landmark',
  );
}

Widget addressradioUpdate(context, model) {
  return RadioGroup<String>.builder(
    activeColor: colorpinklight,
    direction: Axis.horizontal,
    horizontalAlignment: MainAxisAlignment.start,
    groupValue: model.addressinfoInitializeUpdateApi(context),
    // groupValue: model.gendervalueInitialize(context),
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

Widget addressChakeboxUpdate(context, model) {
  return Row(
    children: [
      Checkbox(
          value: model.checkBoxaddressDefault,
          activeColor: colorpinklight,
          onChanged: (value) {
            model.addressdefualt(value);
          }),
      Text('Make as default address')
    ],
  );
}

Widget addcardBtnUpdate(context, model) {
  return Button(
    isLoading: model.isShimmer,
    buttonNameloading: 'Update Address',
    borderRadius: BorderRadius.circular(1.0),
    btnColor: colorpinklight,
    textColor: colorWhite,
    borderColor: colorpinklight,
    btnWidth: deviceWidth(context, 0.9),
    btnfontsize: 16,
    key: Key('Save Address'),
    onPressed: () {
      model.editAddressapi(context);
    },
  );
}
