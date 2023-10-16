
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewCustomer extends StatefulWidget {
  const NewCustomer({Key? key}) : super(key: key);

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController vehicleModelController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController registrationNoController = TextEditingController();
  TextEditingController chasesNoController = TextEditingController();
  TextEditingController motorNoController = TextEditingController();
  TextEditingController controllerNoController = TextEditingController();
  //service01
  TextEditingController date01Controller = TextEditingController();
  TextEditingController complaint0101Controller = TextEditingController();
  TextEditingController complaint0102Controller = TextEditingController();
  TextEditingController complaint0103Controller = TextEditingController();
  TextEditingController complaint0104Controller = TextEditingController();
  TextEditingController complaint0105Controller = TextEditingController();
  TextEditingController sparePart0101Controller = TextEditingController();
  TextEditingController sparePart0102Controller = TextEditingController();
  TextEditingController sparePart0103Controller = TextEditingController();
  TextEditingController sparePart0104Controller = TextEditingController();
  TextEditingController sparePart0105Controller = TextEditingController();
  TextEditingController handingPerson01Controller = TextEditingController();
  TextEditingController deliveryDate01Controller= TextEditingController();
  TextEditingController km01Controller = TextEditingController();
  TextEditingController time01Controller = TextEditingController();
  TextEditingController billAmount01Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                    padding: const EdgeInsets.only(left: 0.0,right: 190,bottom: 0,top: 10),
                                    child: const Text("Customer Details", style: TextStyle(fontSize: 18,
                                        fontWeight: FontWeight.w600,color: Colors.black54
                                    )),
                                  ),
                                ],
                              ),

                              Container(
                                  margin: const EdgeInsets.all(15),
                                  child: TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        // borderRadius: const BorderRadius.all(Radius.circular(
                                        //     20.0)),
                                        // borderSide: BorderSide()
                                      ),
                                      labelText: 'Name',
                                    ),
                                  )),
                              Container(
                                  margin: const EdgeInsets.all(15),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: phoneNoController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        // borderRadius: const BorderRadius.all(Radius.circular(
                                        //     20.0)),
                                        // borderSide: BorderSide()
                                      ),
                                      labelText: 'PhoneNumber',
                                    ),
                                  )),
                              Container(
                                  margin: const EdgeInsets.all(15),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        // borderRadius: const BorderRadius.all(Radius.circular(
                                        //     20.0)),
                                        // borderSide: BorderSide()
                                      ),
                                      labelText: 'VehicleModel',
                                    ),
                                  )),
                              Container(
                                  margin: const EdgeInsets.all(15),
                                  child: TextField(
                                    controller: placeController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        // borderRadius: const BorderRadius.all(Radius.circular(
                                        //     20.0)),
                                        // borderSide: BorderSide()
                                      ),
                                      labelText: 'Place',
                                    ),
                                  )),
                              Container(
                                  margin: const EdgeInsets.all(15),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: registrationNoController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        // borderRadius: const BorderRadius.all(Radius.circular(
                                        //     20.0)),
                                        // borderSide: BorderSide()
                                      ),
                                      labelText: 'RegistrationNo',
                                    ),
                                  )),
                              Container(
                                  margin: const EdgeInsets.all(15),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: motorNoController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        //     borderRadius: const BorderRadius.all(Radius.circular(
                                        //         20.0)),
                                        //     borderSide: BorderSide()
                                      ),
                                      labelText: 'MotorNo',
                                    ),
                                  )),
                              Container(
                                  margin: const EdgeInsets.all(15),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: controllerNoController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        //     borderRadius: const BorderRadius.all(Radius.circular(
                                        //         20.0)),
                                        //     borderSide: BorderSide()
                                      ),
                                      labelText: 'controllerNo',
                                    ),
                                  )
                              ),

                              Container(
                                  margin: const EdgeInsets.all(15),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: chasesNoController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        //     borderRadius: const BorderRadius.all(Radius.circular(
                                        //         20.0)),
                                        //     borderSide: BorderSide()
                                      ),
                                      labelText: 'chasesNo',
                                    ),
                                  )
                              ),
                            ],
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

          onPressed: addData,
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
  final firestoreInstance = FirebaseFirestore.instance;
  void addData () {
    firestoreInstance.collection("services").add({
      'name': nameController.text,
      'phoneNo': phoneNoController.text,
      'vehicle': vehicleModelController.text,
      'place': placeController.text,
      'registrationNo': registrationNoController.text,
      'motorNo': motorNoController.text,
      'controllerNo': controllerNoController.text,
      'chasesNo': chasesNoController.text,
    }).then((value) {
      print("data added successfully");
      print(value.id);
    });
  }
  void addSubCollections(){
    firestoreInstance.collection("Bikes").add({
      // 'name': nameController.text,
      // 'phoneNo': phoneNoController.text,
      // 'vehicle': vehicleModelController.text,
      // 'place': placeController.text,
      // 'registrationNo': registrationNoController.text,
      // 'motorNo': motorNoController.text,
      // 'controllerNo': controllerNoController.text,
      // 'chasesNo': chasesNoController.text,
    }).then((value){
      firestoreInstance.collection("Bikes")
          .doc(value.id)
          .collection("ServiceDetails")
          .add({
        'date': date01Controller.text,
        'handlingPerson': handingPerson01Controller.text,
        'deliveryDate': deliveryDate01Controller.text,
        'time': time01Controller.text,
        'km': km01Controller.text,
        'complaint01': complaint0101Controller.text,
        'complaint02': complaint0102Controller.text,
        'complaint03': complaint0103Controller.text,
        'complaint04': complaint0104Controller.text,
        'complaint05': complaint0105Controller.text,
        'sparePart01': sparePart0101Controller.text,
        'sparePart02': sparePart0102Controller.text,
        'sparePart03': sparePart0103Controller.text,
        'sparePart04': sparePart0104Controller.text,
        'sparePart05': sparePart0105Controller.text,
        'billAmount': billAmount01Controller.text,
      });
    });
  }
  void retrieveOnce(){
    firestoreInstance.collection("Bikes").get().then((value) => {
      value.docs.forEach((result) {
        print(result.data());
      })
    });
  }
  void retrievesubcollection(){
    firestoreInstance.collection("Bikes").get().then((value){
      value.docs.forEach((result) {
        firestoreInstance.collection("Bikes")
            .doc(result.id)
            .collection("ServiceDetails")
            .get()
            .then((subcol){
          subcol.docs.forEach((element) {
            print(element.data());
          });
        });
      });
    });
  }
}
