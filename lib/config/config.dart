import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Map<int, Color> _primaryColor = {
  50: const Color(0XFF1A3EC1),
  100: const Color(0XFF1A3EC1),
  200: const Color(0XFF1A3EC1),
  300: const Color(0XFF1A3EC1),
  400: const Color(0XFF1A3EC1),
  500: const Color(0XFF1A3EC1),
  600: const Color(0XFF1A3EC1),
  700: const Color(0XFF1A3EC1),
  800: const Color(0XFF1A3EC1),
  900: const Color(0XFF1A3EC1),
};

class escalate {
  // firebase
  static FirebaseAuth? auth;
  static FirebaseStorage? firebaseStorage;
  static SharedPreferences? sharedPreferences;
  static FirebaseFirestore? firebaseFirestore;

  // acadamic
  static const String academicName = "academicName";
  static const String academicEmail = "academicEmail";
  static const String academicDepartemnt = "academicDepartemnt";
  static const String acadamicCollege = "acadamicCollege";
  static const String academicSecotr = "academicSecotr";

  // Administrative Users
  static const String AdministrativeName = "AdministrativeName";
  static const String AdministrativeEmail = "AdministrativeEmail";
  static const String AdministrativeDepartemnt = "AdministrativeDepartemnt";
  static const String AdministrativeSecotr = "AdministrativeSecotr";

  // Admin
  static const String AdminName = "academicName";
  static const String AdminEmail = "academicEmail";
  // static const String AdminDepartemnt = "academicDepartemnt";
  // static const String AdminImageUrl = "AdministrativeImageUrl";

  // Colors
  static Color blueColor = const Color(0XFF1A3EC1);
  static Color cyanColor = const Color(0XFF35D5C3).withOpacity(0.4);

  static final MaterialColor primaryNewColor =
      MaterialColor(const Color(0XFF1A3EC1).value, _primaryColor);

  static Color lightCayn = const Color(0Xff35D5C3);
}
