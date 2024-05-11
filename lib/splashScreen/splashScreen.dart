import 'dart:async';
import 'package:esclate/Admin/adminHomePage.dart';
import 'package:esclate/academic/home/bottomNav.dart';
import 'package:esclate/administrative/home/bottomNav.dart';
import 'package:esclate/commonAuthentication/choiciesPage.dart';
import 'package:esclate/config/config.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  bool loading = false;

  @override
  // when page open frist thing to do
  void initState() {
    timeFunctoni();
    super.initState();
  }

  timeFunctoni() {
    setState(() {
      loading = true;
    });
    Timer(
      const Duration(seconds: 4),
      () async {
        if (loading == true) {
          if (escalate.auth?.currentUser != null) {
            String? currentUser = escalate.auth!.currentUser!.uid;
            await escalate.firebaseFirestore!
                .collection("users")
                .doc(currentUser)
                .get()
                .then((result) {
              if (result.data()!.isNotEmpty) {
                String userType = result.data()!['type'];
                switch (userType) {
                  case "academic":
                    Route route =
                        MaterialPageRoute(builder: (_) => bottomNav());
                    Navigator.pushAndRemoveUntil(
                        context, route, (route) => false);
                    break;
                  case "administrative":
                    Route route = MaterialPageRoute(
                        builder: (_) => BottomNavAdminstrative());
                    Navigator.pushAndRemoveUntil(
                        context, route, (route) => false);
                    break;
                  case "admin":
                    Route route = MaterialPageRoute(
                        builder: (_) => const AdminHomePage());
                    Navigator.pushAndRemoveUntil(
                        context, route, (route) => false);
                    break;
                }
              }
            });
          } else {
            Route route =
                MaterialPageRoute(builder: (_) => const choicesPage());
            Navigator.pushAndRemoveUntil(context, route, (route) => false);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.jpeg"),
            const Text(
              "Welcome to Esclate",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            loading == true
                ? CircularProgressIndicator(
                    color: escalate.cyanColor,
                  )
                : const Text("")
          ],
        ),
      ),
    );
  }
}
