import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esclate/DialogBox/errorDialog.dart';
import 'package:esclate/DialogBox/loadingDialog.dart';
import 'package:esclate/academic/home/bottomNav.dart';
import 'package:esclate/academic/home/comment.dart';
import 'package:esclate/config/config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as dateFormat;

class DepartementPosts extends StatefulWidget {
  const DepartementPosts({super.key});

  @override
  State<DepartementPosts> createState() => _DepartementPosts();
}

class _DepartementPosts extends State<DepartementPosts> {
  var fullName = escalate.sharedPreferences!.getString(escalate.academicName);
  var College = escalate.sharedPreferences!.getString(escalate.acadamicCollege);

  var Sector = escalate.sharedPreferences!.getString(escalate.academicSecotr);

  var Email = escalate.sharedPreferences!.getString(escalate.academicEmail);
  var Depratment =
      escalate.sharedPreferences!.getString(escalate.academicDepartemnt);

  XFile? ImageXFile;
  File? imageGetting;
  ImagePicker _picker = ImagePicker();
  TextEditingController PostDetials = TextEditingController();
  String? postImageUrl;

  String CurrentUid = escalate.auth!.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          circleButton();
        },
        child: Container(
          transformAlignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: escalate.lightCayn,
          ),
          child: const Icon(
            Icons.edit,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: escalate.firebaseFirestore!
                            .collection("posts")
                            .where("postedFor", isEqualTo: "Departement")
                            .where("postStatus", isEqualTo: "Accepted")
                            .orderBy("count", descending: true)
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
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                String ImageUrl = snapshot.data!.docs[index]
                                    ['postedByImageURL'];

                                String PostUID = snapshot.data!.docs[index].id;

                                int Count = snapshot.data!.docs[index]['count'];

                                int NegativePost = snapshot.data!.docs[index]
                                    ['numberOfNevativeVotes'];

                                int PostiviePost = snapshot.data!.docs[index]
                                    ['numberOfPostitveVotes'];

                                String PostedBy =
                                    snapshot.data!.docs[index]['postedByUid'];

                                if (snapshot.data!.docs[index]['department'] ==
                                    Depratment) {
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
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 8,
                                                                  right: 8,
                                                                  bottom: 0,
                                                                  left: 10),
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Color(
                                                                    0XFF0CDBC6),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            UpVote(
                                                                PostUID,
                                                                Count,
                                                                PostiviePost,
                                                                NegativePost);
                                                          },
                                                          child: const Icon(
                                                            Icons
                                                                .keyboard_arrow_up_outlined,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Text(Count.toString()),
                                                        GestureDetector(
                                                          onTap: () {
                                                            DownVote(
                                                                PostUID,
                                                                Count,
                                                                PostiviePost,
                                                                NegativePost);
                                                          },
                                                          child: const Icon(
                                                            Icons
                                                                .keyboard_arrow_down_outlined,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            print(PostUID);
                                                          },
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              Route route = MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      CommentsPage(
                                                                          PostUid:
                                                                              PostUID));
                                                              Navigator.push(
                                                                  context,
                                                                  route);
                                                            },
                                                            child: const Icon(
                                                                Icons.comment),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Flexible(
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
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      'postedByName'],
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0XFF404E8B),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                // the start of the complete Button
                                                                PostedBy ==
                                                                        CurrentUid
                                                                    ? Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 10),
                                                                        child:
                                                                            GestureDetector(
                                                                          onLongPress:
                                                                              () {
                                                                            markAsComplete(PostUID);
                                                                          },
                                                                          child:
                                                                              const Icon(Icons.check),
                                                                        ),
                                                                      )
                                                                    : Container()
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 15,
                                                            ),
                                                            Text(
                                                              snapshot.data!
                                                                          .docs[
                                                                      index][
                                                                  'department'],
                                                              style:
                                                                  const TextStyle(
                                                                color: Color(
                                                                    0XFF404E8B),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              snapshot.data!
                                                                          .docs[
                                                                      index][
                                                                  'postMessage'],
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            ImageUrl != ""
                                                                ? Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.2,
                                                                    child: Image
                                                                        .network(
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
                                } else {
                                  return const Text("");
                                }
                              },
                            );
                          } else {
                            return const Text("");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Mark as Comeplete
  markAsComplete(String POSTUID) async {
    showDialog(
      context: context,
      builder: (_) => const LoadingAlertDialog(
        message: "Saving...",
      ),
    );
    await escalate.firebaseFirestore!.collection("posts").doc(POSTUID).update(
      {"postStatus": "solved"},
    ).then((value) {
      Navigator.pop(context);
    });
  }

  // This is to vote down functions
  DownVote(
      String PostUID, int Count, int postiviePost, int negativePost) async {
    String currentUser = escalate.auth!.currentUser!.uid;
    // Checking if user already Voted
    var GettingData = await escalate.firebaseFirestore!
        .collection("posts")
        .doc(PostUID)
        .collection("Votes")
        .where("UserVotedUID", isEqualTo: currentUser)
        .where("typeOfVote", isEqualTo: "down")
        .get();

    if (GettingData.docs.isNotEmpty) {
      return null;
      // if(negativePost == )
    } else {
      // check if the up vote is half of the down votes
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const LoadingAlertDialog(
                message: "",
              ));
      await escalate.firebaseFirestore!
          .collection("posts")
          .doc(PostUID)
          .update({
        "count": Count - 1,
        "numberOfNegativeVotes": Count + 1,
        "votedDown": "down",
      }).then(
        (value) async {
          await escalate.firebaseFirestore!
              .collection("posts")
              .doc(PostUID)
              .collection("Votes")
              .add(
            {
              "UserVotedUID": currentUser,
              "typeOfVote": "down",
              "registedOn": dateFormat.DateFormat('dd-mm-yyyy')
                  .format(DateTime.now())
                  .toString(),
            },
          );
        },
      ).then((value) {
        Navigator.pop(context);
      });
    }
  }

  // This is to vote down functions
  UpVote(String PostUID, int Count, int postiviePost, int negativePost) async {
    String currentUser = escalate.auth!.currentUser!.uid;

    // Checking if user already Voted
    var GettingData = await escalate.firebaseFirestore!
        .collection("posts")
        .doc(PostUID)
        .collection("Votes")
        .where("UserVotedUID", isEqualTo: currentUser)
        .where("typeOfVote", isEqualTo: "up")
        .get();

    if (GettingData.docs.isNotEmpty) {
      return null;
    } else {
      await escalate.firebaseFirestore!
          .collection("posts")
          .doc(PostUID)
          .update({
        "count": Count + 1,
        "numberOfPostitveVotes": Count + 1,
        "typeOfVote": "up",
      }).then(
        (value) async {
          await escalate.firebaseFirestore!
              .collection("posts")
              .doc(PostUID)
              .collection("Votes")
              .add(
            {
              "UserVotedUID": currentUser,
              "typeOfVote": "up",
              "registedOn": dateFormat.DateFormat('dd-mm-yyyy')
                  .format(DateTime.now())
                  .toString(),
            },
          );
        },
      );
    }
  }

  // Picking Image
  pickingImageFromGallery() async {
    ImageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageGetting = File(ImageXFile!.path);
    });
    Navigator.of(context).pop();
    await circleButton();
  }

  circleButton() async {
    final sliderValue = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        scrollable: true,
        contentPadding: const EdgeInsets.all(0),
        content: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(0),
                constraints: const BoxConstraints(),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text(
                          "Create Post",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Divider(),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "$fullName",
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                                const Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: PostDetials,
                      // onChanged: (value) =>
                      //    ,
                      obscureText: false,
                      cursorColor: const Color(0XFFD9D9D9),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        isCollapsed: false,
                        isDense: true,
                        hintText: "What’s on your mind, $fullName ?",
                        hintStyle: const TextStyle(fontSize: 10),
                        suffixStyle: TextStyle(color: escalate.primaryNewColor),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text("Add to your post"),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () async {
                                pickingImageFromGallery();
                              },
                              constraints: const BoxConstraints(),
                              icon: const Icon(Icons.image),
                            ),
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              constraints: const BoxConstraints(),
                              icon: const Icon(Icons.person),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: imageGetting != null
                        ? SizedBox(
                            height: 100,
                            child: Image(
                              image: FileImage(
                                imageGetting!,
                              ),
                            ),
                          )
                        : null,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(escalate.lightCayn),
                      ),
                      onPressed: () {
                        checkingEmpty();
                      },
                      child: const Text("Post"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future checkingEmpty() async {
    PostDetials.text.isNotEmpty
        ? savingImagePost("Uploading Post")
        : showErrorMessage();
  }

  showErrorMessage() {
    return showDialog(
      context: context,
      builder: (_) =>
          const errorDialog(message: "Please Fill up the information"),
    );
  }

  savingImagePost(String mesg) async {
    showDialog(
      context: context,
      builder: (_) => LoadingAlertDialog(
        message: mesg,
      ),
    );

    if (imageGetting != null) {
      String imageName = DateTime.now().microsecondsSinceEpoch.toString();
      Reference reference =
          escalate.firebaseStorage!.ref().child("posts").child(imageName);
      UploadTask uploadTask = reference.putFile(
        File(imageGetting!.path),
      );
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      await taskSnapshot.ref.getDownloadURL().then((postIMageUrl) {
        postImageUrl = postIMageUrl;
      });
    }
    savingPost();
  }

  savingPost() async {
    String currentUser = escalate.auth!.currentUser!.uid;
    escalate.firebaseFirestore!.collection("posts").add({
      "postedByUid": currentUser.toString().trim(),
      "postedByName": "$fullName",
      "department": Depratment,
      "college": College,
      "sector": Sector,
      "email": Email,
      "postedByImageURL": postImageUrl ?? "",
      "postStatus": "Pending",

      // This is where it will be posted
      "postedFor": "Departement",
      "postMessage": PostDetials.text.trim(),
      "postedDate":
          dateFormat.DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
      "numberOfPostitveVotes": 0,
      "numberOfNevativeVotes": 0,
      "count": 0,
    }).then((value) {
      Route route = MaterialPageRoute(builder: (_) => const bottomNav());
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    });
  }
}
