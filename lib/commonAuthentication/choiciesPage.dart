import 'package:esclate/academic/Authentication/register.dart';
import 'package:esclate/academic/home/bottomNav.dart';
import 'package:esclate/commonAuthentication/login.dart';
import 'package:esclate/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:esclate/administrative/Authentication/register.dart';

class choicesPage extends StatefulWidget {
  const choicesPage({super.key});

  @override
  State<choicesPage> createState() => _choicesPage();
}

class _choicesPage extends State<choicesPage> {
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
              // child: Image.asset("images/background.png"),
            ),
            Align(
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
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                color: escalate.blueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "Create a new Account",
                              style: TextStyle(
                                color: escalate.cyanColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                "Choose account type",
                                style: TextStyle(color: escalate.blueColor),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    // Clickable
                                    child: GestureDetector(
                                      onTap: () {
                                        // go to page
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const administrativeRegister()),
                                        );
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 130,
                                            height: 100,
                                            color: const Color(0XFF35D5C3),
                                            child: const Icon(
                                              Icons.person,
                                              color: Color.fromRGBO(
                                                  28, 28, 30, 0.7),
                                              size: 60,
                                            ),
                                          ),
                                          Container(
                                            width: 130,
                                            height: 30,
                                            color: const Color(0XFF35D5C3)
                                                .withOpacity(0.4),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  "Administrative",
                                                  style: TextStyle(
                                                    color: Color(0Xff1A3EC1),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                const registerAcademic(),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 130,
                                            height: 100,
                                            color: const Color(0XFF35D5C3),
                                            child: const Icon(
                                              Icons.menu_book_sharp,
                                              color: Color.fromRGBO(
                                                  28, 28, 30, 0.7),
                                              size: 60,
                                            ),
                                          ),
                                          Container(
                                            width: 130,
                                            height: 30,
                                            color: const Color(0XFF35D5C3)
                                                .withOpacity(0.4),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  "Academic",
                                                  style: TextStyle(
                                                    color: Color(0Xff1A3EC1),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have account?"),
                                TextButton(
                                  // Button
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) => const loginPage()));
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
                                    "Login",
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
          ],
        ),
      ),
    );
  }
}
