import 'package:esclate/Admin/adminHomePage.dart';
import 'package:esclate/DialogBox/errorDialog.dart';
import 'package:esclate/DialogBox/loadingDialog.dart';
import 'package:esclate/Widgets/customTextFieldRegisterPage.dart';
import 'package:esclate/academic/home/bottomNav.dart';
import 'package:esclate/administrative/home/bottomNav.dart';
import 'package:esclate/commonAuthentication/choiciesPage.dart';
import 'package:esclate/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPage();
}

class _loginPage extends State<loginPage> {
  TextEditingController EmailAdministrative = TextEditingController();
  TextEditingController PasswordAdministrative = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                "images/up.svg",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: Image.asset("images/logo.jpeg"),
                                ),
                                Text(
                                  "Esclate",
                                  style: TextStyle(
                                    color: escalate.blueColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  "Login to your Account",
                                  style: TextStyle(
                                    color: escalate.cyanColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                        color: escalate.blueColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  customTextFieldRegsiterPage(
                                    isSecure: false,
                                    enabledEdit: true,
                                    textEditingController: EmailAdministrative,
                                    textInputType: TextInputType.emailAddress,
                                    hint: "Email",
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "Password",
                                      style: TextStyle(
                                        color: escalate.blueColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  customTextFieldRegsiterPage(
                                    isSecure: true,
                                    enabledEdit: true,
                                    textEditingController:
                                        PasswordAdministrative,
                                    textInputType: TextInputType.emailAddress,
                                    hint: "Password",
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      escalate.cyanColor,
                                    ),
                                    shadowColor: MaterialStateProperty.all(
                                      Colors.transparent,
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    validateData();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 30,
                                      left: 30,
                                      bottom: 10,
                                      top: 10,
                                    ),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: escalate.blueColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Don't have account? "),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (_) => choicesPage()));
                                      },
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.zero,
                                        ),
                                        minimumSize: MaterialStateProperty.all(
                                          const Size(0, 0),
                                        ),
                                      ),
                                      child: const Text(
                                        "Create Now",
                                        style: TextStyle(
                                          color: Color(0XFF1F64FF),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> validateData() async {
    EmailAdministrative.text.isNotEmpty &&
            PasswordAdministrative.text.isNotEmpty
        ? uploadToStorage()
        : displayDialog();
  }

  displayDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (c) {
          return const errorDialog(
            message: "Plaese Fill up the Information",
          );
        });
  }

  uploadToStorage() async {
    showDialog(
        context: context,
        builder: (c) {
          return const LoadingAlertDialog(
            message: "Checking Data, Please Wait...",
          );
        });
    _login();
  }

  String? currentUser;
  void _login() async {
    escalate.auth!
        .signInWithEmailAndPassword(
            email: EmailAdministrative.text.trim(),
            password: PasswordAdministrative.text.trim())
        .then((auth) {
      currentUser = auth.user!.uid;
      GettingData(currentUser!);
    }).catchError(
      (error) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (c) => errorDialog(
            message: error.toString(),
          ),
        );
      },
    );
  }

  GettingData(String currrentUser) async {
    await escalate.firebaseFirestore!
        .collection("users")
        .doc(currrentUser)
        .get()
        .then((value) {
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
          Route route = MaterialPageRoute(builder: (_) => const bottomNav());
          Navigator.pushReplacement(context, route);
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

          Route route =
              MaterialPageRoute(builder: (_) => BottomNavAdminstrative());
          Navigator.pushAndRemoveUntil(context, route, (route) => false);
          break;
        case "admin":
          escalate.sharedPreferences!
              .setString(escalate.AdminName, value.data()!['name']);
          escalate.sharedPreferences!
              .setString(escalate.AdminEmail, value.data()!['email']);

          Route route =
              MaterialPageRoute(builder: (_) => const AdminHomePage());
          Navigator.pushAndRemoveUntil(context, route, (route) => false);
          break;
      }
    });
  }
}
