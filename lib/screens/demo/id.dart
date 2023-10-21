import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ByidDetails extends StatelessWidget {
  String docId;
  late DocumentReference _reference;
  late Future<DocumentSnapshot> _futureData;

  ByidDetails(this.docId, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('Users').doc(docId);
    _futureData = _reference.get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _futureData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error as String),
          );
        }

        if (snapshot.hasData) {
          //get data
          DocumentSnapshot documentSnapshot = snapshot.data;
          Map data = documentSnapshot.data() as Map;

          // display the data
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Name:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 95.0, right: 0, bottom: 0, top: 0),
                      child: Text(data['FullName'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("PhoneNo:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 65.0, right: 0, bottom: 0, top: 0),
                      child: Text(data['PhoneNo'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Vehicle Model:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 85.0, right: 0, bottom: 0, top: 0),
                      child: Text(data['vehicle Model'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Place:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 104.0, right: 0, bottom: 0, top: 0),
                      child: Text(data['place'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("RegistrationNo:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 0, bottom: 0, top: 0),
                      child: Text(data['Registration number'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("MotorNo:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 60.0, right: 0, bottom: 0, top: 0),
                      child: Text(data['motor Number'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("ControllerNo:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 45.0, right: 0, bottom: 0, top: 0),
                      child: Text(data['controller Number'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("ChasesNo:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 70.0, right: 0, bottom: 0, top: 0),
                      child: Text(data['chase Number'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
