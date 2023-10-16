import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../id.dart';
import '../service/serviceDetail.dart';

class SingleUserDetail extends StatelessWidget {

  String ser_docid;
  late DocumentReference _reference;
  late Future<DocumentSnapshot> _futureData;
  late CollectionReference _referenceservices;

  SingleUserDetail(this.ser_docid,{Key? key}) : super(key: key){
    _reference =FirebaseFirestore.instance.collection('Users').doc(ser_docid);
    _futureData =_reference.get();
    _referenceservices=_reference.collection('ARservices');

  }


  @override
  Widget build(BuildContext context) {
    TextEditingController date01Controller = TextEditingController();
    TextEditingController complaint0101Controller = TextEditingController();
    TextEditingController complaint0102Controller = TextEditingController();
    TextEditingController complaint0103Controller = TextEditingController();
    TextEditingController complaint0104Controller = TextEditingController();
    TextEditingController complaint0105Controller = TextEditingController();
    TextEditingController sparepart0101Controller = TextEditingController();
    TextEditingController sparepart0102Controller = TextEditingController();
    TextEditingController sparepart0103Controller = TextEditingController();
    TextEditingController sparepart0104Controller = TextEditingController();
    TextEditingController sparepart0105Controller = TextEditingController();
    TextEditingController handlingperson01Controller = TextEditingController();
    TextEditingController deliveryDate01Controller= TextEditingController();
    TextEditingController km01Controller = TextEditingController();
    TextEditingController time01Controller = TextEditingController();
    TextEditingController billamount01Controller = TextEditingController();
    TextEditingController services_controller =TextEditingController();

    void clearText() {
      services_controller.clear();

      date01Controller.clear();
      complaint0101Controller.clear();
      complaint0103Controller .clear();
      complaint0104Controller .clear();
      complaint0105Controller .clear();
      sparepart0101Controller .clear();
      sparepart0102Controller .clear();
      sparepart0103Controller .clear();
      sparepart0104Controller .clear();
      sparepart0105Controller .clear();
      handlingperson01Controller .clear();
      deliveryDate01Controller.clear();
      km01Controller .clear();
      time01Controller.clear();
      billamount01Controller.clear();
    }
    return Scaffold(
      drawer: Drawer(
        child: ListView(
            children:[ DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ), child: null,
            ),
            ]
        ),
      ),
      body: Stack(
          children: [
            Container(
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.green[900],
            ),
            Positioned(
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
            Positioned(
                top: 5,
                right: 5,
                child:
                Builder(builder: (context) {
                  return ElevatedButton.icon(
                    icon: Icon(Icons.electric_scooter_rounded,color: Colors.black,),
                    label: Text('Previous Service Details',style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      print('Button Pressed');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Serv_detailScreen(ser_docid.toString()),));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.white,
                    ),
                  );
                },)
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
                child:SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                            height: 350,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:50,horizontal: 1 ),
                              child: Row(
                                children: [
                                  Expanded(child: ByidDetails(ser_docid)),
                                ],
                              ),
                            )
                        ),
                        SingleChildScrollView(
                          child: Expanded(
                            flex: 1,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
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
                                child: Column(
                                  children: [
                                    Card(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(left: 10.0,right: 190,bottom: 0,top: 10),
                                                child: const Text("handling Details", style: TextStyle(fontSize: 18,
                                                    fontWeight: FontWeight.w600,color: Colors.black54
                                                )),
                                              ),
                                            ],
                                          ),
                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: date01Controller,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    // borderRadius: const BorderRadius.all(Radius.circular(
                                                    //     20.0)),
                                                    // borderSide: BorderSide()
                                                  ),
                                                  labelText: 'Date',
                                                ),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: handlingperson01Controller,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    //     borderRadius: const BorderRadius.all(Radius.circular(
                                                    //         20.0)),
                                                    //     borderSide: BorderSide()
                                                  ),
                                                  labelText: 'handlingperson',
                                                ),
                                              )),

                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                keyboardType: TextInputType.number,
                                                controller: deliveryDate01Controller,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    //     borderRadius: const BorderRadius.all(Radius.circular(
                                                    //         20.0)),
                                                    //     borderSide: BorderSide()
                                                  ),
                                                  labelText: 'Deliverydate',
                                                ),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                keyboardType: TextInputType.number,
                                                controller: time01Controller,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    //     borderRadius: const BorderRadius.all(Radius.circular(
                                                    //         20.0)),
                                                    //     borderSide: BorderSide()
                                                  ),
                                                  labelText: 'Time',
                                                ),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: km01Controller,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    // borderRadius: const BorderRadius.all(Radius.circular(
                                                    //     20.0)),
                                                    // borderSide: BorderSide()
                                                  ),
                                                  labelText: 'Km',
                                                ),
                                              )),

                                        ],
                                      ),
                                    ),

                                    Card(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(left: 10.0,right: 200,bottom: 10,top: 10),
                                                child: const Text("Complaints", style: TextStyle(fontSize: 18,
                                                    fontWeight: FontWeight.w600,color:Colors.black54)),
                                              ),
                                            ],
                                          ),

                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: complaint0101Controller,
                                                decoration: InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(Radius.circular(
                                                          20.0)),
                                                      borderSide: BorderSide()
                                                  ),
                                                  labelText: 'complaint01',
                                                ),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: complaint0102Controller,
                                                decoration: InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(Radius.circular(
                                                          20.0)),
                                                      borderSide: BorderSide()
                                                  ),
                                                  labelText: 'complaint02',
                                                ),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: complaint0103Controller,
                                                decoration: InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(Radius.circular(
                                                          20.0)),
                                                      borderSide: BorderSide()
                                                  ),
                                                  labelText: 'complaint03',
                                                ),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: complaint0104Controller,
                                                decoration: InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(Radius.circular(
                                                          20.0)),
                                                      borderSide: BorderSide()
                                                  ),
                                                  labelText: 'complaint04',
                                                ),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: complaint0105Controller,
                                                decoration: InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(Radius.circular(
                                                          20.0)),
                                                      borderSide: BorderSide()
                                                  ),
                                                  labelText: 'complaint05',
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),

                                    Card(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(left: 10.0,right: 200,bottom: 10,top: 10),
                                                child: const Text("Spareparts", style: TextStyle(fontSize: 18,
                                                    fontWeight: FontWeight.w600,color:Colors.black54)),
                                              ),
                                            ],
                                          ),

                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: sparepart0101Controller,
                                                decoration: InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(Radius.circular(
                                                          20.0)),
                                                      borderSide: BorderSide()
                                                  ),
                                                  labelText: 'sparepart01',
                                                ),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: sparepart0102Controller,
                                                decoration: InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(Radius.circular(
                                                          20.0)),
                                                      borderSide: BorderSide()
                                                  ),
                                                  labelText: 'sparepart02',
                                                ),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: sparepart0103Controller,
                                                decoration: InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(Radius.circular(
                                                          20.0)),
                                                      borderSide: BorderSide()
                                                  ),
                                                  labelText: 'sparepart03',
                                                ),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: sparepart0104Controller,
                                                decoration: InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(Radius.circular(
                                                          20.0)),
                                                      borderSide: BorderSide()
                                                  ),
                                                  labelText: 'sparepart04',
                                                ),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.all(15),
                                              child: TextField(
                                                controller: sparepart0105Controller,
                                                decoration: InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(Radius.circular(
                                                          20.0)),
                                                      borderSide: BorderSide()
                                                  ),
                                                  labelText: 'sparepart05',
                                                ),
                                              )),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(400, 10, 8, 10),
                                      child: Card(
                                        child: Column(
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.all(15),
                                                child: TextField(
                                                  keyboardType: TextInputType.number,
                                                  controller: billamount01Controller,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      //     borderRadius: const BorderRadius.all(Radius.circular(
                                                      //         20.0)),
                                                      //     borderSide: BorderSide()
                                                    ),
                                                    labelText: 'Bill amount',
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   color: Colors.white,
                            //   child: TextField(
                            //     controller: services_controller,
                            //   ),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Serv_detailScreen(ser_docid.toString()),));

            Map<String,String> servicesData={
          'handling_staf':services_controller.text,
          'date': date01Controller.text,
          'handlingperson':handlingperson01Controller.text,
          'deliveryDate':deliveryDate01Controller.text,
          'time':time01Controller.text,
          'km':km01Controller.text,
          'complaint01':complaint0101Controller.text,
          'complaint02':complaint0102Controller.text,
          'complaint03':complaint0103Controller.text,
          'complaint04':complaint0104Controller.text,
          'complaint05':complaint0105Controller.text,
          'sparePart01':sparepart0101Controller.text,
          'sparePart02':sparepart0102Controller.text,
          'sparePart03':sparepart0103Controller.text,
          'sparePart04':sparepart0104Controller.text,
          'sparePart05':sparepart0105Controller.text,
          'billAmount':billamount01Controller.text,
        };
    _referenceservices.add(servicesData);
            clearText();
          },
          child: Text(
            "Save",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green[900]!),
          ),
        ),
      ),
    );
  }
}