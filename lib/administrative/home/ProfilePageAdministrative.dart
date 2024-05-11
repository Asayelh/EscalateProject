import 'package:esclate/administrative/home/editDepartmentAdminstrative.dart';
import 'package:esclate/administrative/home/profile/opitonThreeAdministrative.dart';
import 'package:esclate/administrative/home/profile/optionFourAdministrative.dart';
import 'package:esclate/administrative/home/profile/optionOneAdministrative.dart';
import 'package:esclate/administrative/home/profile/optionTowAdministrative.dart';
import 'package:esclate/commonAuthentication/login.dart';
import 'package:esclate/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePageAdministrative extends StatefulWidget {
  const ProfilePageAdministrative({super.key});

  @override
  State<ProfilePageAdministrative> createState() =>
      _ProfilePageAdministrative();
}

class _ProfilePageAdministrative extends State<ProfilePageAdministrative> {
  String Name = escalate.sharedPreferences!
      .getString(escalate.AdministrativeName)
      .toString();
  String Email = escalate.sharedPreferences!
      .getString(escalate.AdministrativeEmail)
      .toString();
  String Departemnt = escalate.sharedPreferences!
      .getString(escalate.AdministrativeDepartemnt)
      .toString();

  int pageIndex = 0;

  Widget currentScreen = const OptionOneAdministative();
  final PageStorageBucket bucket = PageStorageBucket();

  var ImageUrl = null;

  String currentUser = escalate.auth!.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      "images/oneTow.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 29, left: 15),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Color(0XFF6C6C6C),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 0),
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        visualDensity: VisualDensity.compact,
                        onPressed: () {
                          escalate.auth!.signOut().then((value) {
                            Route route = MaterialPageRoute(
                              builder: (_) => const loginPage(),
                            );
                            Navigator.push(context, route);
                          });
                        },
                        icon: const Icon(
                          Icons.power_settings_new_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 115, left: 15),
                      child: Text(
                        "PROFILE",
                        style: TextStyle(
                          color: Color(0XFF1A3EC1),
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Icon(Icons.person),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("Name"),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(Name.toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.email_outlined),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("Email"),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(Email.toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          "images/icons/departments.svg",
                                          width: 21,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text("Department"),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        Departemnt.toString(),
                                        textAlign: TextAlign.right,
                                      )),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  const EditDepartmentAdmnistrative(),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 30,
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: escalate.cyanColor,
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      pageIndex = 0;
                                      currentScreen = OptionOneAdministative();
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(0),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      color: pageIndex == 0
                                          ? escalate.cyanColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Image.asset(
                                      "images/pub.png",
                                      width: 24,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      pageIndex = 1;
                                      currentScreen = OptionFourAdminstative();
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(0),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      color: pageIndex == 1
                                          ? escalate.cyanColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SvgPicture.asset(
                                      "images/icons/reload.svg",
                                      width: 30,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      pageIndex = 2;
                                      currentScreen =
                                          const OptionTowAdministartive();
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(0),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      color: pageIndex == 2
                                          ? escalate.cyanColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Image.asset(
                                      "images/smstracking.png",
                                      width: 30,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      pageIndex = 3;
                                      currentScreen =
                                          const optionThreeAdministative();
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(0),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      color: pageIndex == 3
                                          ? escalate.cyanColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SvgPicture.asset(
                                      "images/icons/departments.svg",
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 20,
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    // It should be here
                    PageStorage(
                      bucket: bucket,
                      child: currentScreen,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // This is the Publishes Post

}
