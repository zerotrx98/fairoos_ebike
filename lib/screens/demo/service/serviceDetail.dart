import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Serv_detailScreen extends StatelessWidget {
  String serv_docid;
  late CollectionReference allServeces;

  Serv_detailScreen(this.serv_docid, {Key? key}) : super(key: key) {
    allServeces = FirebaseFirestore.instance
        .collection('Users')
        .doc(serv_docid)
        .collection('ARservices');
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.sizeOf(context).height;



    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.green[900]),
            child: Center(
              child: Text(
                'Services',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)),
            child: StreamBuilder(
              stream: allServeces.snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      final Map<String, dynamic> dataStore =
                          snapshot.data.docs[index].data()
                              as Map<String, dynamic>;
                      String documentId = snapshot.data.docs[index].id;

                      return InkWell(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    dataStore['date'],
                                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                  ),
                                  PopupMenuButton(
                                    itemBuilder: (context) {
                                      return [
                                        const PopupMenuItem<int>(
                                          value: 1,
                                          child: Text("Delete"),
                                        ),
                                      ];
                                    },
                                    onSelected: (value) {
                                      if (value == 0) {
                                        if (value == 1) {
                                          // Handle Delete action
                                          allServeces
                                              .doc(documentId)
                                              .delete()
                                              .then((_) {
                                            // Document deleted successfully, you can navigate back or do other operations.
                                            Navigator.pop(context);
                                          }).catchError((error) {
                                            // Handle any errors that occur during deletion.
                                            print(
                                                "Error deleting document: $error");
                                          });
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                  child: Container(
                                    height: height*0.3,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text("Vehicle Details",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: <Widget>[
                                              const Text("Date:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black)),
                                              Text(' ${dataStore['date']}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black54)),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: <Widget>[
                                              const Text("HandlingPerson:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black)),
                                              Text(
                                                  '${dataStore['handlingperson']}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black54)),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: <Widget>[
                                              const Text("Vehicle Model:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black)),
                                              Text(
                                                  '${dataStore['deliveryDate']}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black54)),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: <Widget>[
                                              const Text("Place:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black)),
                                              Text(' ${dataStore['time']}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black54)),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: <Widget>[
                                              const Text("RegistrationNo:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black)),
                                              Text(' ${dataStore['km']}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black54)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                             Padding(
                               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                               child: Container(
                                 height: height*0.3,width:double.infinity,

                                 decoration: BoxDecoration(
                                     color: Colors.grey[300],
                                     borderRadius:
                                     BorderRadius.circular(10)),
                                 child:                                       Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 5),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                       const Text(
                                           "Complaint Details",
                                           style: TextStyle(
                                               fontSize: 18,
                                               fontWeight: FontWeight.w600,
                                               color: Colors.black54)),
                                       Row(
                                         mainAxisAlignment:
                                         MainAxisAlignment.spaceBetween,
                                         children: <Widget>[
                                           const Text("Complaint01:",
                                               style: TextStyle(
                                                   fontSize: 20,
                                                   fontWeight:
                                                   FontWeight.w600,
                                                   color: Colors.black)),
                                           Text(
                                               ' ${dataStore['complaint01']}',
                                               style: const TextStyle(
                                                   fontSize: 18,
                                                   fontWeight:
                                                   FontWeight.w600,
                                                   color: Colors.black54)),
                                         ],
                                       ),
                                       Row(
                                         mainAxisAlignment:
                                         MainAxisAlignment.spaceBetween,
                                         children: <Widget>[
                                           const Text("Complaint02:",
                                               style: TextStyle(
                                                   fontSize: 20,
                                                   fontWeight:
                                                   FontWeight.w600,
                                                   color: Colors.black)),
                                           Text(
                                               ' ${dataStore['complaint02']}',
                                               style: const TextStyle(
                                                   fontSize: 18,
                                                   fontWeight:
                                                   FontWeight.w600,
                                                   color: Colors.black54)),
                                         ],
                                       ),
                                       Row(
                                         mainAxisAlignment:
                                         MainAxisAlignment.spaceBetween,
                                         children: <Widget>[
                                           const Text("Complaint03:",
                                               style: TextStyle(
                                                   fontSize: 20,
                                                   fontWeight:
                                                   FontWeight.w600,
                                                   color: Colors.black)),
                                           Text(
                                               ' ${dataStore['complaint03']}',
                                               style: const TextStyle(
                                                   fontSize: 18,
                                                   fontWeight:
                                                   FontWeight.w600,
                                                   color: Colors.black54)),
                                         ],
                                       ),
                                       Row(
                                         mainAxisAlignment:
                                         MainAxisAlignment.spaceBetween,
                                         children: <Widget>[
                                           const Text("Complaint04:",
                                               style: TextStyle(
                                                   fontSize: 20,
                                                   fontWeight:
                                                   FontWeight.w600,
                                                   color: Colors.black)),
                                           Text(
                                               ' ${dataStore['complaint04']}',
                                               style: const TextStyle(
                                                   fontSize: 18,
                                                   fontWeight:
                                                   FontWeight.w600,
                                                   color: Colors.black54)),
                                         ],
                                       ),
                                       Row(
                                         mainAxisAlignment:
                                         MainAxisAlignment.spaceBetween,
                                         children: <Widget>[
                                           const Text("Complaint05:",
                                               style: TextStyle(
                                                   fontSize: 20,
                                                   fontWeight:
                                                   FontWeight.w600,
                                                   color: Colors.black)),
                                           Text(
                                               ' ${dataStore['complaint05']}',
                                               style: const TextStyle(
                                                   fontSize: 18,
                                                   fontWeight:
                                                   FontWeight.w600,
                                                   color: Colors.black54)),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),

                               ),
                             ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                  child: Container(
                                    height: height*0.4,width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                    child:                                       Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text(
                                              "SpareParts Details",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54)),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text("SparePart01:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.black)),
                                              Text(
                                                  '${dataStore['sparePart01']}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.black54)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text("SparePart02:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.black)),
                                              Text(
                                                  ' ${dataStore['sparePart02']}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.black54)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text("SparePart03:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.black)),
                                              Text(
                                                  ' ${dataStore['sparePart03']}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.black54)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text("SparePart04:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.black)),
                                              Text(
                                                  ' ${dataStore['sparePart04']}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.black54)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text("SparePart05:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.black)),
                                              Text(
                                                  ' ${dataStore['sparePart05']}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.black54)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text("BillAmount:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.black)),
                                              Text(
                                                  ' ${dataStore['billAmount']}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.black54)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )

                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green,
                  );
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
