import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:esclate/config/config.dart';

class optionThreeAdministative extends StatefulWidget {
  const optionThreeAdministative({super.key});

  @override
  State<optionThreeAdministative> createState() => _optionThreeAdministative();
}

class _optionThreeAdministative extends State<optionThreeAdministative> {
  String currentUser = escalate.auth!.currentUser!.uid;
  String? Imageasd = null;
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
                "Edit Department State",
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
                    .collection("editDepartment")
                    .where("currentUser", isEqualTo: currentUser)
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
                          Imageasd = snapshot.data!.docs[index]['proofUrl'];
                          return Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(
                                    left: 10, bottom: 10, right: 10, top: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0XFFF0F1F4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: escalate.cyanColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              child: Text(
                                                snapshot.data!.docs[index]
                                                    ['status'],
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                    "Current Department:"),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  snapshot.data!.docs[index]
                                                      ['currentDepartment'],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text("New Department:"),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  snapshot.data!.docs[index]
                                                      ['newDepartment'],
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 200,
                                          child: Image.network(Imageasd!),
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
