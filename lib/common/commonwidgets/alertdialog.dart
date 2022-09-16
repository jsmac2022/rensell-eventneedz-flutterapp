// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color? bgColor;
  final String? title;
  final String? message;
  final String? positiveBtnText;
  final String? negativeBtnText;
  final Function? onPostivePressed;
  final Function? onNegativePressed;
  final double? circularBorderRadius;

  CustomAlertDialog({
    Key? key,
    this.bgColor = Colors.white,
     this.title,
     this.message,
     this.positiveBtnText,
     this.negativeBtnText,
     this.onPostivePressed,
     this.onNegativePressed,
    this.circularBorderRadius = 15.0,
  }) 
  : assert(bgColor != null),
        assert(circularBorderRadius != null)
        ;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: message != null ? Text(message!) : null,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius!)),
      actions: <Widget>[
        negativeBtnText != null
            ? MaterialButton(
          child: Text(negativeBtnText!),
          // textColor: Theme.of(context).accentColor,
          onPressed: () {
            Navigator.of(context).pop();
            if (onNegativePressed != null) {
              onNegativePressed!();
            }
          },
        )
            : Container(),
        positiveBtnText != null
            ? MaterialButton(
          child: Text(positiveBtnText!),
          // textColor: Theme.of(context).accentColor,
          onPressed: () {
            if (onPostivePressed != null) {
              onPostivePressed!();
            }
          },
        )
            : Container(),
      ],
    );
  }
}
