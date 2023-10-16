import 'package:fairoos_ebike/screens/HomeScreen/firsthome.dart';
import 'package:fairoos_ebike/screens/HomeScreen/service/service.formdart.dart';
import 'package:fairoos_ebike/screens/HomeScreen/service/servies.dart';
import 'package:fairoos_ebike/screens/demo/customer/ubdate.dart';
import 'package:fairoos_ebike/screens/demo/service/ServiceUpdate.dart';
import 'package:fairoos_ebike/screens/exCuspomer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => firstScreen(),
        '/updateCustomer': (context) => UpdateUser(docId: 'dataStore.id',),
        '/exCustomer' : (context) => ExCustomer(),
        '/AddressData': (context) => AddressData(),
        '/serviceDetails':(context) =>VehicleDetails(),
        '/UpdateService':(context)=>UpdateService('dataStore.id'),
      },
    );
  }
}

