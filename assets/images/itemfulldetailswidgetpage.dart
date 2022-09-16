// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventneedz/common/commonwidgets/button.dart';
import 'package:eventneedz/common/commonwidgets/commonwidgets.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';

List imagesSliders = [
  'assets/images/home.png',
  'assets/images/home1.png',
  'assets/images/home2.png',
  'assets/images/home3.png',
  'assets/images/home4.png',
  'assets/images/home5.png',
];

CarouselSlider sliderdashboard(context) {
  return CarouselSlider.builder(
    itemCount: imagesSliders.length,
    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
      // final
      return SizedBox(
          width: deviceWidth(context, 1.0),
          child: Image.asset(
            imagesSliders[itemIndex],
            fit: BoxFit.fill,
          ));
    },
    // carouselController: model.buttonCarouselController,
    options: CarouselOptions(
      height: 280,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      viewportFraction: 1,
      aspectRatio: 16 / 10,
      initialPage: 0,
    ),
  );
}

Widget itemDetails(context) {
  return Container(
    height: 200,
    color: colorWhite,
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Traditional Mandapam',
          style: textstyleHeading6(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SS Decorators',
              style:
                  textstyleHeading6(context)!.copyWith(color: Colors.black45),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 77,
                height: 22,
                color: colorredlightbtn,
                child: Center(
                    child: Text('VIEW SHOP',
                        style: TextStyle(color: colorWhite, fontSize: 14))),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Price : ',
              style: textstyleHeading6(context)!
                  .copyWith(fontWeight: fontWeight400),
            ),
            Text(
              '\u{20B9}100000',
              style: textstyleHeading6(context)!
                  .copyWith(fontWeight: fontWeight900),
            ),
            sizedboxwidth(8.0),
            Text(
              '\u{20B9}120000',
              style: textstyleHeading6(context)!.copyWith(
                  fontWeight: fontWeight400,
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough),
            ),
            sizedboxwidth(5.0),
            Text(
              ' 20% OFF',
              style: textstyleHeading6(context)!
                  .copyWith(fontSize: 14, color: Colors.black45),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Deposit :',
              style: textstyleHeading6(context)!
                  .copyWith(fontWeight: fontWeight400),
            ),
            Text(
              ' 25000',
              style: textstyleHeading6(context)!
                  .copyWith(fontWeight: fontWeight900),
            ),
          ],
        ),
        Text(
          'Order before 24 hours',
          style: textstyleHeading6(context)!.copyWith(color: Colors.black45),
        ),
        Row(
          children: [
            Icon(
              Icons.check,
              color: colorredlightbtn,
            ),
            Text(
              'Verified',
              style: textstyleHeading6(context)!.copyWith(color: colorgreen),
            ),
          ],
        ),
        Text(
          'Stock Available',
          style: textstyleHeading6(context)!.copyWith(color: colorredlightbtn),
        ),
        sizedboxheight(2.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  decoration: BoxDecoration(
                      color: colorredlightbtn,
                      borderRadius: borderRadiuscircular(3.0)),
                  child: Row(
                    children: [
                      Text(
                        '4.5',
                        style: textstylesubtitle1(context)!
                            .copyWith(color: colorWhite),
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
                  style: textstylesubtitle1(context)!.copyWith(
                      fontWeight: fontWeight600, color: Colors.black45),
                ),
                Text(
                  '100 Views',
                  style: textstylesubtitle1(context)!.copyWith(
                      fontWeight: fontWeight600, color: Colors.black45),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Live Streaming:',
                  style: textstylesubtitle1(context)!.copyWith(
                      fontWeight: fontWeight600, color: Colors.black45),
                ),
                Container(
                  width: 27,
                  height: 24,
                  color: colorblack,
                  child: Center(
                      child: Text(
                    '78',
                    style: TextStyle(
                      color: colorWhite,
                    ),
                  )),
                )
              ],
            )
          ],
        ),
      ],
    ),
  );
}

Row addTocartbtn(BuildContext context) {
  return Row(
    children: [
      Button(
        onPressed: () {},
        elevation: 10,
        btnWidth: deviceWidth(context, 0.5),
        buttonName: 'ADD TO CART',
        imageAsset: Icon(
          Icons.favorite_border,
          size: 20,
        ),
        borderRadius: borderRadiuscircular(0.0),
        textColor: colorblack,
        btnColor: colorWhite,
      ),
      Button(
        onPressed: () {},
        btnWidth: deviceWidth(context, 0.5),
        buttonName: 'ADD TO CART',
        imageAsset: Image(
          image: AssetImage('assets/icons/cart.png'),
          color: colorWhite,
        ),
        borderRadius: borderRadiuscircular(0.0),
      )
    ],
  );
}

Container enterpinbtn(BuildContext context) {
  return Container(
    color: colorWhite,
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: colorredlightbtn,
              size: 16,
            ),
            sizedboxwidth(3.0),
            Text(
              'Deliver to',
              style: textstyleHeading6(context),
            )
          ],
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 100,
            height: 28,
            color: colorredlightbtn,
            child: Center(
                child: Text('Enter Pincode',
                    style: TextStyle(color: colorWhite, fontSize: 16))),
          ),
        ),
      ],
    ),
  );
}

Container productdiscription(BuildContext context) {
  return Container(
    color: colorWhite,
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: headingperawidget(context, 'Product Description',
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the"),
  );
}

Container ratingandreview(BuildContext context) {
  return Container(
    color: colorWhite,
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      children: [
        rateproductbtn(context),
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

Container rateproductbtn(BuildContext context) {
  return Container(
    color: colorWhite,
    padding: EdgeInsets.symmetric(vertical: 8),
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rating & Reviews',
          style: textstyleHeading6(context),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 100,
            height: 28,
            color: colorredlightbtn,
            child: Center(
                child: Text('Rate Products',
                    style: TextStyle(color: colorWhite, fontSize: 16))),
          ),
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

Widget customerphoto(context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    color: colorWhite,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedboxheight(20.0),
        headingscustomwidget(context, 'Customer Photos (25)'),
        sizedboxheight(10.0),
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
        )
      ],
    ),
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
                  sizedboxheight(20.0),
                  headingscustomwidget(context, 'Customer Reviews (12)'),
                  sizedboxheight(7.0),
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
