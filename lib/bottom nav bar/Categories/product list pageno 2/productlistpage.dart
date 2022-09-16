// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:eventneedz/bottom%20nav%20bar/faviorate%20wishlist/wishlist_modelpage.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/shimmereffect.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:eventneedz/splash%20screen/nodatafoundpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'productlist_modelpage.dart';
import 'productlistwidgetpage.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      final model = Provider.of<ProductListModelPage>(context, listen: false);

      await model.recmndedroductFatch(context);
      await model.popularFatch(context);
      await model.productFatch(context);
      await model.resetShortBtn();
      await Provider.of<WishListFavModelPage>(context, listen: false)
          .wishListFatch(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarSearchFavCart(context, 'Product List'),
      backgroundColor: colorgreylight,
      body: Consumer<ProductListModelPage>(builder: (context, model, _) {
        return model.isShimmer
            ? shimmerBox(context, 4, 'dark')
            : Container(
                padding: EdgeInsets.only(bottom: 1),
                child: Column(children: [
                  filltersortwidget(context, model, 'product page'),
                  Expanded(
                    child: model.recomandedproductList.isEmpty &&
                            model.productList.isEmpty &&
                            model.popularList.isEmpty
                        ? nodataFoundWidget(context)
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                sizedboxheight(12.0),
                                model.isShimmer ||
                                        model.recomandedproductList.isEmpty ||
                                        !model.reconmandedtrue
                                    ? Container()
                                    : recommendedList(context, model),
                                sizedboxheight(12.0),
                                model.isShimmer ||
                                        model.popularList.isEmpty ||
                                        !model.popularshowtrue
                                    ? Container()
                                    : popularproductList(context, model),
                                sizedboxheight(12.0),
                                model.isShimmer ||
                                        model.productList.isEmpty ||
                                        !model.reconmandedtrue ||
                                        !model.popularshowtrue
                                    ? Container()
                                    : productList11(context, model, ''),
                              ],
                            ),
                          ),
                  )
                ]));
      }),
    );
  }
}
