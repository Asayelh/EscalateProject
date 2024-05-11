import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esclate/DialogBox/loadingDialog.dart';
import 'package:esclate/config/config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as dateFormat;

class CommentsPage extends StatefulWidget {
  final String PostUid;
  const CommentsPage({super.key, required this.PostUid});

  @override
  State<CommentsPage> createState() => _CommentsPage();
}

class _CommentsPage extends State<CommentsPage> {
  var fullName = escalate.sharedPreferences!.getString(escalate.academicName);
  var College = escalate.sharedPreferences!.getString(escalate.acadamicCollege);
  var Sector = escalate.sharedPreferences!.getString(escalate.academicSecotr);
  var Email = escalate.sharedPreferences!.getString(escalate.academicEmail);
  var Depratment =
      escalate.sharedPreferences!.getString(escalate.academicDepartemnt);

  TextEditingController _comment = TextEditingController();
  bool autoFocus = false;

  @override
  void dispose() {
    _comment;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.grey),
        title: const Text(
          "Posts",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  StreamBuilder(
                    stream: escalate.firebaseFirestore!
                        .collection("posts")
                        .doc(widget.PostUid)
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
                          snapshot.connectionState == ConnectionState.active) {
                        String ImageUrl =
                            snapshot.data!.get('postedByImageURL');
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              Text(
                                                snapshot.data!
                                                    .get("count")
                                                    .toString(),
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: const Icon(Icons
                                                    .keyboard_arrow_down_outlined),
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
                                                    snapshot.data!
                                                        .get('postedByName'),
                                                    style: const TextStyle(
                                                      color: Color(0XFF404E8B),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data!
                                                        .get('department'),
                                                    style: const TextStyle(
                                                      color: Color(0XFF404E8B),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    snapshot.data!
                                                        .get('postMessage'),
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
                                                          child: Image.network(
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                autofocus: autoFocus,
                                controller: _comment,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  isCollapsed: false,
                                  isDense: true,
                                  focusColor: escalate.primaryNewColor,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: escalate.primaryNewColor,
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: escalate.primaryNewColor,
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: escalate.primaryNewColor,
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'Comment',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        sendingComment();
                                      },
                                      child: const Icon(Icons.send)),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text("");
                      }
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: escalate.firebaseFirestore!
                        .collection("posts")
                        .doc(widget.PostUid)
                        .collection("comments")
                        // .orderBy("count", descending: true)
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
                          snapshot.connectionState == ConnectionState.active) {
                        return Container(
                          height: 300,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                                  .docs[index][
                                                              'CommentedByName'],
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0XFF404E8B),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['Comment'],
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0XFF404E8B),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        // Text(
                                                        //   snapshot.data!
                                                        //           .docs[index]
                                                        //       ['postMessage'],
                                                        //   style:
                                                        //       const TextStyle(),
                                                        // ),
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
                      } else {
                        return const Text("");
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future sendingComment() async {
    _comment.text.isNotEmpty ? savingImagePost("Sending Comment") : null;
  }

  savingImagePost(String mesg) async {
    showDialog(
      context: context,
      builder: (_) => LoadingAlertDialog(
        message: mesg,
      ),
    );

    savingPost();
  }

  savingPost() async {
    String currentUser = escalate.auth!.currentUser!.uid;
    escalate.firebaseFirestore!
        .collection("posts")
        .doc(widget.PostUid)
        .collection("comments")
        .add({
      "CommentedByUid": currentUser.toString().trim(),
      "CommentedByName": "$fullName",
      "email": Email,
      "commentedOn": DateTime.now(),
      "Comment": _comment.text.trim(),
      "CommentDate":
          dateFormat.DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
      "commentCount": 0,
    }).then((value) {
      Navigator.pop(context);
      _comment.text = '';
    });
    setState(() {
      autoFocus = false;
    });
  }
}
