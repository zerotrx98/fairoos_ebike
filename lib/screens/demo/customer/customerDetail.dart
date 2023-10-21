import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../id.dart';
import '../service/serviceDetail.dart';

class SingleUserDetail extends StatelessWidget {
  String ser_docid;
  late DocumentReference _reference;
  late Future<DocumentSnapshot> _futureData;
  late CollectionReference _referenceservices;

  SingleUserDetail(this.ser_docid, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('Users').doc(ser_docid);
    _futureData = _reference.get();
    _referenceservices = _reference.collection('ARservices');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
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
    TextEditingController deliveryDate01Controller = TextEditingController();
    TextEditingController km01Controller = TextEditingController();
    TextEditingController time01Controller = TextEditingController();
    TextEditingController billamount01Controller = TextEditingController();
    TextEditingController services_controller = TextEditingController();

    void clearText() {
      services_controller.clear();

      date01Controller.clear();
      complaint0101Controller.clear();
      complaint0103Controller.clear();
      complaint0104Controller.clear();
      complaint0105Controller.clear();
      sparepart0101Controller.clear();
      sparepart0102Controller.clear();
      sparepart0103Controller.clear();
      sparepart0104Controller.clear();
      sparepart0105Controller.clear();
      handlingperson01Controller.clear();
      deliveryDate01Controller.clear();
      km01Controller.clear();
      time01Controller.clear();
      billamount01Controller.clear();
    }

    return Scaffold(
      // drawer: Drawer(
      //   child: ListView(
      //       children:[  DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ), child: null,
      //       ),
      //       ]
      //   ),
      // ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.green[900],
        ),
        Positioned(
            top: 40,
            left: 5,
            child: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(
                    Icons.navigate_before,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );
              },
            )),
        Positioned(
            top: 40,
            right: 5,
            child: Builder(
              builder: (context) {
                return ElevatedButton.icon(
                  icon: const Icon(
                    Icons.electric_scooter_rounded,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Previous Service Details',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    print('Button Pressed');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Serv_detailScreen(ser_docid.toString()),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                  ),
                );
              },
            )),
        Positioned(
          top: 100,
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    child: Container(
                        height: height * 0.4,
                        width: double.infinity,

                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Expanded(child: ByidDetails(ser_docid)),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    child: Container(
                      height: height * 0.5,
                      width: double.infinity,

                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("handling Details".toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54)),
                              ],
                            ),
                            TextField(
                              controller: date01Controller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    // borderRadius: const BorderRadius.all(Radius.circular(
                                    //     20.0)),
                                    // borderSide: BorderSide()
                                    ),
                                labelText: 'Date',
                              ),
                            ),
                            TextField(
                              controller: handlingperson01Controller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    //     borderRadius: const BorderRadius.all(Radius.circular(
                                    //         20.0)),
                                    //     borderSide: BorderSide()
                                    ),
                                labelText: 'handlingperson',
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: deliveryDate01Controller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    //     borderRadius: const BorderRadius.all(Radius.circular(
                                    //         20.0)),
                                    //     borderSide: BorderSide()
                                    ),
                                labelText: 'Deliverydate',
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: time01Controller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    //     borderRadius: const BorderRadius.all(Radius.circular(
                                    //         20.0)),
                                    //     borderSide: BorderSide()
                                    ),
                                labelText: 'Time',
                              ),
                            ),
                            TextField(
                              controller: km01Controller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    // borderRadius: const BorderRadius.all(Radius.circular(
                                    //     20.0)),
                                    // borderSide: BorderSide()
                                    ),
                                labelText: 'Km',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    child: Container(
                      height: height*0.5,
                      width: double.infinity,

                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Complaints".toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54)),
                              ],
                            ),
                            TextField(
                              controller: complaint0101Controller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide()),
                                labelText: 'complaint01',
                              ),
                            ),
                            TextField(
                              controller: complaint0102Controller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide()),
                                labelText: 'complaint02',
                              ),
                            ),
                            TextField(
                              controller: complaint0103Controller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide()),
                                labelText: 'complaint03',
                              ),
                            ),
                            TextField(
                              controller: complaint0104Controller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide()),
                                labelText: 'complaint04',
                              ),
                            ),
                            TextField(
                              controller: complaint0105Controller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide()),
                                labelText: 'complaint05',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    child: Container(
                      height: height*0.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Spareparts".toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54)),
                              ],
                            ),
                            TextField(
                              controller: sparepart0101Controller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide()),
                                labelText: 'sparepart01',
                              ),
                            ),
                            TextField(
                              controller: sparepart0102Controller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide()),
                                labelText: 'sparepart02',
                              ),
                            ),
                            TextField(
                              controller: sparepart0103Controller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide()),
                                labelText: 'sparepart03',
                              ),
                            ),
                            TextField(
                              controller: sparepart0104Controller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide()),
                                labelText: 'sparepart04',
                              ),
                            ),
                            TextField(
                              controller: sparepart0105Controller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide()),
                                labelText: 'sparepart05',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    child: Card(
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: billamount01Controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  //     borderRadius: const BorderRadius.all(Radius.circular(
                                  //         20.0)),
                                  //     borderSide: BorderSide()
                                  ),
                              labelText: 'Bill amount',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Serv_detailScreen(ser_docid.toString()),
                ));

            Map<String, String> servicesData = {
              'handling_staf': services_controller.text,
              'date': date01Controller.text,
              'handlingperson': handlingperson01Controller.text,
              'deliveryDate': deliveryDate01Controller.text,
              'time': time01Controller.text,
              'km': km01Controller.text,
              'complaint01': complaint0101Controller.text,
              'complaint02': complaint0102Controller.text,
              'complaint03': complaint0103Controller.text,
              'complaint04': complaint0104Controller.text,
              'complaint05': complaint0105Controller.text,
              'sparePart01': sparepart0101Controller.text,
              'sparePart02': sparepart0102Controller.text,
              'sparePart03': sparepart0103Controller.text,
              'sparePart04': sparepart0104Controller.text,
              'sparePart05': sparepart0105Controller.text,
              'billAmount': billamount01Controller.text,
            };
            _referenceservices.add(servicesData);
            clearText();
          },
          child: const Text(
            "Save",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.green[900]!),
          ),
        ),
      ),
    );
  }
}
