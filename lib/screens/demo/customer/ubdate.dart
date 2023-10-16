import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../signup.dart';
import 'customTextfield.dart';


class UpdateUser extends StatefulWidget {
  final String docId; // Add this line

  UpdateUser({required this.docId}); // Add this constructor

  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final fieldText = TextEditingController();
  final controller=Get.put(SignUpcontro());

  final CollectionReference allusers =
  FirebaseFirestore.instance.collection('Users');
  void Updateuser(String docId) {
    final data = {
      'PhoneNo': controller.phoneController.text,
      'FullName': controller.NameController.text,
      'Registration number': controller.RegistrationNoController.text,
      'motor Number': controller.motoNumberController.text,
      'vehicle Model': controller.VehicleModelController.text,
      'controller Number': controller.controllerNumberController.text,
      'chase Number': controller.chaseNumberController.text,
      'place': controller.PlaceController.text,
    };

    try {
      allusers.doc(docId).update(data); // Wrap in try-catch block for error handling
    } catch (e) {
      print("Error updating document: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;

    if (args != null) {
      controller.NameController.text = args['FullName'] ?? '';
      controller.phoneController.text = args['PhoneNo'] ?? '';
      controller.VehicleModelController.text = args['vehicle Model'] ?? '';
      controller.PlaceController.text = args['place'] ?? '';
      controller.RegistrationNoController.text = args['Registration number'] ?? '';
      controller.chaseNumberController.text = args['chase Number'] ?? '';
      controller.motoNumberController.text = args['motor Number'] ?? '';
      controller.controllerNumberController.text = args['controller Number'] ?? '';
    }   return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('UpdateCustomer'),
        backgroundColor: Colors.green[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                labelText: 'Name',
                controller: controller.NameController,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Customer name',
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                labelText: 'Phone number',
                controller: controller.phoneController,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Phone number',
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                labelText: 'Place',
                controller: controller.PlaceController,
                filled: true,
                fillColor: Colors.white,
                hintText: 'place',
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                labelText: 'Vehicle Model',
                controller: controller.VehicleModelController,
                filled: true,
                fillColor: Colors.white,
                hintText: 'vehicle Model',
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                labelText: 'Registration Number',
                controller: controller.RegistrationNoController,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Registration Number',
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                labelText: 'Chase Number',
                controller: controller.chaseNumberController,
                filled: true,
                fillColor: Colors.white,
                hintText: 'chase number',
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                labelText: 'Motor Number',
                controller: controller.motoNumberController,
                filled: true,
                fillColor: Colors.white,
                hintText: 'motor number',
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                labelText: 'Controller Number',
                controller: controller.controllerNumberController,
                filled: true,
                fillColor: Colors.white,
                hintText: 'controller number',
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ElevatedButton(
          onPressed: () {
            var dataStore;
            Updateuser( dataStore
                .id); // Update the Firestore document
            Navigator.pop(context); // Navigate back to the previous screen
          },

          child: Text(
            "Update",
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