import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String? id;
  final String Name;
  final String phoneNo;
  final String place;
  final String vehicleModel;
  final String registrationNO;
  final String chaseNo;
  final String motorNO;
  final String controllerNo;

  const UserModel({
    this.id,
    required this.Name,
    required this.phoneNo,
    required this.place,
    required this.vehicleModel,
    required this.registrationNO,
    required this.chaseNo,
    required this.motorNO,
    required this.controllerNo,
  });

  //to pass data to firestroe we need to Map data into json format

  toJson(){
    return {
      "FullName":Name,
      "PhoneNo":phoneNo,
      "place":place,
      "vehicle Model":vehicleModel,
      "Registration number":registrationNO,
      "chase Number":chaseNo,
      "motor Number":motorNO,
      "controller Number":controllerNo,
    };
  }

//to fetch data to firestroe we need to Map data into json format

  factory UserModel.fromSnapshot(DocumentSnapshot <Map<String,dynamic>>document){

    final data=document.data()!;

    return UserModel(
        id: document.id,
        Name: data["FullName"],
        phoneNo: data["phoneNo"],
        place: data["place"],
        vehicleModel: data["vehicle Model"],
        registrationNO: data["Registration number"],
        chaseNo: data["chase number"],
        motorNO: data["motor Number"],
        controllerNo: data["controller Number"]);
  }


}