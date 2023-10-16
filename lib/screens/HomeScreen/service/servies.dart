import 'package:cloud_firestore/cloud_firestore.dart';
import'package:flutter/material.dart';

class VehicleDetails extends StatelessWidget {
 TextEditingController dateController = TextEditingController();
  TextEditingController complaint01Controller = TextEditingController();
  TextEditingController complaint02Controller = TextEditingController();
  TextEditingController complaint03Controller = TextEditingController();
  TextEditingController complaint04Controller = TextEditingController();
  TextEditingController complaint05Controller = TextEditingController();
  TextEditingController sparepart01Controller = TextEditingController();
  TextEditingController sparepart02Controller = TextEditingController();
  TextEditingController sparepart03Controller = TextEditingController();
  TextEditingController sparepart04Controller = TextEditingController();
  TextEditingController sparepart05Controller = TextEditingController();
  TextEditingController handlingpersonController = TextEditingController();
  TextEditingController deliveryDateController= TextEditingController();
  TextEditingController kmController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController billamountController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    dateController.text = args['date'] ?? '';
    handlingpersonController.text = args['handlingperson'] ?? '';
    deliveryDateController.text = args['deliveryDate'] ?? '';
    timeController.text = args['time'] ?? '';
    kmController.text = args['km'] ?? '';
    complaint01Controller.text = args['complaint01'] ?? '';
    complaint02Controller.text = args['complaint02'] ?? '';
    complaint03Controller.text = args['complaint03'] ?? '';
    complaint04Controller.text = args['complaint04'] ?? '';
    complaint05Controller.text = args['complaint05'] ?? '';
    sparepart01Controller.text = args['sparePart01'] ?? '';
    sparepart02Controller.text = args['sparePart02'] ?? '';
    sparepart03Controller.text  = args['sparePart03'] ?? '';
    sparepart04Controller.text = args['sparePart04'] ?? '';
    sparepart05Controller.text = args['sparePart05'] ?? '';
    billamountController.text = args['billAmount'] ?? '';
    final docId = args['id'];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search_off),
            tooltip: 'search',
            onPressed: () {
              //   Navigator.push(context, MaterialPageRoute(builder: (_)=> Billing1()));
              //
            },
          ),
        ],
        title: const Text('Services  ',
          style: TextStyle( color:Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600
          ),),
        backgroundColor: Colors.green[900],
        elevation: 0,
      ),
        body:Column(
          children: [
            Column(
              children: [
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            spreadRadius: 3,
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Text("Date:" ,style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.w600,color: Colors.black
                                    )),
                                    Padding(
                                      padding:const EdgeInsets.only(left: 95.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['date'],
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
                                          args['handlingPerson'],
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
                                    Text("DeliveryDate:" ,style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.w600,color: Colors.black
                                    )),
                                    Padding(
                                      padding:const EdgeInsets.only(left: 85.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['deliveryDate'],
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
                                    Text("Time:" ,style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.w600,color: Colors.black
                                    )),
                                    Padding(
                                      padding:const EdgeInsets.only(left: 104.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['time'],
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
                                    Text("km:" ,style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.w600,color: Colors.black
                                    )),
                                    Padding(
                                      padding:const EdgeInsets.only(left: 20.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['km'],
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
                                    Text("Complaint01:" ,style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.w600,color: Colors.black
                                    )),
                                    Padding(
                                      padding:const EdgeInsets.only(left: 80.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['complaint01'],
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
                                    Text("complaint02:" ,style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.w600,color: Colors.black
                                    )),
                                    Padding(
                                      padding:const EdgeInsets.only(left: 45.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['complaint02'],
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
                                    Text("Complaint03:" ,style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.w600,color: Colors.black
                                    )),
                                    Padding(
                                      padding:const EdgeInsets.only(left: 70.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['complaint03'],
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
                                    Text("Complaint04:" ,style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.w600,color: Colors.black
                                    )),
                                    Padding(
                                      padding:const EdgeInsets.only(left: 70.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['complaint04'],
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
                                    Text("Complaint05:" ,style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.w600,color: Colors.black
                                    )),
                                    Padding(
                                      padding:const EdgeInsets.only(left: 70.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['complaint05'],
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
                                    Text("SparePart01:" ,style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.w600,color: Colors.black
                                    )),
                                    Padding(
                                      padding:const EdgeInsets.only(left: 70.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['sparePart01'],
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
                                      padding:const EdgeInsets.only(left: 70.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['sparePart02'],
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
                                      padding:const EdgeInsets.only(left: 70.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['sparePart03'],
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
                                      padding:const EdgeInsets.only(left: 70.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['sparePart04'],
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
                                      padding:const EdgeInsets.only(left: 70.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['sparePart05'],
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
                                    Text("BillAmount:" ,style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.w600,color: Colors.black
                                    )),
                                    Padding(
                                      padding:const EdgeInsets.only(left: 70.0,right: 0,bottom: 0,top: 0),
                                      child: Text(
                                          args['billamount'],
                                          style: TextStyle(fontSize: 18,
                                              fontWeight: FontWeight.w600,color: Colors.black54
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        )

      );
  }
}