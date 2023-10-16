import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Serv_detailScreen extends StatelessWidget {

  String serv_docid;
  late CollectionReference allServeces;

  Serv_detailScreen( this.serv_docid,{Key? key}) : super(key: key) {
    allServeces = FirebaseFirestore.instance.collection('Users')
        .doc(serv_docid)
        .collection('ARservices');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[
            Container(
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.green[900],
              child:  Positioned(
                  top: 2,
                  left: 5,
                  child:
                  Builder(builder: (context) {
                    return IconButton(
                      icon:Icon(Icons.navigate_before,color: Colors.white,
                        size: 32,) ,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },);
                  },)
              ),
            ),
            Positioned(
              top: 50,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft:Radius.circular(20) )
                ),
                child: Column(
                    children: [
                      Text('Services',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),),
                      Container(
                        child: Expanded(
                          flex: 1,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: StreamBuilder(
                              stream: allServeces.snapshots(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.docs.length,
                                    itemBuilder: (context, index) {
                                      final Map<String, dynamic> dataStore = snapshot.data.docs[index].data() as Map<String, dynamic>;
                                      String documentId = snapshot.data.docs[index].id;

                                      return  InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [

                                                        Container(
                                                    height: 690,
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
                                                          child:
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                          Container(
                                                           child: Center(
                                                             child: Text(
                                                             dataStore['date'],
                                                             style: TextStyle(fontSize: 20),
                                                             ),
                                                           ),
                                                         ),
                                                              Column(
                                                                children: [
                                                                  Container(
                                                              padding: const EdgeInsets.only(left: 10.0,right: 300,bottom: 0,top: 10),
                                                              child: const Text("Vehicle Details", style: TextStyle(fontSize: 18,
                                                              fontWeight: FontWeight.w600,color: Colors.black54)
                                                                    ),
                                                                      ),
                                                                   Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("Date:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 95.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['date']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("HandlingPerson:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 65.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              '${dataStore['handlingperson']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("Vehicle Model:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 85.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              '${dataStore['deliveryDate']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("Place:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 104.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['time']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("RegistrationNo:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 20.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['km']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Divider(),
                                                               Column(
                                                                children: [
                                                                   Container(
                                                                     padding: const EdgeInsets.only(left: 10.0,right: 290,bottom: 0,top: 10),
                                                                     child: const Text("Complaint Details", style: TextStyle(fontSize: 18,
                                                                     fontWeight: FontWeight.w600,color: Colors.black54
                                                                   )),
                                                                    ),
                                                                Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("Complaint01:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 60.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['complaint01']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("Complaint02:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 60.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['complaint02']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("Complaint03:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 60.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['complaint03']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("Complaint04:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 60.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['complaint04']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("Complaint05:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 60.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['complaint05']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                 SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                 Divider(),
                                                                 ],
                                                                 ),
                                                             Column(
                                                              children: [
                                                                 Container(
                                                                 padding: const EdgeInsets.only(left: 10.0,right: 290,bottom: 0,top: 10),
                                                                 child: const Text("SpareParts Details", style: TextStyle(fontSize: 18,
                                                                 fontWeight: FontWeight.w600,color: Colors.black54
                                                                  )),
                                                                  ),
                                                                    Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("SparePart01:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 60.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              '${dataStore['sparePart01']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("SparePart02:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 60.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['sparePart02']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("SparePart03:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 60.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['sparePart03']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),


                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("SparePart04:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 60.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['sparePart04']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("SparePart05:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 60.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['sparePart05']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Text("BillAmount:" ,style: TextStyle(fontSize: 20,
                                                                            fontWeight: FontWeight.w600,color: Colors.black
                                                                        )),
                                                                        Padding(
                                                                          padding:const EdgeInsets.only(left: 45.0,right: 0,bottom: 0,top: 0),
                                                                          child: Text(
                                                                              ' ${dataStore['billAmount']}',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,color: Colors.black54
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                 ],
                                                               )
                                                                ],
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
                                                        if (value == 0) {
                                                          if (value == 1) {
                                                            // Handle Delete action
                                                            allServeces.doc(
                                                                documentId)
                                                                .delete()
                                                                .then((_) {
                                                              // Document deleted successfully, you can navigate back or do other operations.
                                                              Navigator.pop(
                                                                  context);
                                                            }).catchError((
                                                                error) {
                                                              // Handle any errors that occur during deletion.
                                                              print(
                                                                  "Error deleting document: $error");
                                                            });
                                                          }
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