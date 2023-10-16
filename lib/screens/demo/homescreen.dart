import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'customer/customerDetail.dart';
import 'customer/registration.dart';
class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
 String FullName = "";
  List UserModel = [];

  final CollectionReference allusers =
  FirebaseFirestore.instance.collection('Users');
 Future<void> updateUser(String userId, Map<String, dynamic> newData) async {
   try {
     await allusers.doc(userId).update(newData);
     print("User data updated successfully");
   } catch (e) {
     print("Error updating user data: $e");
   }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => RegistrationPage()),
          );
          //
        },
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      body: Stack(
          children:[
            Container(
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.green[900],
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 400,top: 10),
                child:
                TextFormField(
                  controller: null,
                  autofocus: false,

                  style:
                  new TextStyle(fontSize: 18.0, color: Color(0xFFbdc6cf)),

                  decoration: InputDecoration(
                    labelText: "Search....",
                    fillColor: Colors.white,
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),

    onChanged: (val){
        setState(() {
          FullName = val;
        });
      },
                ),
              ),
            ),
            Positioned(
              top: 50,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft:Radius.circular(10) )
                ),
                child: Column(
                    children: [
                      Container(
                        child: Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child:  StreamBuilder(
                              stream: allusers.snapshots(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  // Filter the data based on the search query
                                  var filteredData = snapshot.data.docs.where((doc) =>
                                      doc['FullName'].toString().toLowerCase().contains(
                                        FullName.toLowerCase(),
                                      ));
                                  if (filteredData.isEmpty) {
                                    // Display a message if no results are found
                                    return Center(
                                      child: Text('No results found.'),
                                    );
                                  }
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: filteredData.length,
                                    itemBuilder: (context, index) {
                                      var data = filteredData.elementAt(index).data()
                                      as Map<String, dynamic>;
                                      final DocumentSnapshot dataStore =
                                      filteredData.elementAt(index);
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SingleUserDetail(dataStore.id),
                                            ),
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
                                                        InkWell(
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
                                                                      dataStore['FullName'],
                                                                      style: TextStyle(fontSize: 20),
                                                                    ),
                                                                    // Displaying all services dat
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 4,
                                                    right: 0,
                                                    bottom: 0,
                                                    child: PopupMenuButton(
                                                      itemBuilder: (context) {
                                                        return [
                                                          PopupMenuItem<int>(
                                                            value: 1,
                                                            child: Text("Delete"),
                                                          ),
                                                        ];
                                                      },
                                                      onSelected: (value) {

                                                         if (value == 1) {
                                                          // Handle Delete option
                                                          showDialog(
                                                            context: context,
                                                            builder: (
                                                                BuildContext context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    "Confirm Delete"),
                                                                content: Text(
                                                                    "Are you sure you want to delete this user?"),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () {
                                                                      Navigator
                                                                          .pop(
                                                                          context); // Close the dialog
                                                                    },
                                                                    child: Text(
                                                                        "Cancel"),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () async {
                                                                      Navigator
                                                                          .pop(
                                                                          context); // Close the dialog
                                                                      // Perform the delete action here
                                                                      try {
                                                                        await allusers
                                                                            .doc(
                                                                            dataStore
                                                                                .id)
                                                                            .delete();
                                                                        print(
                                                                            "User deleted successfully");
                                                                      } catch (e) {
                                                                        print(
                                                                            "Error deleting user: $e");
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                        "Delete"),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
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
                                    color: Colors.green,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ]
      ),
    );
  }
}