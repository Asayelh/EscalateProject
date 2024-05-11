import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esclate/commonAuthentication/choiciesPage.dart';
import 'package:esclate/config/config.dart';
import 'package:esclate/firebase_options.dart';
import 'package:esclate/splashScreen/splashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  escalate.firebaseFirestore = FirebaseFirestore.instance;
  escalate.auth = FirebaseAuth.instance;
  escalate.firebaseStorage = FirebaseStorage.instance;
  escalate.sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

checkingUsers<widget>() async {
  String currrentUser = escalate.auth!.currentUser!.uid;
  await escalate.firebaseFirestore!
      .collection("users")
      .doc(currrentUser)
      .get()
      .then(
    (value) {
      String UserType = value.data()!['type'];
      switch (UserType) {
        case "academic":
          escalate.sharedPreferences!
              .setString(escalate.academicName, value.data()!['name']);
          escalate.sharedPreferences!
              .setString(escalate.acadamicCollege, value.data()!['college']);
          escalate.sharedPreferences!
              .setString(escalate.academicSecotr, value.data()!['sector']);
          escalate.sharedPreferences!.setString(
              escalate.academicDepartemnt, value.data()!['department']);
          escalate.sharedPreferences!
              .setString(escalate.academicEmail, value.data()!['email']);
          break;
        case "administrative":
          escalate.sharedPreferences!
              .setString(escalate.AdministrativeName, value.data()!['name']);
          escalate.sharedPreferences!.setString(
              escalate.AdministrativeDepartemnt, value.data()!['department']);
          escalate.sharedPreferences!.setString(
              escalate.AdministrativeSecotr, value.data()!['sector']);

          escalate.sharedPreferences!
              .setString(escalate.AdministrativeEmail, value.data()!['email']);
          break;
      }
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: escalate.primaryNewColor),
      home: splashScreen(),
    );
  }
}
