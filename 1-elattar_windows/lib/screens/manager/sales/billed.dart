import 'package:auto_size_text/auto_size_text.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elattar_windows/pdf/api/api_pdf.dart';
// import 'package:elattar/pdf/api/pdf_bill_api.dart';
// import 'package:elattar/pdf/model/bill.dart';
import 'package:elattar_windows/pdf/model/boll.dart';
// import 'package:elattar/pdf/model/client.dart';
// import 'package:elattar/pdf/model/moderator.dart';
import 'package:elattar_windows/screens/manager/sales/test_pdf.dart';
import 'package:firedart/firedart.dart';
// import 'package:elattar/api/pdf_api.dart';
// import 'package:elattar/api/pdf_billed.dart';
// import 'package:elattar/api/pdf_invoice_api.dart';
// import 'package:elattar/model/customer.dart';
// import 'package:elattar/model/invoice.dart';
// import 'package:elattar/model/supplier.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';

class Billed extends StatefulWidget {
  const Billed({Key? key,
    required this.clientName,
    required this.clientGovernorate,
    required this.clientAddress,
    required this.clientNumber,
    required this.orderDate,
    required this.factory,
    required this.address,
    required this.number1,
    required this.number2,

    required this.salesId,
    required this.moderatorName,
    required this.moderatorId,
    required this.productUnits,
    required this.totalPriceProducts,

  }) : super(key: key);

  final String clientName;
  final String clientGovernorate;
  final String clientAddress;
  final String clientNumber;
  final String orderDate;
  final String factory;
  final String address;
  final String number1;
  final String number2;

  final String salesId;
  final String moderatorName;
  final String moderatorId;
  final int productUnits;
  final int totalPriceProducts;

  static String id = 'Billed';

  @override
  State<Billed> createState() => _BilledState();
}

class _BilledState extends State<Billed> {

  @override
  void initState() {
    super.initState();
    // PdfInvoiceApi.initA();
    // PdfBillApi.initA();
    TestPdf.initA();
  }

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // double mediaQueryHeight = MediaQuery.of(context).size.height;
    // double mediaQueryWidth = MediaQuery.of(context).size.width;
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    var refFireStore = Firestore.instance
        .collection('Sales').document(widget.salesId).collection('ClientProducts');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.totalPriceProducts}',
          style: const TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Colors.blue,
        elevation: 5,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: ()
            async {


              showLoading(context);

              ///  delete collection  ###########################
              // var ref = FirebaseFirestore.instance.collection('Sales').doc(widget.salesId)
              //     .collection('buyerProducts');
              //
              // var snap = await ref.get();
              //
              // for ( var doc in snap.docs ){
              //   await doc.reference.delete();
              // }
              // FirebaseFirestore.instance.collection('Sales').doc(widget.salesId).delete();
              /// #####################################

              await Firestore.instance
                  .collection('Sales').document(widget.salesId).update({
                'waiting' : 'false',
                'sold' : 'true',
              });

              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();Navigator.of(context).pop();


              // Navigator.of(context).pushNamed(Map.id);
            },
            icon: const Icon(
                Icons.event_available
              // Icons.account_balance_wallet_outlined,
              // Icons.delete_sweep,
              // size: 30,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () async {

            // ********************************************
            // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            // **********************************************
            // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            // final pdfFile = await PdfInvoiceApi.generate(invoice);
            // PdfApi.openFile(pdfFile);

            // final date = DateTime.now();
            // final dueDate = date.add(const Duration(days: 7));

            // ##################################
            // ##################################

            // final date = DateTime.now();
            // final dueDate = date.add(const Duration(days: 7));
            //
            // final invoice = Invoice(
            //   supplier: const Supplier(
            //     name: 'Sarah Field',
            //     address: 'Sarah Street 9, Beijing, China',
            //     paymentInfo: 'https://paypal.me/sarahfieldzz',
            //   ),
            //   customer: const Customer(
            //     name: 'Apple Inc.',
            //     address: 'Apple Street, Cupertino, CA 95014',
            //   ),
            //   info: InvoiceInfo(
            //     date: date,
            //     dueDate: dueDate,
            //     description: 'My description...',
            //     number: '${DateTime.now().year}-9999',
            //   ),
            //   items: [
            //     InvoiceItem(
            //       description: 'Coffee',
            //       date: DateTime.now(),
            //       quantity: 3,
            //       vat: 0.19,
            //       unitPrice: 5.99,
            //     ),
            //     InvoiceItem(
            //       description: 'Water',
            //       date: DateTime.now(),
            //       quantity: 8,
            //       vat: 0.19,
            //       unitPrice: 0.99,
            //     ),
            //     InvoiceItem(
            //       description: 'Orange',
            //       date: DateTime.now(),
            //       quantity: 3,
            //       vat: 0.19,
            //       unitPrice: 2.99,
            //     ),
            //     InvoiceItem(
            //       description: 'Apple',
            //       date: DateTime.now(),
            //       quantity: 8,
            //       vat: 0.19,
            //       unitPrice: 3.99,
            //     ),
            //     InvoiceItem(
            //       description: 'Mango',
            //       date: DateTime.now(),
            //       quantity: 1,
            //       vat: 0.19,
            //       unitPrice: 1.59,
            //     ),
            //     InvoiceItem(
            //       description: 'Blue Berries',
            //       date: DateTime.now(),
            //       quantity: 5,
            //       vat: 0.19,
            //       unitPrice: 0.99,
            //     ),
            //     InvoiceItem(
            //       description: 'Lemon',
            //       date: DateTime.now(),
            //       quantity: 4,
            //       vat: 0.19,
            //       unitPrice: 1.29,
            //     ),
            //   ],
            // );
            //
            // final pdfFile = await PdfInvoiceApi.generate(invoice);
            //
            // PdfApi.openFile(pdfFile);
            // ##################################
            // ##################################

            // final invoice = Invoice(
            //   supplier: const Supplier(
            //     name: 'Sarah Field',
            //     // name: 'إسم العميل',
            //     address: 'Sarah Street 9, Beijing, China',
            //     // address: 'عنوان العميل',
            //     paymentInfo: 'https://paypal.me/sarahfieldzz',
            //     // paymentInfo: 'معلومه أخري عن العميل',
            //   ),
            //   customer: const Customer(
            //     name: 'Apple Inc.',
            //     // name: 'إسم المسوق',
            //     address: 'Apple Street, Cupertino, CA 95014',
            //     // address: 'معلومه عن المسوق',
            //   ),
            //   info: InvoiceInfo(
            //     date: date,
            //     dueDate: dueDate,
            //     description: 'My description...',
            //     number: '${DateTime.now().year}-9999',
            //   ),
            //   items: [
            //     // FirebaseFirestore.instance.collection('Sales').where('clintName', isEqualTo: widget.clintName).get()
            //     // .then((QuerySnapshot querySnapshot) {
            //     //
            //     // } ),
            //     InvoiceItem(
            //       description: 'قهوه',
            //       date: DateTime.now(),
            //       quantity: 3,
            //       vat: 0.19,
            //       unitPrice: 5.99,
            //     ),
            //     InvoiceItem(
            //       description: 'ماء',
            //       date: DateTime.now(),
            //       quantity: 8,
            //       vat: 0.19,
            //       unitPrice: 0.99,
            //     ),
            //     InvoiceItem(
            //       description: 'برتقاله',
            //       date: DateTime.now(),
            //       quantity: 3,
            //       vat: 0.19,
            //       unitPrice: 2.99,
            //     ),
            //     InvoiceItem(
            //       description: 'تفاحه',
            //       date: DateTime.now(),
            //       quantity: 8,
            //       vat: 0.19,
            //       unitPrice: 3.99,
            //     ),
            //     InvoiceItem(
            //       description: 'منجا',
            //       date: DateTime.now(),
            //       quantity: 1,
            //       vat: 0.19,
            //       unitPrice: 1.59,
            //     ),
            //     InvoiceItem(
            //       description: 'تمر',
            //       date: DateTime.now(),
            //       quantity: 5,
            //       vat: 0.19,
            //       unitPrice: 0.99,
            //     ),
            //     InvoiceItem(
            //       description: 'ليمون',
            //       date: DateTime.now(),
            //       quantity: 4,
            //       vat: 0.19,
            //       unitPrice: 1.29,
            //     ),
            //   ],
            // );
            //
            // // final pdfFile = await BilledPdf.generate(invoice);
            // final pdfFile = await PdfInvoiceApi.generate(invoice);
            //
            // PdfApi.openFile(pdfFile);

            //  Final this Code

            // FirebaseFirestore.instance.collection('Sales').doc(widget.salesId)
            //     .collection('buyerProducts').get()
            //     .then((QuerySnapshot querySnapshot) async {
            //   // ignore: avoid_function_literals_in_foreach_calls
            //   querySnapshot.docs.forEach((element) async {
            //
            //           final pdfFile = await TestPdf.generatePdf(
            //               Boll(
            //                   userModel: UserModelA(
            //                         code: element['productCode'],
            //                         name: element['productName'],
            //                         num: element['totalProducts'],
            //                         price: element['productsPrice'],
            //                         totalPrice: element['totalPrice'],
            //                   )
            //                   // items: [
            //                   //   BollItem(
            //                   //     code: element['productCode'],
            //                   //     name: element['productName'],
            //                   //     num: element['totalProducts'],
            //                   //     price: element['productsPrice'],
            //                   //     totalPrice: element['totalPrice'],
            //                   //   ),
            //                   // ],
            //                   // userModel: [
            //                   //   UserModelA(
            //                   //     code: element['productCode'],
            //                   //     name: element['productName'],
            //                   //     num: element['totalProducts'],
            //                   //     price: element['productsPrice'],
            //                   //     totalPrice: element['totalPrice'],
            //                   //   ),
            //                   // ]
            //               ));
            //           ApiPdf.openFile(pdfFile);
            //     // });
            //   });
            //
            // });

            List<List<dynamic>> xc = [];
            Firestore.instance.collection('Sales').document(widget.salesId)
                .collection('ClientProducts').get()
                .then((value) async {
              // ignore: avoid_function_literals_in_foreach_calls
              value.forEach((element) async {
                // List zxc = [
                //   element['totalPrice'], element['productsPrice'],element['totalProducts'],
                //   element['productName'],element['productCode'],
                // ];
                xc.add(
                    [
                      element['totalPrice'],element['productsPrice'],
                      element['totalProducts'],
                      element['productsName'],element['productsCode'],
                    ]
                );
              });
              final pdfFile = await TestPdf.generatePdf(
                  Boll(
                      asd: xc,
                      info: BollInfo(
                        moderatorName: widget.moderatorName,
                        clientName: widget.clientName,
                        clientGovernorate: widget.clientGovernorate,
                        clientAddress: widget.clientAddress,
                        clientNumber: widget.clientNumber,
                        orderDate: widget.orderDate,
                        productUnits: widget.productUnits,
                        totalPriceProducts: widget.totalPriceProducts,
                        factory: widget.factory,
                        address: widget.address,
                        number1: widget.number1,
                        number2: widget.number2,
                      )
                  )
              );
              ApiPdf.openFile(pdfFile);
            });
            //     .then((QuerySnapshot querySnapshot) async {
            //   // ignore: avoid_function_literals_in_foreach_calls
            //   querySnapshot.docs.forEach((element) async {
            //     // List zxc = [
            //     //   element['totalPrice'], element['productsPrice'],element['totalProducts'],
            //     //   element['productName'],element['productCode'],
            //     // ];
            //     xc.add(
            //         [
            //           element['totalPrice'],element['productsPrice'],
            //           element['totalProducts'],
            //           element['productsName'],element['productsCode'],
            //         ]
            //     );
            //   });
            //   final pdfFile = await TestPdf.generatePdf(
            //       Boll(
            //           asd: xc,
            //           info: BollInfo(
            //             moderatorName: widget.moderatorName,
            //             clientName: widget.clientName,
            //             clientGovernorate: widget.clientGovernorate,
            //             clientAddress: widget.clientAddress,
            //             clientNumber: widget.clientNumber,
            //             orderDate: widget.orderDate,
            //             productUnits: widget.productUnits,
            //             totalPriceProducts: widget.totalPriceProducts,
            //             factory: widget.factory,
            //             address: widget.address,
            //             number1: widget.number1,
            //             number2: widget.number2,
            //           )
            //       )
            //   );
            //   ApiPdf.openFile(pdfFile);
            // });

          },
          icon: const Icon(
            Icons.print,
            // color: Colors.white,
          ),
        ),
        // ),
      ),
      body:
      StreamBuilder<dynamic>(
          stream: refFireStore
          // .where('totalProducts', isEqualTo: 1)
          // .orderBy('date', descending: true)
          .stream,
          //     .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {return const Center(child: Text('Something went wrong'));}
            if (snapshot.connectionState == ConnectionState.waiting) {return const Center(child: Text("Loading"));}
            return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, i) {
                  // int productsPrice = snapshot.data!.docs[i]['productsPrice'];
                  // int totalProducts = snapshot.data!.docs[i]['totalProducts'];
                  return Column(
                    children: <Widget>[
                      const Divider(thickness: 2,color: Colors.lightBlueAccent,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: mediaQueryWidth * .95,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      // onTap: onTap,
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            AutoSizeText(
                                              ' ${snapshot.data![i]['productsCode']} || ${snapshot.data![i]['productsName']} ',
                                              // snapshot.data!.docs[i]['productName'],
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                              minFontSize: 10,
                                              maxLines: 3,
                                            ),
                                            AutoSizeText(
                                              ' ${snapshot.data![i]['productsSize']} || ${snapshot.data![i]['productsColor']} ',
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                              minFontSize: 10,
                                              maxLines: 3,
                                            ),
                                            AutoSizeText(
                                              '${snapshot.data![i]['productsPrice']} {${snapshot.data![i]['totalProducts']}}',
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                              minFontSize: 10,
                                              maxLines: 3,
                                            ),
                                          ]
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        // Text('${snapshot.data!.docs[i]['productPrice'] + '${snapshot.data!.docs[i]['productsQuantity']}'}'),
                                        // Text(' إجمالي السعر: ${productPrice * productsQuantity}'),
                                        Text(' إجمالي السعر: ${snapshot.data![i]['totalPrice']}'),
                                        // InkWell(
                                        //   onTap: onTapEdite,
                                        //   child: const Icon(Icons.edit,),
                                        // ),

                                      ],
                                    ),
                                  ],
                                ),
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
            );
          }
      ),
      // StreamBuilder<QuerySnapshot>(
      //     stream: refFireStore.snapshots(),
      //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (snapshot.hasError) {return const Center(child: Text('Something went wrong'));}
      //       if (snapshot.connectionState == ConnectionState.waiting) {return const Center(child: Text("Loading"));}
      //       return GridView.builder(
      //           itemCount: snapshot.data!.docs.length,
      //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 1,
      //             childAspectRatio: 3,
      //           ),
      //           itemBuilder: (context, i) {
      //             return  SingleChildScrollView(
      //               child: Column(
      //                   children: <Widget>[
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: <Widget>[
      //                         // SizedBox(
      //                         // height: 200,
      //                         // width: mediaQueryWidth * .95,
      //                         // child:
      //                         Card(
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(9.0),
      //                             child: Column(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               children: <Widget>[
      //                                 InkWell(
      //                                   onTap: (){},
      //                                   child: Column(
      //                                       mainAxisAlignment: MainAxisAlignment.center,
      //                                       children: <Widget>[
      //                                         AutoSizeText(
      //                                           snapshot.data!.docs[i]['productCode'],
      //                                           textDirection: TextDirection.rtl,
      //                                           textAlign: TextAlign.start,
      //                                           style: const TextStyle(
      //                                             fontSize: 20,
      //                                             color: Colors.black,
      //                                           ),
      //                                           minFontSize: 10,
      //                                           maxLines: 3,
      //                                         ),
      //                                         AutoSizeText(
      //                                           snapshot.data!.docs[i]['productName'],
      //                                           textDirection: TextDirection.rtl,
      //                                           textAlign: TextAlign.start,
      //                                           style: const TextStyle(
      //                                             fontSize: 20,
      //                                             color: Colors.black,
      //                                           ),
      //                                           minFontSize: 10,
      //                                           maxLines: 3,
      //                                         ),
      //                                         AutoSizeText(
      //                                           snapshot.data!.docs[i]['productSize'],
      //                                           textDirection: TextDirection.rtl,
      //                                           textAlign: TextAlign.start,
      //                                           style: const TextStyle(
      //                                             fontSize: 20,
      //                                             color: Colors.black,
      //                                           ),
      //                                           minFontSize: 10,
      //                                           maxLines: 3,
      //                                         ),
      //                                         AutoSizeText(
      //                                           snapshot.data!.docs[i]['productColor'],
      //                                           textDirection: TextDirection.rtl,
      //                                           textAlign: TextAlign.start,
      //                                           style: const TextStyle(
      //                                             fontSize: 20,
      //                                             color: Colors.black,
      //                                           ),
      //                                           minFontSize: 10,
      //                                           maxLines: 3,
      //                                         ),
      //                                         AutoSizeText(
      //                                           '${snapshot.data!.docs[i]['totalProducts']}',
      //                                           textDirection: TextDirection.rtl,
      //                                           textAlign: TextAlign.start,
      //                                           style: const TextStyle(
      //                                             fontSize: 20,
      //                                             color: Colors.black,
      //                                           ),
      //                                           minFontSize: 10,
      //                                           maxLines: 3,
      //                                         ),
      //                                         AutoSizeText(
      //                                           '${snapshot.data!.docs[i]['productsPrice']}',
      //                                           textDirection: TextDirection.rtl,
      //                                           textAlign: TextAlign.start,
      //                                           style: const TextStyle(
      //                                             fontSize: 20,
      //                                             color: Colors.black,
      //                                           ),
      //                                           minFontSize: 10,
      //                                           maxLines: 3,
      //                                         ),
      //                                       ]
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                             // ),
      //                           ),
      //                         ),
      //                         // ),
      //                       ],
      //                     ),
      //                     const SizedBox(height: 30),
      //                   ]
      //               ),
      //             );
      //
      //             // return Column(
      //             //   children: <Widget>[
      //             //     const Divider(thickness: 2,color: Colors.lightBlueAccent,),
      //             //     Row(
      //             //       mainAxisAlignment: MainAxisAlignment.center,
      //             //       children: <Widget>[
      //             //         SizedBox(
      //             //           width: mediaQueryWidth * .95,
      //             //           child: Card(
      //             //             child: Padding(
      //             //               padding: const EdgeInsets.all(9.0),
      //             //               child: Column(
      //             //                 mainAxisAlignment: MainAxisAlignment.center,
      //             //                 children: <Widget>[
      //             //                   InkWell(
      //             //                     // onTap: onTap,
      //             //                     child: Column(
      //             //                         mainAxisAlignment: MainAxisAlignment.center,
      //             //                         children: <Widget>[
      //             //                           AutoSizeText(
      //             //                             snapshot.data!.docs[i]['productName'],
      //             //                             textDirection: TextDirection.rtl,
      //             //                             textAlign: TextAlign.start,
      //             //                             style: const TextStyle(
      //             //                               fontSize: 20,
      //             //                               color: Colors.black,
      //             //                             ),
      //             //                             minFontSize: 10,
      //             //                             maxLines: 3,
      //             //                           ),
      //             //                           AutoSizeText(
      //             //                             snapshot.data!.docs[i]['productCode'],
      //             //                             textDirection: TextDirection.rtl,
      //             //                             textAlign: TextAlign.start,
      //             //                             style: const TextStyle(
      //             //                               fontSize: 20,
      //             //                               color: Colors.black,
      //             //                             ),
      //             //                             minFontSize: 10,
      //             //                             maxLines: 3,
      //             //                           ),
      //             //                           AutoSizeText(
      //             //                             '${snapshot.data!.docs[i]['productsPrice']}',
      //             //                             textDirection: TextDirection.rtl,
      //             //                             textAlign: TextAlign.start,
      //             //                             style: const TextStyle(
      //             //                               fontSize: 20,
      //             //                               color: Colors.black,
      //             //                             ),
      //             //                             minFontSize: 10,
      //             //                             maxLines: 3,
      //             //                           ),
      //             //                         ]
      //             //                     ),
      //             //                   ),
      //             //                   Row(
      //             //                     mainAxisAlignment: MainAxisAlignment.start,
      //             //                     children: <Widget>[
      //             //                       // Text('${snapshot.data!.docs[i]['productsPrice'] + '${snapshot.data!.docs[i]['totalProducts']}'}'),
      //             //                       Text(' إجمالي السعر: ${productsPrice * totalProducts}'),
      //             //                       // InkWell(
      //             //                       //   onTap: onTapEdite,
      //             //                       //   child: const Icon(Icons.edit,),
      //             //                       // ),
      //             //
      //             //                     ],
      //             //                   ),
      //             //                 ],
      //             //               ),
      //             //               // ),
      //             //             ),
      //             //           ),
      //             //         ),
      //             //       ],
      //             //     ),
      //             //   ],
      //             // );
      //           }
      //       );
      //     }
      // ),

      // ##################


      // SingleChildScrollView(
      //   child: Column(
      //     children: <Widget>[
      //       SizedBox(
      //         height: mediaQueryHeight * .3,
      //           child:
      //
      //       ),
      // const SizedBox(height: 50,),
      // SizedBox(
      //   height: 20,
      //   child:
      //   StreamBuilder<QuerySnapshot>(
      //       stream: refFireStore.snapshots(),
      //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //         if (snapshot.hasError) {return const Center(child: Text('Something went wrong'));}
      //         if (snapshot.connectionState == ConnectionState.waiting) {return const Center(child: Text("Loading"));}
      //         return GridView.builder(
      //             itemCount: snapshot.data!.docs.length,
      //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 1,
      //               childAspectRatio: 3,
      //             ),
      //             itemBuilder: (context, i) {
      //               return ElevatedButton(
      //                 style: ButtonStyle(
      //                     backgroundColor: getColor(Colors.blue, Colors.red)
      //                 ),
      //                 onPressed: () async {
      //
      //                   // var boll;
      //                   // = const Boll(
      //                   //     items:[
      //                   // BollItem(
      //                   // code: code,
      //                   // name: name,
      //                   // num: num,
      //                   // price: price,
      //                   // totalPrice: totalPrice
      //                   // ),
      //                   // ]
      //                   // );
      //
      //
      //                   // FirebaseFirestore.instance.collection('Sales').doc(widget.salesId)
      //                   //     .collection('buyerProducts').get()
      //                   //     .then((QuerySnapshot querySnapshot) async {
      //                   //   // ignore: avoid_function_literals_in_foreach_calls
      //                   //   querySnapshot.docs.forEach((element) async {
      //                   //     setState(() {
      //                   //       boll =
      //                   //           Boll(
      //                   //               items: [
      //                   //                 BollItem(
      //                   //                   code: element['productCode'],
      //                   //                   name: element['productName'],
      //                   //                   num: element['numberOfUnits'],
      //                   //                   price: element['productsPrice'],
      //                   //                   totalPrice: element['totalProducts'],
      //                   //                 ),
      //                   //               ]
      //                   //           );
      //                   //     });
      //                   //   });final pdfFile = await TestPdf.generatePdf(boll);
      //                   //   ApiPdf.openFile(pdfFile);
      //                   // });
      //                   //       boll =
      //                   //           Boll(
      //                   //               items:
      //                   //               [
      //                   //                 BollItem(
      //                   //                   code: snapshot.data!.docs[i]['productCode'],
      //                   //                   name: snapshot.data!.docs[i]['productName'],
      //                   //                   num: snapshot.data!.docs[i]['numberOfUnits'],
      //                   //                   price: snapshot.data!.docs[i]['productsPrice'],
      //                   //                   totalPrice: snapshot.data!.docs[i]['totalProducts'],
      //                   //                 ),
      //                   //               ]
      //                   //           );
      //                         // print(Boll(
      //                         //     items: [
      //                         //       BollItem(
      //                         //         code: snapshot.data!.docs[i]['productCode'],
      //                         //         name: snapshot.data!.docs[i]['productName'],
      //                         //         num: snapshot.data!.docs[i]['numberOfUnits'],
      //                         //         price: snapshot.data!.docs[i]['productsPrice'],
      //                         //         totalPrice: snapshot.data!.docs[i]['totalProducts'],
      //                         //       ),
      //                         //     ]
      //                         // ));
      //                         // print('###############################');
      //                     final pdfFile = await TestPdf.generatePdf(
      //                         Boll(
      //                         items: [
      //                           BollItem(
      //                             code: snapshot.data!.docs[i]['productCode'],
      //                             name: snapshot.data!.docs[i]['productName'],
      //                             num: snapshot.data!.docs[i]['numberOfUnits'],
      //                             price: snapshot.data!.docs[i]['productsPrice'],
      //                             totalPrice: snapshot.data!.docs[i]['totalProducts'],
      //                           ),
      //                         ]
      //                     )
      //                     // boll
      //                     );
      //                     ApiPdf.openFile(pdfFile);
      //
      //
      //                 },
      //                 // color: Colors.blue,
      //                 child: const Text(
      //                   ' تسجيل المورد ',
      //                   style: TextStyle(color: Colors.black),
      //                 ),
      //               );
      //               // return Column(
      //               //   children: <Widget>[
      //               //     const Divider(thickness: 2,color: Colors.lightBlueAccent,),
      //               //     Row(
      //               //       mainAxisAlignment: MainAxisAlignment.center,
      //               //       children: <Widget>[
      //               //         SizedBox(
      //               //           width: mediaQueryWidth * .95,
      //               //           child: Card(
      //               //             child: Padding(
      //               //               padding: const EdgeInsets.all(9.0),
      //               //               child: Column(
      //               //                 mainAxisAlignment: MainAxisAlignment.center,
      //               //                 children: <Widget>[
      //               //                   InkWell(
      //               //                     // onTap: onTap,
      //               //                     child: Column(
      //               //                         mainAxisAlignment: MainAxisAlignment.center,
      //               //                         children: <Widget>[
      //               //                           AutoSizeText(
      //               //                             snapshot.data!.docs[i]['productName'],
      //               //                             textDirection: TextDirection.rtl,
      //               //                             textAlign: TextAlign.start,
      //               //                             style: const TextStyle(
      //               //                               fontSize: 20,
      //               //                               color: Colors.black,
      //               //                             ),
      //               //                             minFontSize: 10,
      //               //                             maxLines: 3,
      //               //                           ),
      //               //                           AutoSizeText(
      //               //                             snapshot.data!.docs[i]['productCode'],
      //               //                             textDirection: TextDirection.rtl,
      //               //                             textAlign: TextAlign.start,
      //               //                             style: const TextStyle(
      //               //                               fontSize: 20,
      //               //                               color: Colors.black,
      //               //                             ),
      //               //                             minFontSize: 10,
      //               //                             maxLines: 3,
      //               //                           ),
      //               //                           AutoSizeText(
      //               //                             '${snapshot.data!.docs[i]['productsPrice']}',
      //               //                             textDirection: TextDirection.rtl,
      //               //                             textAlign: TextAlign.start,
      //               //                             style: const TextStyle(
      //               //                               fontSize: 20,
      //               //                               color: Colors.black,
      //               //                             ),
      //               //                             minFontSize: 10,
      //               //                             maxLines: 3,
      //               //                           ),
      //               //                         ]
      //               //                     ),
      //               //                   ),
      //               //                   Row(
      //               //                     mainAxisAlignment: MainAxisAlignment.start,
      //               //                     children: <Widget>[
      //               //                       // Text('${snapshot.data!.docs[i]['productsPrice'] + '${snapshot.data!.docs[i]['totalProducts']}'}'),
      //               //                       Text(' إجمالي السعر: ${productsPrice * totalProducts}'),
      //               //                       // InkWell(
      //               //                       //   onTap: onTapEdite,
      //               //                       //   child: const Icon(Icons.edit,),
      //               //                       // ),
      //               //
      //               //                     ],
      //               //                   ),
      //               //                 ],
      //               //               ),
      //               //               // ),
      //               //             ),
      //               //           ),
      //               //         ),
      //               //       ],
      //               //     ),
      //               //   ],
      //               // );
      //             }
      //         );
      //       }
      //   ),
      // ),
      // ElevatedButton(
      //   style: ButtonStyle(
      //       backgroundColor: getColor(Colors.blue, Colors.red)
      //   ),
      //   onPressed: () async {},
      //   // color: Colors.blue,
      //   child: const Text(
      //     ' تسجيل المورد ',
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      // SizedBox(
      //   height: mediaQueryHeight * .5,
      //   child: StreamBuilder<QuerySnapshot>(
      //       stream: refFireStore.snapshots(),
      //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //         if (snapshot.hasError) {return const Center(child: Text('Something went wrong'));}
      //         if (snapshot.connectionState == ConnectionState.waiting) {return const Center(child: Text("Loading"));}
      //         return GridView.builder(
      //             itemCount: snapshot.data!.docs.length,
      //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 1,
      //               childAspectRatio: 3,
      //             ),
      //             itemBuilder: (context, i) {
      //               return Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: 120),
      //                   child: ElevatedButton(
      //                       style: ButtonStyle(
      //                           backgroundColor: getColor(Colors.blue, Colors.red)
      //                       ),
      //                       onPressed: () async {
      //
      //                       },
      //                       child: const Text(
      //                         ' طباعه ', // Login
      //                         style: TextStyle(color: Colors.black),
      //                       ),
      //                     ),
      //
      //               );
      //             }
      //         );
      //       }
      //   ),
      // ),
      // const SizedBox(height: 200,),
      // SizedBox(
      //   height: mediaQueryHeight * .4,
      //     child: StreamBuilder<QuerySnapshot>(
      //         stream: refFireStore
      //         // .orderBy('date', descending: true)
      //             .snapshots(),
      //         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //           if (snapshot.hasError) {return const Center(child: Text('Something went wrong'));}
      //           if (snapshot.connectionState == ConnectionState.waiting) {return const Center(child: Text("Loading"));}
      //           return GridView.builder(
      //               itemCount: snapshot.data!.docs.length,
      //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 1,
      //                 childAspectRatio: 3,
      //               ),
      //               itemBuilder: (context, i) {
      //                 int totalProducts = snapshot.data!.docs[i]['totalProducts'];
      //                 return SizedBox(
      //                   height: MediaQuery.of(context).size.height,
      //                   child: Padding(
      //                     padding: const EdgeInsets.all(5),
      //                     child: SingleChildScrollView(
      //                       child: Column(
      //                           children: <Widget>[
      //                             const SizedBox(height: 20,),
      //                             const Text('بيانات العميل', style: TextStyle(fontSize: 25),),
      //                             // const SizedBox(height: 15,),
      //                             Directionality(
      //                               textDirection: TextDirection.rtl,
      //                               child: ListTile(
      //                                 title: Text(clintName, style: const TextStyle(color: Colors.black),),
      //                                 // subtitle: Text(name ?? 'إسم المستخدم'),
      //                                 // subtitle: Text('إسم المستخدم', style: TextStyle(color: Colors.black),),
      //                               ),
      //                             ),
      //                             const SizedBox(height: 15,),
      //                             Directionality(
      //                               textDirection: TextDirection.rtl,
      //                               child: ListTile(
      //                                 title: Text(clintAddress, style: const TextStyle(color: Colors.black),),
      //                                 // subtitle: Text(name ?? 'إسم المستخدم'),
      //                                 // subtitle: Text('إسم المستخدم', style: TextStyle(color: Colors.black),),
      //                               ),
      //                             ),
      //                             const SizedBox(height: 15,),
      //                             Directionality(
      //                               textDirection: TextDirection.rtl,
      //                               child: ListTile(
      //                                 title: Text(clintNumber, style: const TextStyle(color: Colors.black),),
      //                                 // subtitle: Text(name ?? 'إسم المستخدم'),
      //                                 // subtitle: Text('إسم المستخدم', style: TextStyle(color: Colors.black),),
      //                               ),
      //                             ),
      //                             const SizedBox(height: 15,),
      //                             const Directionality(
      //                               textDirection: TextDirection.rtl,
      //                               child: ListTile(
      //                                 title: Text('تاريخ الطلبيه', style: TextStyle(color: Colors.black),),
      //                                 // subtitle: Text(name ?? 'إسم المستخدم'),
      //                                 // subtitle: Text('إسم المستخدم', style: TextStyle(color: Colors.black),),
      //                               ),
      //                             ),
      //                             const SizedBox(height: 20,),
      //                             const Text('بيانات الطلبيه', style: TextStyle(fontSize: 25),),
      //                             widgetInkWell(
      //                               name: 'كود المنتج',
      //                               address: 'إسم المنتج',
      //                               number: 'الكميه من المنتج',
      //                               price: 'سعر المنتج',
      //                               priceA: 'إجمالي سعر المنتج',
      //                               onTap: (){
      //                                 // Navigator.of(context).pushNamed(SuppliersData.id);
      //                               },
      //                               onTapEdite: (){
      //                                 // Navigator.of(context).pushNamed(ModifySupplierData.id);
      //                               },
      //                             ),
      //                             widgetInkWell(
      //                               name: 'كود المنتج',
      //                               address: 'إسم المنتج',
      //                               number: 'الكميه من المنتج',
      //                               price: 'سعر المنتج',
      //                               priceA: 'إجمالي سعر المنتج',
      //                               onTap: (){
      //                                 // Navigator.of(context).pushNamed(SuppliersData.id);
      //                               },
      //                               onTapEdite: (){
      //                                 // Navigator.of(context).pushNamed(ModifySupplierData.id);
      //                               },
      //                             ),
      //                             const SizedBox(height: 20,),
      //                             const Text('إجمالي الفاتوره   750  ', style: TextStyle(fontSize: 20),),
      //                             // const Directionality(
      //                             //   textDirection: TextDirection.rtl,
      //                             //   child: ListTile(
      //                             //     title: Text('كود المنتج', style: TextStyle(color: Colors.black),),
      //                             //     // subtitle: Text(name ?? 'إسم المستخدم'),
      //                             //     // subtitle: Text('إسم المستخدم', style: TextStyle(color: Colors.black),),
      //                             //   ),
      //                             // ),
      //                             // const Directionality(
      //                             //   textDirection: TextDirection.rtl,
      //                             //   child: ListTile(
      //                             //     title: Text('إسم المنتج', style: TextStyle(color: Colors.black),),
      //                             //     // subtitle: Text(name ?? 'إسم المستخدم'),
      //                             //     // subtitle: Text('إسم المستخدم', style: TextStyle(color: Colors.black),),
      //                             //   ),
      //                             // ),
      //                             // const Directionality(
      //                             //   textDirection: TextDirection.rtl,
      //                             //   child: ListTile(
      //                             //     title: Text('الكميه من المنتج', style: TextStyle(color: Colors.black),),
      //                             //     // subtitle: Text(name ?? 'إسم المستخدم'),
      //                             //     // subtitle: Text('إسم المستخدم', style: TextStyle(color: Colors.black),),
      //                             //   ),
      //                             // ),
      //                             // const Directionality(
      //                             //   textDirection: TextDirection.rtl,
      //                             //   child: ListTile(
      //                             //     title: Text('سعر المنتج', style: TextStyle(color: Colors.black),),
      //                             //     // subtitle: Text(name ?? 'إسم المستخدم'),
      //                             //     // subtitle: Text('إسم المستخدم', style: TextStyle(color: Colors.black),),
      //                             //   ),
      //                             // ),
      //                             // const Directionality(
      //                             //   textDirection: TextDirection.rtl,
      //                             //   child: ListTile(
      //                             //     title: Text('إجمالي سعر المنتج', style: TextStyle(color: Colors.black),),
      //                             //     // subtitle: Text(name ?? 'إسم المستخدم'),
      //                             //     // subtitle: Text('إسم المستخدم', style: TextStyle(color: Colors.black),),
      //                             //   ),
      //                             // ),
      //                             const SizedBox(height: 30,),
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               children: <Widget>[
      //                                 ElevatedButton(
      //                                   style: ButtonStyle(
      //                                       backgroundColor: getColor(Colors.white, Colors.green)
      //                                   ),
      //                                   onPressed: (){
      //                                     // Navigator.pushNamed(context, HomeManager.id);
      //                                   },
      //                                   child: const Text('طباعه', style: TextStyle(color: Colors.black),),
      //                                 ),
      //                                 // Builder(
      //                                 //   // ignore: deprecated_member_use
      //                                 //   builder: (context) => RaisedButton(
      //                                 //     onPressed: ()
      //                                 //     async {
      //                                 //       if (formstate.currentState.validate())
      //                                 //       {
      //                                 //         formstate.currentState.save();
      //                                 //         showLoading(context);
      //                                 //        } else {}
      //                                 //     },
      //                                 //     child: const Text('عرض المنتج'),
      //                                 //   ),
      //                                 // ),
      //                               ],
      //                             ),
      //                             const SizedBox(height: 30),
      //                           ]
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //               }
      //           );
      //         }
      //     ),
      // ),
      // ]
      // )
      // ),

    );
  }

  widgetInkWell({name, address, number, onTap, onTapEdite, price, priceA}){
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          // height: 200,
          width: mediaQueryWidth * .95,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: onTap,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AutoSizeText(
                            name,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            minFontSize: 10,
                            maxLines: 3,
                          ),
                          AutoSizeText(
                            address,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            minFontSize: 10,
                            maxLines: 3,
                          ),
                          AutoSizeText(
                            number,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            minFontSize: 10,
                            maxLines: 3,
                          ),
                          AutoSizeText(
                            price,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            minFontSize: 10,
                            maxLines: 3,
                          ),
                          AutoSizeText(
                            priceA,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            minFontSize: 10,
                            maxLines: 3,
                          ),
                        ]
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: <Widget>[
                  //     InkWell(
                  //       onTap: onTapEdite,
                  //       child: const Icon(Icons.edit,),
                  //     ),
                  //
                  //   ],
                  // ),

                ],
              ),
              // ),
            ),
          ),
        ),
      ],
    );

  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed){
    getColor(Set<MaterialState> state){
      if(state.contains(MaterialState.pressed)){
        return colorPressed;
      } else {
        return color;
      }
    }
    return MaterialStateProperty.resolveWith(getColor);
  }

  showLoading(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
              title: Text('أنتظر قليلاً'),
              content: SizedBox(
                  height: 50,
                  child: Center(
                      child: CircularProgressIndicator()
                  )
              )
          );
        }
    );
  }
}
