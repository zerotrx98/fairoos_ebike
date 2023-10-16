import 'package:cloud_firestore/cloud_firestore.dart';
import'package:flutter/material.dart';

class AddressData extends StatefulWidget {
  @override
  State<AddressData> createState() => _AddressDataState();
}

class _AddressDataState extends State<AddressData> {
  final CollectionReference store =
  FirebaseFirestore.instance.collection('services');

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
  String docId = '';

  @override
  void initState() {
    super.initState();
  }
  void addsericvesDetails()async{
    final data = {
      //service01
      'date': date01Controller.text,
      'handlingPerson':handlingperson01Controller.text,
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
    store.doc(docId).update(data);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            // color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('ServicesDetails',
          style: TextStyle( color:Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600
          ),),
        backgroundColor: Colors.green[900],
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child:SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Column(
                      children: [
                        Card(
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
              )
          ),

        ],
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, ),
        child: ElevatedButton(

          onPressed: () {
            addsericvesDetails();
            Navigator.of(context).pop();
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

