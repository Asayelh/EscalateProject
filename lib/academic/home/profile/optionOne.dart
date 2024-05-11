import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:esclate/config/config.dart';

class OptionOne extends StatefulWidget {
  const OptionOne({super.key});

  @override
  State<OptionOne> createState() => _OptionOneState();
}

class _OptionOneState extends State<OptionOne> {
  String currentUser = escalate.auth!.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5, left: 5, top: 5),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Publishes Post",
                style: TextStyle(
                  color: Color(0XFF404E8B),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: escalate.firebaseFirestore!
                    .collection("posts")
                    .where("postedByUid", isEqualTo: currentUser)
                    .where("postStatus", isEqualTo: "Accepted")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState ==
                          ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.done) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          String ImageUrl =
                              snapshot.data!.docs[index]['postedByImageURL'];
                          String PostUID = snapshot.data!.docs[index].id;
                          int Count = snapshot.data!.docs[index]['count'];
                          return Column(
                            children: [
                              const SizedBox(
                                height: 15,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                const Padding(
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
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons
                                                        .keyboard_arrow_up_outlined,
                                                  ),
                                                ),
                                                Text(Count.toString()),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: const Icon(Icons
                                                      .keyboard_arrow_down_outlined),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
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
                                                    Text(
                                                      snapshot.data!.docs[index]
                                                          ['postedByName'],
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0XFF404E8B),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      snapshot.data!.docs[index]
                                                          ['college'],
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0XFF404E8B),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      snapshot.data!.docs[index]
                                                          ['postMessage'],
                                                      style: const TextStyle(),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    ImageUrl != ""
                                                        ? Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.2,
                                                            child:
                                                                Image.network(
                                                              ImageUrl,
                                                            ),
                                                          )
                                                        : Container(),
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
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
