// ignore_for_file: annotate_overrides, prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:eventneedz/bottom%20nav%20bar/profile/address/add%20address%20page/addnewaddress_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/profile/address/address_savelist_page.dart';
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/shimmereffect.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'address_pagewidget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key, this.pageCome}) : super(key: key);

  final pageCome;

  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      final addressModel =
          Provider.of<AddNewAddressModelPage>(context, listen: false);

      await addressModel.viewadrressApi(context);
      await addressModel.stateFetch(context);
      if (addressModel.addressList.isEmpty) {
        await addadressBotomsheet(context);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewAddressModelPage>(builder: (context, model, _) {
      return Scaffold(
        backgroundColor: colorgreylight,
        appBar: model.addressList.isEmpty
            ? apponlytitle(context, 'Address')
            : apponlytitledreess(context, 'Address'),
        body: model.isShimmer
            ? shimmerBox(context, 4, 'dark')
            : model.addressList.isEmpty
                ? SizedBox(
                    width: deviceWidth(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/locetionlogo.png'),
                        sizedboxheight(20.0),
                        Text(
                          'Save YOUR ADDRESSES NOW',
                          style: textstyleHeading6(context),
                        ),
                        sizedboxheight(20.0),
                        Text(
                          'Add your home add office addresses\n '
                          'and enjoy faster checkout',
                          textAlign: TextAlign.center,
                          style: textstylesubtitle1(context),
                        ),
                        sizedboxheight(20.0),
                        addnewaddressBtn(context),
                        sizedboxheight(deviceWidth(context, 0.2)),
                      ],
                    ),
                  )
                : addressListpage(context, model, widget.pageCome),
      );
    });
  }
}
