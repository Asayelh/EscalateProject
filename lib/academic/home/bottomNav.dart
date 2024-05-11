import 'package:esclate/academic/home/CollegePosts.dart';
import 'package:esclate/academic/home/DepartementPosts.dart';
import 'package:esclate/academic/home/UniversityPosts.dart';
import 'package:esclate/academic/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({super.key});

  @override
  State<bottomNav> createState() => _bottomNav();
}

class _bottomNav extends State<bottomNav> {
  int currentIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const DepartementPosts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    padding: const EdgeInsets.all(0),
                    // This will go the the Deprartment page
                    onPressed: () {
                      setState(() {
                        currentScreen = const DepartementPosts();
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "images/icons/departments.svg",
                          width: 27,
                          color: currentIndex == 0
                              ? Colors.black
                              : const Color(0XFF616161),
                        ),
                        Text(
                          "Departments",
                          style: TextStyle(
                            color: currentIndex == 0
                                ? Colors.black
                                : const Color(0XFF616161),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(0),
                    // This will go the the Universirty
                    onPressed: () {
                      // Update Page
                      setState(() {
                        currentScreen = const UniversityPosts();
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "images/icons/univsersity.svg",
                          width: 30,
                          color: currentIndex == 1
                              ? Colors.black
                              : const Color(0XFF616161),
                        ),
                        Text(
                          "University",
                          style: TextStyle(
                            color: currentIndex == 1
                                ? Colors.black
                                : const Color(0XFF616161),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        currentScreen = const CollegePosts();
                        currentIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "images/icons/persons.svg",
                          width: 36,
                          color: currentIndex == 2
                              ? Colors.black
                              : const Color(0XFF616161),
                        ),
                        Text(
                          "College",
                          style: TextStyle(
                            color: currentIndex == 2
                                ? Colors.black
                                : const Color(0XFF616161),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ProfilePage()));
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "images/icons/onePerson.svg",
                          width: 16,
                          color: currentIndex == 3
                              ? Colors.black
                              : const Color(0XFF616161),
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            color: currentIndex == 3
                                ? Colors.black
                                : const Color(0XFF616161),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
    );
  }
}
