// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';

Container ratingandreview(BuildContext context) {
  return Container(
    color: colorWhite,
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      children: [
        sizedboxheight(10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: deviceWidth(context, 0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '4.5',
                        style: TextStyle(fontSize: 50),
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            color: colorredlightbtn,
                          ),
                          sizedboxheight(7.0)
                        ],
                      )
                    ],
                  ),
                  Text(
                    '770 Ratings & 77 Reviews',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ratingreviewget(context, '5', 0.8, Colors.green, '275'),
                ratingreviewget(context, '4', 0.6, Colors.green, '168'),
                ratingreviewget(context, '3', 0.3, Colors.green, '115'),
                ratingreviewget(context, '2', 0.2, Colors.yellow, '28'),
                ratingreviewget(context, '1', 0.1, Colors.yellow, '5'),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget ratingreviewget(context, star, value, color, review) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          Text(
            star,
            style: TextStyle(fontSize: 18),
          ),
          sizedboxwidth(2.0),
          Icon(
            Icons.star,
            color: Colors.black38,
            size: 18,
          ),
          sizedboxwidth(2.0),
          SizedBox(
              width: deviceWidth(context, 0.4),
              child: ClipRRect(
                  borderRadius: borderRadiuscircular(10.0),
                  child: LinearProgressIndicator(
                      minHeight: 5,
                      backgroundColor: colorgrey,
                      value: value,
                      valueColor: AlwaysStoppedAnimation<Color>(color)))),
          sizedboxwidth(6.0),
        ],
      ),
      Text(
        review,
        style: TextStyle(fontSize: 18),
      )
    ],
  );
}

Widget costumerreview(context) {
  return Container(
    color: colorWhite,
    padding: EdgeInsets.symmetric(horizontal: 15),
    // height: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedboxheight(10.0),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                        decoration: BoxDecoration(
                            color: colorgreendark,
                            borderRadius: borderRadiuscircular(5.0)),
                        child: Row(
                          children: [
                            Text(
                              '4.5',
                              style: textstylesubtitle1(context)!
                                  .copyWith(color: colorWhite, fontSize: 16),
                            ),
                            sizedboxwidth(2.0),
                            Icon(
                              Icons.star,
                              color: colorWhite,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                      sizedboxwidth(8.0),
                      Text(
                        '400 Ratings,',
                        style: textstyleHeading3(context)!.copyWith(
                          fontWeight: fontWeight600,
                        ),
                      ),
                    ],
                  ),
                  sizedboxheight(7.0),
                  Text(
                    "using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as thei",
                    style: textstylesubtitle1(context),
                  ),
                  sizedboxheight(7.0),
                  SizedBox(
                    width: deviceWidth(context),
                    height: 90,
                    child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                            color: colorWhite,
                            width: 90,
                            child: Image(
                              image: AssetImage('assets/images/home1.png'),
                              fit: BoxFit.fill,
                            ),
                          );
                        }),
                  ),
                  sizedboxheight(7.0),
                  Text(
                    'Vijay Kumar, Hyderabad',
                    style: textstylesubtitle1(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: CircleBorder(),
                            // value: model.checkboxvalue,
                            value: true,
                            onChanged: (value) {
                              // model.toggleCheckbox();
                            },
                            activeColor: colorgreendark,
                          ),
                          Text(
                            'Certified Buyer',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: textstylesubtitle1(context),
                          ),
                        ],
                      ),
                      Text(
                        '1 week ago',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: textstylesubtitle1(context),
                      ),
                      sizedboxwidth(3.0),
                      Row(
                        children: [
                          Image(image: AssetImage('assets/icons/like.png')),
                          sizedboxwidth(3.0),
                          Text('15', style: textstylesubtitle1(context)),
                          sizedboxwidth(8.0),
                          Image(
                            image: AssetImage('assets/icons/dislike.png'),
                          ),
                          sizedboxwidth(3.0),
                          Text('1', style: textstylesubtitle1(context)),
                        ],
                      ),
                      sizedboxwidth(3.0),
                    ],
                  ),
                  dividerHorizontal(context, 0.9, 1.0)
                ],
              );
            }),
        TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size(50, 30),
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            child: Text(
              'View all reviews',
              style: textstyleHeading6(context)!
                  .copyWith(fontSize: 16, color: colorredlightbtn),
            ))
      ],
    ),
  );
}
