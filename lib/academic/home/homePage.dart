import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Stack(
              children: [
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Stack(
                //     children: [
                //       Image.asset("images/bottom.png"),
                //     ],
                //   ),
                // ),
                // Container(
                //   alignment: Alignment.bottomCenter,
                // ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Image.asset(
                //     "images/bottom.png",
                //     fit: BoxFit.cover,
                //   ),
                //   // child: Image.asset("images/background.png"),
                // ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Popular posts",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Icon(
                            Icons.arrow_circle_down_outlined,
                          ),
                        ],
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 2, bottom: 5, right: 5),
                            decoration: BoxDecoration(
                              color: const Color(0XFFF0F1F4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 8,
                                                  right: 8,
                                                  bottom: 0,
                                                  left: 10),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Color(0XFF0CDBC6),
                                              ),
                                            ),
                                            Icon(Icons
                                                .keyboard_arrow_up_outlined),
                                            Text("200"),
                                            Icon(Icons
                                                .keyboard_arrow_down_outlined),
                                            Icon(Icons.ios_share_sharp),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Icon(Icons.comment)
                                          ],
                                        ),
                                      ],
                                    ),
                                    Flexible(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                const Text(
                                                  "data",
                                                  style: TextStyle(
                                                    color: Color(0XFF404E8B),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Text(
                                                  "data",
                                                  style: TextStyle(
                                                    color: Color(0XFF404E8B),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text(
                                                  "There is no parking, enoght for everybody",
                                                  style: TextStyle(),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: const Text(
                                                    "data",
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
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
    );
  }
}
