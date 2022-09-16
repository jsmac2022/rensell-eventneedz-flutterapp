

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'const.dart';

apiErrorAlertdialog(context,messages){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:  Text('Message'),
            content: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
                sizedboxwidth(5.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
            
              
                    SizedBox(
                      width: 200,
                      child: Text(
                        messages,
                        textAlign: TextAlign.left,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: colorWhite),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
  }

succesfulldialog(context,messages){
      Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                          CircleAvatar(
                    radius: 35,
                    child: Image(image: AssetImage('assets/icons/right.png')),
                  ),
                  sizedboxheight(22.0),
                  SizedBox(
                    width: deviceWidth(context, 0.7),
                    child: Text(
                      messages,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textstyleHeading3(context)!.copyWith(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
        
          );
        },
      );
  }


 