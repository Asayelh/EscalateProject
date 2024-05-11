import 'package:esclate/Admin/ViewChangeDepartemtnRequest.dart';
import 'package:esclate/Admin/ViewPostsRequest.dart';
import 'package:esclate/commonAuthentication/login.dart';
import 'package:esclate/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePage();
}

class _AdminHomePage extends State<AdminHomePage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 0),
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      visualDensity: VisualDensity.compact,
                      onPressed: () {
                        Route route = MaterialPageRoute(
                          builder: (_) => const loginPage(),
                        );
                        Navigator.push(context, route);
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
                      "ADMIN",
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
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          "Published posts requests",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 23, 41, 119),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Route route = MaterialPageRoute(
                              builder: (_) => const PostsRequest());
                          Navigator.push(context, route);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: escalate.cyanColor.withAlpha(70),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 59,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("View Reqests"),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          "Change Department Requests",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 23, 41, 119),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Route route = MaterialPageRoute(
                              builder: (_) =>
                                  const ViewChangeDepartemtnRequest());
                          Navigator.push(context, route);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: escalate.cyanColor.withAlpha(70),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 59,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("View Reqests"),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // This is the Publishes Post

}
