// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable

import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlist_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlist_widgetpage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/shimmereffect.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:eventneedz/splash%20screen/nodatafoundpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatefulWidget {
  WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      final model = Provider.of<WishListFavModelPage>(context, listen: false);
      await model.wishListFatch(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final modelProductList = Provider.of<WishListFavModelPage>(context, listen: false);
    return Scaffold(
      appBar: appbarSearchFavCart(context, 'My Favorites'),
      backgroundColor: colorgreylight,
      body: Consumer<WishListFavModelPage>(builder: (context, model, _) {
        return model.isShimmer
            ? shimmerBox(context, 5, 'dark')
            : Column(
                children: [
                  model.wishlistList.isEmpty
                      ? nodataFoundWidgetfull(context, "Favorites is Empty")
                      : wishlistwidget(context, model)
                ],
              );
      }),
    );
  }
}
