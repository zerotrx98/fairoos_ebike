import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fairoos_ebike/screens/demo/customer/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// user repository is to perform Database oprations

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db=FirebaseFirestore.instance;
  // final _wdb=FirebaseFirestoreWeb();// KKpP

  AddUser(UserModel user)async{
    await _db.collection("Users").add(user.toJson()).whenComplete(() =>
        Get.snackbar('Success', 'User account has been created',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,),

    ).catchError((error,stackTrace){
      Get.snackbar('Error', 'Somthing went wrong  , Try again',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,);
      print(error.toString());
    });
  }

//Fetch function

  Future<List<UserModel>> alluser()async{
    final snapshot=await _db.collection("Users").get();
    final userdata=snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userdata;
  }

  Addservices(UserModel user)async{
    await _db.collection("Users").doc().collection('sevices').add(user.toJson()).whenComplete(() =>
        Get.snackbar('Success', 'User account has been created',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,),

    ).catchError((error,stackTrace){
      Get.snackbar('Error', 'Somthing went wrong  , Try again',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,);
      print(error.toString());
    });
  }


}