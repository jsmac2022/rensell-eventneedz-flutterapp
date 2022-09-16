import 'dart:io';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'file_handle_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfInvoiceApi {
  static Future<File> generate(data) async {
    print("data   $data");

    final pdf = pw.Document();

    final iconImage = (await rootBundle.load('assets/images/logo 1.png'))
        .buffer
        .asUint8List();

    final imageIcon =
        (await rootBundle.load('assets/images/rupee.png')).buffer.asUint8List();

    var amount_due = data['total_amount'] - data['total_amount'];

    var address = data['deliver_address'].split(",");
    var address1 = address[0];
    var address2 = address[1];
    var address3 = address[2];
    var address4 = address[3];
    var address5 = address[4];
    var address6 = address[5];

    print("home >>>>" + address1);
    print("flot no>>>>>" + address2);
    print("localiy>>>>>>" + address3);
    print("" + address4);
    print("city>>>>>>" + address5);
    print("state>>>>>" + address6);

    final tableHeaders = [
      'ITEM',
      '      COST',
      "QTY",
      'PRICE',
    ];

    final tableData = [
      // [
      //   'Coffee',
      //   '1',
      //   '1000',
      //   ' 1',
      //   ' 1',
      // ],
      [
        data["product_name"],
        data["actual_price"],
        data["quantity"],
        data["total_amount"],
      ],
      // [
      //   'Water',
      //   '1',
      //   '\$ 3',
      //   '\$ 3',
      // ],
      // [
      //   'Apple',
      //   '6',
      //   '\$ 8',
      //   '\$ 48',
      // ],
      // [
      //   'Lunch',
      //   '3',
      //   '\$ 90',
      //   '\$ 270',
      // ],
      // [
      //   'Drinks',
      //   '2',
      //   '\$ 15',
      //   '\$ 30',
      // ],
      // [
      //   'Lemon',
      //   '4',
      //   '\$ 7',
      //   '\$ 28',
      // ],
    ];

    // for (int i = 1; i < tableData.length; i++) {
    //   print("i = $i");
    // }
    pdf.addPage(
      pw.MultiPage(
        // header: (context) {
        //   return pw.Text(
        //     'Flutter Approach',
        //     style: pw.TextStyle(
        //       fontWeight: pw.FontWeight.bold,
        //       fontSize: 15.0,
        //     ),
        //   );
        // },
        build: (context) {
          return [
            pw.Container(
              child: pw.Row(
                children: [
                  // pw.Image(
                  //   pw.MemoryImage(iconImage),
                  //   height: 72,
                  //   width: 72,
                  // ),
                  pw.Expanded(
                    child: pw.Container(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Image(
                            pw.MemoryImage(iconImage),
                            height: 250,
                            width: 150,
                          ),
                          pw.Text(
                            'Kompalli Data Solutions Pvt. Ltd.',
                            style: pw.TextStyle(
                              fontSize: 13.0,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                          pw.SizedBox(height: 20 * PdfPageFormat.mm),
                          pw.Text(
                            'GST Number',
                            style: pw.TextStyle(
                              fontSize: 17.0,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            '36AAICK0471AIZY',
                            style: pw.TextStyle(
                              fontSize: 14.0,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.grey700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 3 * PdfPageFormat.mm),
                  pw.Expanded(
                    child: pw.Container(
                      child: pw.Column(
                        mainAxisSize: pw.MainAxisSize.min,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'Invoice',
                            style: pw.TextStyle(
                              fontSize: 24.0,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(height: 10 * PdfPageFormat.mm),
                          pw.Text(
                            'Invoice Number',
                            style: pw.TextStyle(
                              fontSize: 17.0,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            data["invoice_no"].toString(),
                            style: const pw.TextStyle(
                              fontSize: 15.0,
                              color: PdfColors.grey700,
                            ),
                          ),
                          // pw.Text(
                          //   data["vendor_name"],
                          //   style: pw.TextStyle(
                          //     fontSize: 15.5,
                          //     fontWeight: pw.FontWeight.bold,
                          //   ),
                          // ),
                          // pw.Text(
                          //   'john@gmail.com',
                          // ),
                          pw.SizedBox(height: 10 * PdfPageFormat.mm),
                          pw.Text(
                            'Date',
                            style: pw.TextStyle(
                              fontSize: 17.0,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(DateFormat("dd-MM-yyyy").format(
                                  DateTime.parse(
                                      data["createddate"].toString()))
                              // DateTime.now().toString(),
                              ),
                        ],
                      ),
                    ),
                  ),

                  // pw.Spacer(),
                  // pw.Column(
                  //   mainAxisSize: pw.MainAxisSize.min,
                  //   crossAxisAlignment: pw.CrossAxisAlignment.start,
                  //   children: [
                  //     pw.Text(
                  //       data["vendor_name"],
                  //       style: pw.TextStyle(
                  //         fontSize: 15.5,
                  //         fontWeight: pw.FontWeight.bold,
                  //       ),
                  //     ),
                  //     // pw.Text(
                  //     //   'john@gmail.com',
                  //     // ),
                  //     pw.Text(data["createddate"].toString()
                  //         // DateTime.now().toString(),
                  //         ),
                  //   ],
                  // ),
                ],
              ),
            ),

            pw.SizedBox(height: 3 * PdfPageFormat.mm),
            // pw.Divider(),
            pw.SizedBox(height: 10 * PdfPageFormat.mm),
            pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Container(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Bill To:',
                          style: pw.TextStyle(
                            fontSize: 17.0,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 3 * PdfPageFormat.mm),
                        pw.Text(
                          address1 +
                              "\n" +
                              address2 +
                              address3 +
                              address4 +
                              "\n" +
                              address5 +
                              " - " +
                              data['pincode'].toString() +
                              "\n" +
                              address6 +
                              ", " +
                              data['country'].toString(),
                          // data['deliver_address'].toString().toUpperCase(),
                          style: pw.TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        pw.SizedBox(height: 5 * PdfPageFormat.mm),
                        // pw.Text(
                        //   'Tax Number',
                        //   style: pw.TextStyle(
                        //     fontSize: 17.0,
                        //     fontWeight: pw.FontWeight.bold,
                        //   ),
                        // ),
                        // pw.Text(
                        //   data['tax'].toString(),
                        //   style: pw.TextStyle(
                        //     fontSize: 17.0,
                        //     fontWeight: pw.FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(width: 3 * PdfPageFormat.mm),
                pw.Expanded(
                  child: pw.Container(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Bill From:',
                          style: pw.TextStyle(
                            fontSize: 17.0,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 3 * PdfPageFormat.mm),
                        pw.Text(
                          address1 +
                              "\n" +
                              address2 +
                              address3 +
                              address4 +
                              "\n" +
                              address5 +
                              " - " +
                              data['pincode'].toString() +
                              "\n" +
                              address6 +
                              ", " +
                              data['country'].toString(),
                          // data['deliver_address'].toString().toUpperCase(),
                          style: pw.TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        pw.SizedBox(height: 5 * PdfPageFormat.mm),
                        // pw.Text(
                        //   'Tax Number',
                        //   style: pw.TextStyle(
                        //     fontSize: 17.0,
                        //     fontWeight: pw.FontWeight.bold,
                        //   ),
                        // ),
                        // pw.Text(
                        //   data['tax'].toString(),
                        //   style: pw.TextStyle(
                        //     fontSize: 17.0,
                        //     fontWeight: pw.FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // pw.Text(
            //   'Dear ${data["vendor_name"]},\nLorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error',
            //   textAlign: pw.TextAlign.justify,
            // ),
            pw.SizedBox(height: 10 * PdfPageFormat.mm),

            ///
            /// PDF Table Create
            ///
            pw.Table.fromTextArray(
              headers: tableHeaders,
              data: tableData,
              border: null,
              headerStyle:
                  pw.TextStyle(fontSize: 14.0, fontWeight: pw.FontWeight.bold),
              headerDecoration:
                  const pw.BoxDecoration(color: PdfColors.grey100),
              cellHeight: 30.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
                2: pw.Alignment.centerRight,
                3: pw.Alignment.centerRight,
                4: pw.Alignment.centerRight,
              },
            ),
            // pw.Divider(),
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Row(
                children: [
                  pw.Spacer(flex: 3),
                  pw.Expanded(
                    flex: 3,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Divider(),
                        // pw.Row(
                        //   children: [
                        //     pw.Expanded(
                        //       child: pw.Text(
                        //         'Net total',
                        //         style: pw.TextStyle(
                        //           fontWeight: pw.FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     pw.Text(
                        //       data["actual_price"].toString(),
                        //       style: pw.TextStyle(
                        //         fontWeight: pw.FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        pw.SizedBox(height: 3 * PdfPageFormat.mm),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Subtotal',
                                style: pw.TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Image(
                              pw.MemoryImage(imageIcon),
                              height: 8,
                              width: 8,
                            ),
                            pw.Text(
                              data["actual_price"].toString(),
                              style: pw.TextStyle(
                                fontSize: 14.0,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 5 * PdfPageFormat.mm),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Discount',
                                style: pw.TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Image(
                              pw.MemoryImage(imageIcon),
                              height: 8,
                              width: 8,
                            ),
                            pw.Text(
                              data["discount_price"].toString(),
                              style: pw.TextStyle(
                                fontSize: 14.0,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 5 * PdfPageFormat.mm),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'GST(18%)',
                                style: pw.TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Image(
                              pw.MemoryImage(imageIcon),
                              height: 8,
                              width: 8,
                            ),
                            pw.Text(
                              data["tax"].toString(),
                              style: pw.TextStyle(
                                fontSize: 14.0,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 5 * PdfPageFormat.mm),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Invoice Total',
                                style: pw.TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Image(
                              pw.MemoryImage(imageIcon),
                              height: 8,
                              width: 8,
                            ),
                            pw.Text(
                              data["total_amount"].toString(),
                              style: pw.TextStyle(
                                fontSize: 14.0,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 5 * PdfPageFormat.mm),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Paid',
                                style: pw.TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Image(
                              pw.MemoryImage(imageIcon),
                              height: 8,
                              width: 8,
                            ),
                            pw.Text(
                              data["total_amount"].toString(),
                              style: pw.TextStyle(
                                fontSize: 14.0,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 5 * PdfPageFormat.mm),
                        // pw.Row(
                        //   children: [
                        //     pw.Expanded(
                        //       child: pw.Text(
                        //         'Vat 19.5 %',
                        //         style: pw.TextStyle(
                        //           fontWeight: pw.FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     pw.Text(
                        //       '\$ 90.48',
                        //       style: pw.TextStyle(
                        //         fontWeight: pw.FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        pw.Divider(),
                        pw.Row(
                          children: [
                            // pw.Expanded(
                            //   child: pw.Text(
                            //     'Total amount due',
                            //     style: pw.TextStyle(
                            //       fontSize: 14.0,
                            //       fontWeight: pw.FontWeight.bold,
                            //     ),
                            //   ),
                            // ),
                            // pw.Text(
                            //   data["total_amount"].toString(),
                            //   style: pw.TextStyle(
                            //     fontWeight: pw.FontWeight.bold,
                            //   ),
                            // ),
                            pw.Expanded(
                              child: pw.Text(
                                'Amount Due',
                                style: pw.TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.red,
                                ),
                              ),
                            ),
                            pw.Image(
                              pw.MemoryImage(imageIcon),
                              height: 8,
                              width: 8,
                            ),
                            pw.Text(
                              '${amount_due}',
                              style: pw.TextStyle(
                                fontSize: 14.0,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.red,
                              ),
                            ),
                          ],
                        ),
                        // pw.SizedBox(height: 2 * PdfPageFormat.mm),
                        // pw.Container(height: 1, color: PdfColors.grey400),
                        // pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
                        // pw.Container(height: 1, color: PdfColors.grey400),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        footer: (context) {
          return pw.Column(
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              // pw.Divider(),
              pw.SizedBox(height: 2 * PdfPageFormat.mm),
              // pw.Text(
              //   'Flutter Approach',
              //   style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              // ),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Payments:',
                    style: pw.TextStyle(
                        fontSize: 14.0, fontWeight: pw.FontWeight.bold),
                  ),
                  // pw.Text(
                  //   data["deliver_address"].toString(),
                  // ),
                ],
              ),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Image(
                    pw.MemoryImage(imageIcon),
                    height: 8,
                    width: 8,
                  ),
                  pw.Text(
                    data["total_amount"].toString() +
                        " " +
                        'Payment from Visa ********5678',
                    style: pw.TextStyle(
                        fontSize: 14.0, fontWeight: pw.FontWeight.bold),
                  ),
                  // pw.Text(
                  //   'eventsneeds@gmail.com',
                  // ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return FileHandleApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }
}
