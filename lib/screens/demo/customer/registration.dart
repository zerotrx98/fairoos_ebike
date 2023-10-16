
import 'package:fairoos_ebike/screens/demo/customer/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../signup.dart';
import 'customTextfield.dart';


class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final fieldText = TextEditingController();

  void clearText() {
    controller.phoneController.clear();
    controller.NameController.clear();
    controller.RegistrationNoController.clear();
    controller.motoNumberController.clear();
    controller.VehicleModelController.clear();
    controller.controllerNumberController.clear();
    controller.chaseNumberController.clear();
    controller.phoneController.clear();
  }

  final controller=Get.put(SignUpcontro());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('New Customer'),
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
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              final user = UserModel(
                  Name: controller.NameController.text.trim(),
                  phoneNo: controller.phoneController.text.trim(),
                  place: controller.PlaceController.text.trim(),
                  vehicleModel: controller.VehicleModelController.text.trim(),
                  registrationNO: controller.RegistrationNoController.text.trim(),
                  chaseNo: controller.chaseNumberController.text.trim(),
                  motorNO: controller.motoNumberController.text.trim(),
                  controllerNo: controller.controllerNumberController.text.trim()
              );
              SignUpcontro.instance.creatuser(user);
            });
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
