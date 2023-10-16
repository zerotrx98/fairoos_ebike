// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import '../newCustomer.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
// class _HomeScreenState extends State<HomeScreen> {
//
//   final CollectionReference store =
//   FirebaseFirestore.instance.collection('services');
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green[900],
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.local_print_shop_sharp),
//             tooltip: 'billing',
//             onPressed: () {
//               //   Navigator.push(context, MaterialPageRoute(builder: (_)=> Billing1()));
//               //
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.local_grocery_store_outlined),
//             tooltip: 'E-store',
//             onPressed: () {
//               // Navigator.push(context, MaterialPageRoute(builder: (_)=> Store1()));
//               //
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => NewCustomer()),
//           );
//           //
//         },
//         backgroundColor: Colors.green[900],
//         foregroundColor: Colors.black,
//         child: Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
//       body: StreamBuilder(
//         stream: store.orderBy('name').snapshots(),
//         builder: (context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data.docs.length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot dataStore = snapshot.data.docs[index];
//                 final Map<String, dynamic> data = dataStore.data() as Map<String, dynamic>;
//
//                 return
//                   InkWell(
//                     onTap: () {
//                       Navigator.pushNamed(
//                         context,
//                         '/exCustomer',
//                         arguments: {
//                           'name': dataStore['name'],
//                           'phoneNo': dataStore['phoneNo'],
//                           'vehicle': dataStore['vehicle'],
//                           'place': dataStore['place'],
//                           'registrationNo': dataStore['registrationNo'],
//                           'motorNo': dataStore['motorNo'],
//                           'ControllerNo': dataStore['ControllerNo'],
//                           'chasesNo': dataStore['chasesNo'],
//                           'id': dataStore.id,
//                         },
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Stack(
//                             children: [
//                               Container(
//                                 height: 60,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(8),
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey,
//                                       blurRadius: 10,
//                                       spreadRadius: 3,
//                                     ),
//                                   ],
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.only(
//                                         left: 10.0,
//                                         right: 10,
//                                         bottom: 10,
//                                         top: 10,
//                                       ),
//                                       child: Text(
//                                         dataStore['name'],
//                                         style: TextStyle(fontSize: 20),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 4,
//                                 right: 0,
//                                 bottom: 0,
//                                 child: PopupMenuButton(
//                                   itemBuilder: (context) {
//                                     return [
//                                       PopupMenuItem<int>(
//                                         value: 0,
//                                         child: Text("Edit"),
//                                       ),
//                                     ];
//                                   },
//                                   onSelected: (value) {
//                                     if (value == 0) {
//                                       Navigator.pushNamed(
//                                         context,
//                                         '/updateCustomer',
//                                         arguments: {
//                                           'name': dataStore['name'],
//                                           'phoneNo': dataStore['phoneNo'],
//                                           'vehicle': dataStore['vehicle'],
//                                           'place': dataStore['place'],
//                                           'registrationNo': dataStore['registrationNo'],
//                                           'motorNo': dataStore['motorNo'],
//                                           'ControllerNo': dataStore['ControllerNo'],
//                                           'chasesNo': dataStore['chasesNo'],
//                                           'id': dataStore.id,
//                                         },
//                                       );
//                                     }
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             return Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               color: Colors.white,
//             );
//           }
//         },
//       ),
//     );
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import '../newCustomer.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
// class _HomeScreenState extends State<HomeScreen> {
//
//   final CollectionReference store =
//   FirebaseFirestore.instance.collection('car');
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green[900],
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.local_grocery_store_outlined),
//             tooltip: 'E-store',
//             onPressed: () {
//               // Navigator.push(context, MaterialPageRoute(builder: (_)=> Store1()));
//               //
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => NewCustomer()),
//           );
//           //
//         },
//         backgroundColor: Colors.green[900],
//         foregroundColor: Colors.black,
//         child: Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
//       body: StreamBuilder<QuerySnapshot>(
//         stream: store.orderBy('name').snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot dataStore = snapshot.data!.docs[index];
//                 final Map<String, dynamic> data =
//                 dataStore.data() as Map<String, dynamic>;
//                 final List<dynamic> services = data['services'] ?? [];
//
//                 return
//                   InkWell(
//                     // onTap: () {
//                     //   Navigator.pushNamed(
//                     //     context,
//                     //     '/exCustomer',
//                     //     arguments: {
//                     //       'name': dataStore['name'],
//                     //       'phoneNo': dataStore['phoneNo'],
//                     //       'vehicle': dataStore['vehicle'],
//                     //       'place': dataStore['place'],
//                     //       'registrationNo': dataStore['registrationNo'],
//                     //       'motorNo': dataStore['motorNo'],
//                     //       'ControllerNo': dataStore['ControllerNo'],
//                     //       'chasesNo': dataStore['chasesNo'],
//                     //       'id': dataStore.id,
//                     //     },
//                     //   );
//                     // },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Stack(
//                             children: [
//                               Container(
//                                 height: 600,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(8),
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey,
//                                       blurRadius: 10,
//                                       spreadRadius: 3,
//                                     ),
//                                   ],
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.only(
//                                         left: 10.0,
//                                         right: 10,
//                                         bottom: 10,
//                                         top: 10,
//                                       ),
//                                      child: Column(
//                                        crossAxisAlignment: CrossAxisAlignment.start,
//                                        children: [
//                                          Text(
//                                            data['name'],
//                                            style: TextStyle(fontSize: 20),
//                                          ),
//                                          Text(
//                                            data['phoneNo'],
//                                            style: TextStyle(fontSize: 20),
//                                          ),
//                                          Text(
//                                            data['vehicle'],
//                                            style: TextStyle(fontSize: 20),
//                                          ),
//                                          // Displaying all services data
//                                          for (var service in services)
//                                            Column(
//                                              crossAxisAlignment:
//                                              CrossAxisAlignment.start,
//                                              children: [
//                                                Text(
//                                                  'Date: ${service['date']}',
//                                                  style: TextStyle(fontSize: 16),
//                                                ),
//                                                Text(
//                                                  'Handling Person: ${service['handlingperson']}',
//                                                  style: TextStyle(fontSize: 16),
//                                                ),
//                                                Text(
//                                                  'KM: ${service['km']}',
//                                                  style: TextStyle(fontSize: 16),
//                                                ),
//                                              ],
//                                            ),
//                                        ],
//                                      ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               // Positioned(
//                               //   top: 4,
//                               //   right: 0,
//                               //   bottom: 0,
//                               //   child: PopupMenuButton(
//                               //     itemBuilder: (context) {
//                               //       return [
//                               //         PopupMenuItem<int>(
//                               //           value: 0,
//                               //           child: Text("Edit"),
//                               //         ),
//                               //       ];
//                               //     },
//                               //     onSelected: (value) {
//                               //       if (value == 0) {
//                               //         Navigator.pushNamed(
//                               //           context,
//                               //           '/updateCustomer',
//                               //           arguments: {
//                               //             'name': dataStore['name'],
//                               //             'phoneNo': dataStore['phoneNo'],
//                               //             'vehicle': dataStore['vehicle'],
//                               //             'place': dataStore['place'],
//                               //             'registrationNo': dataStore['registrationNo'],
//                               //             'motorNo': dataStore['motorNo'],
//                               //             'ControllerNo': dataStore['ControllerNo'],
//                               //             'chasesNo': dataStore['chasesNo'],
//                               //             'id': dataStore.id,
//                               //           },
//                               //         );
//                               //       }
//                               //     },
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             return Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               color: Colors.white,
//             );
//           }
//         },
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../newCustomer.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  final CollectionReference store =
  FirebaseFirestore.instance.collection('car');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        actions: <Widget>[
          Card(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search.....'),
              onChanged: (val){
                setState(() {
                });
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => NewCustomer()),
          );
          //
        },
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      body: StreamBuilder<QuerySnapshot>(
        stream: store.orderBy('name').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot dataStore = snapshot.data!.docs[index];
                final Map<String, dynamic> data =
                dataStore.data() as Map<String, dynamic>;
                final List<dynamic> services = data['services'] ?? [];

                return
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/exCustomer',
                        arguments: {
                          'name': dataStore['name'],
                          'phoneNo': dataStore['phoneNo'],
                          'vehicle': dataStore['vehicle'],
                          'place': dataStore['place'],
                          'registrationNo': dataStore['registrationNo'],
                          'motorNo': dataStore['motorNo'],
                          'ControllerNo': dataStore['controllerNo'],
                          'chasesNo': dataStore['chasesNo'],
                          'id': dataStore.id,
                          'servicesJson': jsonEncode(data['services']),
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10,
                                        bottom: 10,
                                        top: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['name'],
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          // Displaying all services dat
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Positioned(
                              //   top: 4,
                              //   right: 0,
                              //   bottom: 0,
                              //   child: PopupMenuButton(
                              //     itemBuilder: (context) {
                              //       return [
                              //         PopupMenuItem<int>(
                              //           value: 0,
                              //           child: Text("Edit"),
                              //         ),
                              //       ];
                              //     },
                              //     onSelected: (value) {
                              //       if (value == 0) {
                              //         Navigator.pushNamed(
                              //           context,
                              //           '/updateCustomer',
                              //           arguments: {
                              //             'name': dataStore['name'],
                              //             'phoneNo': dataStore['phoneNo'],
                              //             'vehicle': dataStore['vehicle'],
                              //             'place': dataStore['place'],
                              //             'registrationNo': dataStore['registrationNo'],
                              //             'motorNo': dataStore['motorNo'],
                              //             'ControllerNo': dataStore['ControllerNo'],
                              //             'chasesNo': dataStore['chasesNo'],
                              //             'id': dataStore.id,
                              //           },
                              //         );
                              //       }
                              //     },
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
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
              color: Colors.white,
            );
          }
        },
      ),
    );
  }
}
