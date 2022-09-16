// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/api%20url/api_url.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/formtextfield/mytextfield.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'image picker/imagepic_modelpage.dart';

Widget rateAndreview(context, model) {
  // print("$baseImagepath${model.productdata['product_image_url'].toString()}");
  return Container(
    padding: EdgeInsets.all(10.0),
    width: deviceWidth(context),
    // height: deviceheight(context),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        sizedboxheight(20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: deviceWidth(context, 0.28),
              height: 75,
              child: Image.network(
                '$baseImagepath${model.productdata['product_image_url'].toString()}',
                fit: BoxFit.cover,
                errorBuilder: (context, exception, stackTrack) => Center(
                  child: Image(
                      image: AssetImage('assets/images/db1.png'),
                      fit: BoxFit.cover),
                ),
                //    loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
              ),
            ),
            sizedboxwidth(10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.productdata['product_name'].toString(),
                  style: textstyleHeading6(context),
                ),
                Text(
                  model.productdata['vendor_name'].toString(),
                  style: textstylesubtitle1(context),
                ),
                ratingwidget(context, model)
              ],
            )
          ],
        ),
        sizedboxheight(20.0),
        AllInputDesign(
          controller: model.reviwwritebox,
          hintText: 'Type Your review than get more visibility....',
          enabledBorderRadius: borderRadiuscircular(4.0),
          maxLines: 5,
          textInputAction: TextInputAction.newline,
        ),
        sizedboxheight(20.0),
        Button(
            imageAsset: Icon(
              Icons.add_a_photo_rounded,
              size: 19,
            ),
            btnColor: colorgrey,
            buttonName: 'Add Image',
            textColor: colorblack,
            btnHeight: 40,
            btnWidth: deviceWidth(context, 0.38),
            borderRadius: BorderRadius.circular(1),
            // key: Key('Reset'),
            onPressed: () {
              selectPhoto(context);
            }),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Button(
                  borderColor: colorpinklight,
                  btnColor: colorpinklight,
                  isLoading: model.isShimmer,
                  buttonNameloading: 'Submit',
                  btnstyle:
                      textstylesubtitle1(context)!.copyWith(color: colorWhite),
                  btnHeight: 36,
                  btnWidth: deviceWidth(context, 0.35),
                  borderRadius: BorderRadius.circular(3),
                  onPressed: () {
                    //  Get.to(() => SelectCategry());
                    model.rateAndreviewSubmit(context);
                  },
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget ratingwidget(context, model) {
  return RatingBar.builder(
    initialRating: 0,
    itemSize: 20,
    direction: Axis.horizontal,
    // allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (rating) {
      model.togglerateapp(rating);
    },
  );
}

Future selectPhoto(context) async {
  await showModalBottomSheet(
    enableDrag: true,
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: () {
            Get.back();
            Provider.of<ImagePickerModelPage>(context, listen: false)
                .pickImage(ImageSource.camera);
          },
          leading: Icon(
            Icons.camera_alt,
            color: Colors.black87,
          ),
          title: Text('Camera'),
        ),
        ListTile(
          onTap: () {
            Get.back();
            Provider.of<ImagePickerModelPage>(context, listen: false)
                .pickImage(ImageSource.gallery);
          },
          leading: Icon(
            Icons.photo,
            color: Colors.black87,
          ),
          title: Text('Gallery'),
        )
      ],
    ),
  );
}
