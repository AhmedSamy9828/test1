import 'package:auto_size_text/auto_size_text.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elattar/pdf/api/api_pdf.dart';
// import 'package:elattar/pdf/model/boll.dart';
// import 'package:elattar/pdf/test/testA.dart';
import 'package:elattar_windows/screens/manager/sales/billed.dart';
// import 'package:elattar/screens/manager/sales/pdf_test.dart';
// import 'package:elattar_windows/screens/manager/sales/test_pdf.dart';
import 'package:firedart/firedart.dart';
// import 'package:firedart/firestore/firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:elattar/screens/manager/sales/billed.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:elattar/screens/manager/sales/sold.dart';
import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  const Sales({Key? key}) : super(key: key);
  static String id = 'Sales';

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {


  late String factory = '';
  late String address = '';
  late String number1 = '';
  late String number2 = '';

  // ver() async {
  //   DocumentReference infoModerators = Firestore.instance
  //       .collection('Info').document('zRFWZKNxdKtBKS8tKEfD');
  //   final qwe = await infoModerators.get();
  //   setState(() {
  //     factory= qwe['factory'];
  //     address= qwe['address'];
  //     number1= qwe['number1'];
  //     number2= qwe['number2'];
  //   });
  //   print('factory');
  //   print('address');
  //   print('number1');
  //   print('number2');
  // }
  //
  // @override
  // void initState() {
  //   ver();
  //   super.initState();
  //   TestPdf.initA();
  // }

  @override
  Widget build(BuildContext context) {
    // double mediaQueryWidth = MediaQuery.of(context).size.width;
    // User? user = FirebaseAuth.instance.currentUser;


    CollectionReference refFireStore = Firestore.instance.collection('Sales');
    CollectionReference groceryCollection = Firestore.instance.collection('Sales');
    Future<List<Document>> getGroceries() async {
      List<Document> groceries = await groceryCollection.where('waiting', isEqualTo: 'true').get();

      return groceries;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'المبيعات',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 40,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Colors.blue,
        elevation: 5,
        automaticallyImplyLeading: false,
        // actions: [
        //   IconButton(
        //     onPressed: ()
        //     {
        //       // Navigator.of(context).pushNamed(AddBox.id);
        //     },
        //     icon: const Icon(
        //       Icons.add_box,
        //       // size: 30,
        //     ),
        //   ),
        // ],
        // leading: IconButton(
        //   onPressed: () async {
        // Navigator.of(context).pushNamed(Sold.id);
        // Navigator.of(context).pushNamed(PdfTest.id);
        // Navigator.of(context).pushNamed(SfDataGridDemo.id);


        // FirebaseFirestore.instance.collection('Sales').doc('iRglGl1dCZYlQ0YsoyDo')
        //     .collection('buyerProducts').get()
        //     .then((QuerySnapshot querySnapshot) {
        //   querySnapshot.docs.forEach((element) async {
        //
        //     final boll = Boll(
        //         items: [
        //           BollItem(
        //             code: element['productCode'],
        //             name: element['productName'],
        //             num: element['numberOfUnits'],
        //             price: element['productPrice'],
        //             totalPrice: element['productsQuantity'],
        //           ),
        //         ]
        //     );
        //
        //     final pdfFile = await TestPdf.generatePdf(boll);
        //     ApiPdf.openFile(pdfFile);
        //
        //     // FirebaseFirestore.instance.collection('Moderators').doc(user.uid)
        //     //     .collection('clint').doc(widget.clintId).collection('ProductClint').get()
        //     //     .then((QuerySnapshot querySnapshot) {
        //     //   querySnapshot.docs.forEach((doc) async {
        //     //     await FirebaseFirestore.instance
        //     //         .collection('Sales').doc(element.id)
        //     //         .collection('buyerProducts').add({
        //     //
        //     //       'productId' : doc['productId'],
        //     //       'productCode' : doc['productCode'],
        //     //       'productName' : doc['productName'],
        //     //       'productSize' : doc['productSize'],
        //     //       'productColor' : doc['productColor'],
        //     //       'numberOfUnits' : doc['numberOfUnits'],
        //     //       'productPrice' : doc['productPrice'],
        //     //       'image1' : doc['image1'],
        //     //       'image2' : doc['image2'],
        //     //       'image3' : doc['image3'],
        //     //
        //     //       'productsQuantity' : doc['productsQuantity'],
        //     //
        //     //     });
        //     //   });
        //     // });
        //   });
        // });

        // final boll = Boll(
        //     items: [
        //       BollItem(
        //         code: code,
        //         name: name,
        //         num: num,
        //         price: price,
        //         totalPrice: totalPrice,
        //       ),
        //     ]
        // );

        // final pdfFile = await TestPdf.generatePdf(boll);
        // ApiPdf.openFile(pdfFile);

        // TestPdf.createPdf();

        //   },
        //   icon: const Icon(
        //     Icons.point_of_sale,
        //     // color: Colors.white,
        //   ),
        // ),
      ),
      body: FutureBuilder(
        future: getGroceries(),
          builder: (BuildContext context, AsyncSnapshot<List<Document>> snapshot) {
            if (snapshot.hasError) {return const Center(child: Text('Something went wrong'));}
            if (snapshot.connectionState == ConnectionState.waiting) {return const Center(child: Text("Loading"));}
          return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, i) {
                print(snapshot.data![i]['moderatorId']);
                print(snapshot.data![i]['moderatorName']);
                print(snapshot.data![i]['clientName']);
                print(snapshot.data![i]['clientAddress']);
                return SingleChildScrollView(
                  child: InkWell(
                    onTap: (){},
                    child:SizedBox(
                      height: 150,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              // onTap: tapWork,
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Billed(
                                          salesId : snapshot.data![i].id,
                                          moderatorId : snapshot.data![i]['moderatorId'],
                                          moderatorName : snapshot.data![i]['moderatorName'],
                                          totalPriceProducts : snapshot.data![i]['totalPriceProducts'],
                                          productUnits : snapshot.data![i]['productUnits'],
                                          clientName: snapshot.data![i]['clientName'],
                                          clientGovernorate: snapshot.data![i]['clientGovernorate'],
                                          clientAddress: snapshot.data![i]['clientAddress'],
                                          clientNumber: snapshot.data![i]['clientNumber'],
                                          orderDate: snapshot.data![i]['orderDate'],
                                          factory: factory,
                                          address: address,
                                          number1: number1,
                                          number2: number2,
                                        )
                                    )
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: SizedBox(
                                      // height: 90,
                                      // width:  200,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: AutoSizeText(
                                          ' { ${snapshot.data![i]['moderatorName']} } ',
                                          // 'إسم',
                                          // name,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                          minFontSize: 10,
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: SizedBox(
                                      // height: 90,
                                      // width:  200,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: AutoSizeText(
                                          ' - ${snapshot.data![i]['clientName']}    ',
                                          // 'إسم',
                                          // name,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                          minFontSize: 10,
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: SizedBox(
                                      // height: 90,
                                      // width:  200,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: AutoSizeText(
                                          '-${snapshot.data![i]['clientGovernorate']}=>${snapshot.data![i]['clientAddress']}',
                                          // 'إسم',
                                          // name,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                          minFontSize: 10,
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: SizedBox(
                                      // height: 90,
                                      // width:  200,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: AutoSizeText(
                                          '- ${snapshot.data![i]['clientNumber']} || ${snapshot.data![i]['orderDate']}',
                                          // 'إسم',
                                          // name,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                          minFontSize: 10,
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );

              }
          );
          }
      ),
      // StreamBuilder<dynamic>(
      //   initialData: dynamic,
      //     stream: refFireStore.stream,
      //         // .where('waiting', isEqualTo: 'true')
      //         // .orderBy('date', descending: true)
      //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //       if (snapshot.hasError) {return const Center(child: Text('Something went wrong'));}
      //       if (snapshot.connectionState == ConnectionState.waiting) {return const Center(child: Text("Loading"));}
      //       return GridView.builder(
      //           itemCount: snapshot.data!.length,
      //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 1,
      //             childAspectRatio: 2,
      //           ),
      //           itemBuilder: (context, i) {
      //             print(snapshot.data![i]['moderatorId']);
      //             print(snapshot.data![i]['moderatorName']);
      //             print(snapshot.data![i]['clientName']);
      //             print(snapshot.data![i]['clientAddress']);
      //             return SingleChildScrollView(
      //               child: InkWell(
      //                 onTap: (){},
      //                 child:SizedBox(
      //                   height: 150,
      //                   child: Card(
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: <Widget>[
      //                         InkWell(
      //                           // onTap: tapWork,
      //                           onTap: (){
      //                             Navigator.push(
      //                                 context,
      //                                 MaterialPageRoute(
      //                                     builder: (context) => Billed(
      //                                       salesId : snapshot.data![i].id,
      //                                       moderatorId : snapshot.data![i]['moderatorId'],
      //                                       moderatorName : snapshot.data![i]['moderatorName'],
      //                                       totalPriceProducts : snapshot.data![i]['totalPriceProducts'],
      //                                       productUnits : snapshot.data![i]['productUnits'],
      //                                       clientName: snapshot.data![i]['clientName'],
      //                                       clientGovernorate: snapshot.data![i]['clientGovernorate'],
      //                                       clientAddress: snapshot.data![i]['clientAddress'],
      //                                       clientNumber: snapshot.data![i]['clientNumber'],
      //                                       orderDate: snapshot.data![i]['orderDate'],
      //                                       factory: factory,
      //                                       address: address,
      //                                       number1: number1,
      //                                       number2: number2,
      //                                     )
      //                                 )
      //                             );
      //                           },
      //                           child: Column(
      //                             children: <Widget>[
      //                               Directionality(
      //                                 textDirection: TextDirection.rtl,
      //                                 child: SizedBox(
      //                                   // height: 90,
      //                                   // width:  200,
      //                                   child: Padding(
      //                                     padding: const EdgeInsets.only(right: 10),
      //                                     child: AutoSizeText(
      //                                       ' { ${snapshot.data![i]['moderatorName']} } ',
      //                                       // 'إسم',
      //                                       // name,
      //                                       style: const TextStyle(
      //                                         fontSize: 20,
      //                                         color: Colors.black,
      //                                       ),
      //                                       minFontSize: 10,
      //                                       maxLines: 3,
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ),
      //                               Directionality(
      //                                 textDirection: TextDirection.rtl,
      //                                 child: SizedBox(
      //                                   // height: 90,
      //                                   // width:  200,
      //                                   child: Padding(
      //                                     padding: const EdgeInsets.only(right: 10),
      //                                     child: AutoSizeText(
      //                                       ' - ${snapshot.data![i]['clientName']}    ',
      //                                       // 'إسم',
      //                                       // name,
      //                                       style: const TextStyle(
      //                                         fontSize: 20,
      //                                         color: Colors.black,
      //                                       ),
      //                                       minFontSize: 10,
      //                                       maxLines: 3,
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ),
      //                               Directionality(
      //                                 textDirection: TextDirection.rtl,
      //                                 child: SizedBox(
      //                                   // height: 90,
      //                                   // width:  200,
      //                                   child: Padding(
      //                                     padding: const EdgeInsets.only(right: 10),
      //                                     child: AutoSizeText(
      //                                       '-${snapshot.data![i]['clientGovernorate']}=>${snapshot.data![i]['clientAddress']}',
      //                                       // 'إسم',
      //                                       // name,
      //                                       style: const TextStyle(
      //                                         fontSize: 20,
      //                                         color: Colors.black,
      //                                       ),
      //                                       minFontSize: 10,
      //                                       maxLines: 3,
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ),
      //                               Directionality(
      //                                 textDirection: TextDirection.rtl,
      //                                 child: SizedBox(
      //                                   // height: 90,
      //                                   // width:  200,
      //                                   child: Padding(
      //                                     padding: const EdgeInsets.only(right: 10),
      //                                     child: AutoSizeText(
      //                                       '- ${snapshot.data![i]['clientNumber']} || ${snapshot.data![i]['orderDate']}',
      //                                       // 'إسم',
      //                                       // name,
      //                                       style: const TextStyle(
      //                                         fontSize: 20,
      //                                         color: Colors.black,
      //                                       ),
      //                                       minFontSize: 10,
      //                                       maxLines: 3,
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             );
      //
      //           }
      //       );
      //     }
      // ),
    );
  }

  widgetInkWell({image, name, sale, tap, tapWork, tapProfile}){
    return InkWell(
      onTap: tap,
      child:SizedBox(
        height: 100,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: tapProfile,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 80,
                    width:  100,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: tapWork,
                child: Column(
                  children: <Widget>[
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                        // height: 90,
                        // width:  200,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: AutoSizeText(
                            name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            minFontSize: 10,
                            maxLines: 3,
                          ),
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                        // height: 90,
                        // width:  200,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: AutoSizeText(
                            sale,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            minFontSize: 10,
                            maxLines: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  // widgetInkWell({image, name, tap}){
  //   return InkWell(
  //     child:SizedBox(
  //       height: 100,
  //       child: Card(
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: <Widget>[
  //             Padding(
  //               padding: const EdgeInsets.only(left: 10),
  //               child: SizedBox(
  //                 height: 80,
  //                 width:  100,
  //                 child: Image.asset(
  //                   image,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //             Directionality(
  //               textDirection: TextDirection.rtl,
  //               child: SizedBox(
  //                 height: 90,
  //                 width:  200,
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(right: 10),
  //                   child: AutoSizeText(
  //                     name,
  //                     style: const TextStyle(
  //                       fontSize: 20,
  //                       color: Colors.black,
  //                     ),
  //                     minFontSize: 10,
  //                     maxLines: 3,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //     onTap: tap,
  //   );
  // }

  asd ({image, name, price}){
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8, vertical: 5,),
      child: LayoutBuilder(
          builder: (context, constrains) {
            double localHeight = constrains.maxHeight;
            double localWidth = constrains.maxWidth;
            return InkWell(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: localWidth,
                    height: localHeight * .7,
                    child: Image(
                        image: NetworkImage(
                          image,
                          // snapshot.data.docs[i].data()['image1'],
                        ),
                        fit: BoxFit.fill
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: SizedBox(
                      height: localHeight * .1,
                      child: Row(
                        children: <Widget>[
                          AutoSizeText(
                            name,
                            // '${snapshot.data.docs[i].data()['center']}''/${snapshot.data.docs[i].data()['nickName']}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            minFontSize: 5,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: localHeight * .1,
                    child: AutoSizeText(
                      price,
                      // 'ج.م''${snapshot.data.docs[i].data()['price']}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      minFontSize: 7,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Navigator.of(context).pushNamed(ModifyAProduct.id);
                // Navigator.push(
                //     context, MaterialPageRoute(
                //     builder: (context) => DetailsBoy(
                //       idSeller: idSeller,
                //       productDocId: productDocId,
                //     )
                // )
                // );
              },
            );
          }
      ),
    );
  }
}
