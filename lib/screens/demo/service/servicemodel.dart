import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel{
  final String? id;
  final String handling_staf;
  // final String phoneNo;
  // final String place;
  // final String vehicleModel;
  // final String registrationNO;
  // final String chaseNo;
  // final String motorNO;
  // final String controllerNo;

  const ServiceModel({
    this.id,
    required this.handling_staf,
    // required this.phoneNo,
    // required this.place,
    // required this.vehicleModel,
    // required this.registrationNO,
    // required this.chaseNo,
    // required this.motorNO,
    // required this.controllerNo,
  });

  //to pass data to firestroe we need to Map data into json format

  toJson(){
    return {
      "Handling Staf":handling_staf,
      // "PhoneNo":phoneNo,
      // "place":place,
      // "vehicle Model":vehicleModel,
      // "Registration number":registrationNO,
      // "chase Number":chaseNo,
      // "motor Number":motorNO,
      // "controller Number":controllerNo,
    };
  }

//to fetch data to firestroe we need to Map data into json format

  factory ServiceModel.fromSnapshot(DocumentSnapshot <Map<String,dynamic>>document){

    final data=document.data()!;

    return ServiceModel(
      id: document.id,
      handling_staf: data["Handling Staf"],
      // phoneNo: data["phoneNo"],
      // place: data["place"],
      // vehicleModel: data["vehicle Model"],
      // registrationNO: data["Registration number"],
      // chaseNo: data["chase number"],
      // motorNO: data["motor Number"],
      // controllerNo: data["controller Number"]
    );
  }


}