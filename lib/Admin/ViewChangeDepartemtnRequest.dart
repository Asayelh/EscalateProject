import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esclate/DialogBox/loadingDialog.dart';
import 'package:esclate/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewChangeDepartemtnRequest extends StatefulWidget {
  const ViewChangeDepartemtnRequest({super.key});

  @override
  State<ViewChangeDepartemtnRequest> createState() =>
      _ViewChangeDepartemtnRequest();
}

class _ViewChangeDepartemtnRequest extends State<ViewChangeDepartemtnRequest> {
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
                  Positioned(
                    child: SvgPicture.asset(
                      "images/up.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 15,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Positioned(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 80,
                              ),
                              const Text(
                                "Edit Department",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 23, 41, 119),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                // To get data from Firebase
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: escalate.firebaseFirestore!
                                      .collection("editDepartment")
                                      .where("status", isEqualTo: "Pending")
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else if (snapshot.connectionState ==
                                            ConnectionState.done ||
                                        snapshot.connectionState ==
                                            ConnectionState.active) {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          String ImageURL = snapshot
                                              .data!.docs[index]['proofUrl'];
                                          String UserUid = snapshot
                                              .data!.docs[index]['currentUser'];
                                          String Uid =
                                              snapshot.data!.docs[index].id;

                                          String NewDepartnet = snapshot.data!
                                              .docs[index]['newDepartment'];

                                          String NewCollege = snapshot
                                              .data!.docs[index]['newCollege'];

                                          return Column(
                                            children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(15),
                                                padding: const EdgeInsets.only(
                                                    left: 2,
                                                    bottom: 5,
                                                    right: 5),
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 229, 232, 235),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Column(
                                                              children: const [
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              8,
                                                                          right:
                                                                              8,
                                                                          bottom:
                                                                              0,
                                                                          left:
                                                                              10),
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0XFF0CDBC6),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Text(
                                                                      snapshot
                                                                          .data!
                                                                          .docs[index]['fullName'],
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Color(
                                                                            0XFF404E8B),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          15,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        const Text(
                                                                            "Old Department:"),
                                                                        const SizedBox(
                                                                          width:
                                                                              4,
                                                                        ),
                                                                        Text(
                                                                          snapshot
                                                                              .data!
                                                                              .docs[index]['currentDepartment'],
                                                                          style:
                                                                              const TextStyle(
                                                                            color:
                                                                                Color(0XFF404E8B),
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        const Text(
                                                                            "New Department:"),
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                          snapshot
                                                                              .data!
                                                                              .docs[index]['newDepartment'],
                                                                          style:
                                                                              const TextStyle(),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      snapshot
                                                                          .data!
                                                                          .docs[index]['status'],
                                                                      style:
                                                                          const TextStyle(),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    ImageURL !=
                                                                            ""
                                                                        ? Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.2,
                                                                            child:
                                                                                Image.network(
                                                                              ImageURL,
                                                                            ),
                                                                          )
                                                                        : Container(),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 20,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              AcceptingPost(
                                                                  Uid,
                                                                  UserUid,
                                                                  NewDepartnet,
                                                                  NewCollege);
                                                            },
                                                            style: ButtonStyle(
                                                              shape: MaterialStateProperty
                                                                  .all<
                                                                      RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                              ),
                                                              elevation:
                                                                  MaterialStateProperty
                                                                      .all<double>(
                                                                          0),
                                                              foregroundColor:
                                                                  MaterialStateProperty
                                                                      .all(
                                                                Colors.white,
                                                              ),
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(
                                                                escalate
                                                                    .lightCayn
                                                                    .withOpacity(
                                                                        0.2),
                                                              ),
                                                            ),
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "Accept",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color(
                                                                      0XFF404E8B),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              RejectingPost(
                                                                  Uid);
                                                            },
                                                            style: ButtonStyle(
                                                              shape: MaterialStateProperty
                                                                  .all<
                                                                      RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                              ),
                                                              elevation:
                                                                  MaterialStateProperty
                                                                      .all<double>(
                                                                          0),
                                                              foregroundColor:
                                                                  MaterialStateProperty
                                                                      .all(
                                                                Colors.white,
                                                              ),
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(
                                                                const Color(
                                                                        0XFFE36D5D)
                                                                    .withOpacity(
                                                                        0.2),
                                                              ),
                                                            ),
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "Reject",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color(
                                                                      0XFF404E8B),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      return const Text("");
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AcceptingPost(
      String Uid, String UserUId, String newDep, String newCollege) async {
    showDialog(
      context: context,
      builder: (_) => const LoadingAlertDialog(
        message: "Accepting Request",
      ),
    );
    await escalate.firebaseFirestore!
        .collection("editDepartment")
        .doc(Uid)
        .update(
      {"status": "Accepted"},
    ).then((value) async {
      await escalate.firebaseFirestore!
          .collection("users")
          .doc(UserUId)
          .update({
        "department": newDep,
        "college": newCollege,
      });
    });
    Navigator.pop(context);
  }

  RejectingPost(String Uid) async {
    showDialog(
      context: context,
      builder: (_) => const LoadingAlertDialog(
        message: "Rejecting Request",
      ),
    );
    await escalate.firebaseFirestore!
        .collection("editDepartment")
        .doc(Uid)
        .update(
      {"status": "Rejected"},
    ).then((value) {
      Navigator.pop(context);
    });
  }
}
