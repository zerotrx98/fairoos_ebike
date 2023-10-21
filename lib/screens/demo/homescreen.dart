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
  String fullName = "";
  List userModel = [];

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
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: [
        Container(
          height: height,
          width: width,
          color: Colors.green[900],
        ),
        Positioned(
          top: height * 0.05,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                const Text("E-BIKE",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,color: Colors.white
                ),),
                const SizedBox(width: 10), // Add some spacing between text and search bar
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: null,
                      autofocus: false,
                      style: const TextStyle(fontSize: 18.0, color: Color(0xFFbdc6cf)),
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.search_rounded),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() {
                          fullName = val;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: height * 0.15,
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(children: [
              Expanded(
                child: SizedBox(
                  height: height,
                  width: width,
                  child: StreamBuilder(
                    stream: allusers.snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        // Filter the data based on the search query
                        var filteredData = snapshot.data.docs.where((doc) =>
                            doc['FullName'].toString().toLowerCase().contains(
                                  fullName.toLowerCase(),
                                ));
                        if (filteredData.isEmpty) {
                          // Display a message if no results are found
                          return const Center(
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
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: height * 0.1,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                            boxShadow: const [
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
                                                      padding:
                                                          const EdgeInsets
                                                              .only(
                                                        left: 10.0,
                                                        right: 10,
                                                        bottom: 10,
                                                        top: 10,
                                                      ),
                                                      child: Text(
                                                        dataStore[
                                                            'FullName'].toString().toUpperCase(),
                                                        style: const TextStyle(
                                                          color: Colors.black54,
                                                          fontWeight: FontWeight.bold,
                                                            fontSize: 18),
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
                                                const PopupMenuItem<int>(
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
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          "Confirm Delete"),
                                                      content: const Text(
                                                          "Are you sure you want to delete this user?"),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context); // Close the dialog
                                                          },
                                                          child:
                                                              const Text("Cancel"),
                                                        ),
                                                        TextButton(
                                                          onPressed:
                                                              () async {
                                                            Navigator.pop(
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
                                                          child:
                                                              const Text("Delete"),
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
                          height: height,
                          width: width,
                          color: Colors.green,
                        );
                      }
                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => RegistrationPage()),
          );
        },
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
