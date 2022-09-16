// ignore_for_file: prefer_const_constructors

import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/itemfulldetail_modelpage.dart';
import 'package:eventneedz/bottom%20nav%20bar/Categories/item%20full%20detail%20%204/itemfulldetailspage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:eventneedz/search%20filter/search_universal_modelpage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class SearchUniversalPage extends StatefulWidget {
  const SearchUniversalPage({Key? key}) : super(key: key);

  @override
  _SearchUniversalPageState createState() => _SearchUniversalPageState();
}

class _SearchUniversalPageState extends State<SearchUniversalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SearchUniversalModelPage>(builder: (context, model, _) {
          return Container(
            margin: EdgeInsets.only(right: 15, left: 15, top: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: borderRadiuscircular(25.0)),
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: TextField(
                        controller: model.searchText,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Search For Products, Category & More",
                          prefixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              size: 20,
                            ),
                            onPressed: null,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: borderRadiuscircular(15.0),
                            borderSide:
                                BorderSide(width: 1.0, color: colorpinklight),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: borderRadiuscircular(15.0),
                            borderSide: BorderSide(
                              color: Colors.black54,
                              width: 1.0,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            model.searchApihit();
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    // itemCount: predictions.length,
                    itemCount: model.searchData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () async {
                          await Provider.of<ItemFullDetailModelPage>(context,
                                  listen: false)
                              .setSelectedItemData(model.searchData[index]);

                          Get.to(() => ItemFullDetailsPage());
                          // model.clicksearchedproduct(model.searchData);
                        },
                        leading: CircleAvatar(
                          backgroundColor: colorpinklight,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        // title: Text(predictions[index].description!),
                        title: Text(model.searchData[index]['Product']
                                ['product_name']
                            .toString()),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
