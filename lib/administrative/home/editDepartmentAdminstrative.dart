import 'dart:io';
import 'package:esclate/DialogBox/errorDialog.dart';
import 'package:esclate/DialogBox/loadingDialog.dart';
import 'package:esclate/config/config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as dateFormat;

class EditDepartmentAdmnistrative extends StatefulWidget {
  const EditDepartmentAdmnistrative({super.key});

  @override
  State<EditDepartmentAdmnistrative> createState() =>
      _EditDepartmentAdmnistrative();
}

class _EditDepartmentAdmnistrative extends State<EditDepartmentAdmnistrative> {
  final List<String> dpeartments = [
    "عمادة تقنية المعلومات",
    "عمادة التعلم الإلكتروني والتعليم عن بعد",
    "عمادة القبول والتسجيل",
    "عمادة الدراسات العليا",
    "عمادة شؤون الطلاب",
    "عمادة السنة الأولى المشتركة",
    "عمادة شؤون المكتبات",
    "عمادة شؤون أعضاء هيئة التدريس والموظفين",
    "عمادة البحث العلمي",
    "عمادة التطوير الجامعي والجودة النوعية",
    "كليات الشريعة",
    "كلية العلوم التطبيقية",
    "كلية الهندسة والعمارة الإسلامية",
    "كلية الدعوة واصول الدين",
    "كلية الامر بالمعروف",
    "كلية الحاسب الآلي ونظم المعلومات",
    "كلية الدراسات القضائية",
    "كلية الطب",
    "كلية الاقتصاد",
    "كلية الطبية التطبيقية",
    "كلية الصحة العامة",
    "كلية التمريض",
    "كلية طب الاسنان",
    "كلية الصيدلة",
    "كلية اللغة العربية والغير ناطقين بها",
    "كلية العلوم الاجتماعية",
    "كلية التربية",
    "كلية خدمة المجتمع",
    "كلية التصاميم والفنون",
    "كلية اللغة الإنجليزية",
    "إدارة تنمية الموارد البشرية",
    "إدارة السلامة",
    "الإدارة العامة للخدمات التعليمة",
    "إدارة الاستثمار",
    "إدارة المبادرات وتحقيق الرؤية",
    "إدارة التحول الرقمي",
    "إدارة الأمن السيبراني",
    "إدارة الإتصال المؤسسي",
    "إدارة الجمعيات العلمية",
    "إدارة القانونية",
    "إدارة مكتب المراقب المالي للحسابات الخاصة",
    "إدارة التخطيط والميزانية",
    "إدارة المراجعة الداخلية",
    "إدارة العلاقات العامة",
    "إدارة مراقبة الدوام",
    "إدارة المالية",
    "إدارة المشتريات والمناقصات",
    "إدارة المستودعات",
    "إدارة البعثات",
    "إدارة مجلات الجامعة",
    "إدارة المشاريع العامة",
    "إدارة الملكية الفكرية",
    "إدارة الأمن الجامعي",
    "إدارة المرافق والخدمات",
    "إدارة الإسكان",
    "إدارة الأراضي والممتلكات",
    "إدارة التكاليف"
  ];

  String? selectedDepartment;
  String? newDepartemnt;

  XFile? xFile;
  File? imageFile = null;
  String? PaymentIMageUrl;

  final ImagePicker _picker = ImagePicker();

// Pick Image
  Future pickingImage() async {
    xFile = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = File(xFile!.path);
    setState(() {
      imageFile;
    });
  }

  Future<void> gettingData() async {
    String currentUser = escalate.auth!.currentUser!.uid;
    await escalate.firebaseFirestore!
        .collection("users")
        .doc(currentUser)
        .get()
        .then((value) {
      if (value.exists) {
        setState(() {
          selectedDepartment = value.data()!['department'];
        });
      }
    });
  }

  @override
  void initState() {
    gettingData();
    super.initState();
  }

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 115, left: 15),
                      child: Text(
                        "Edit Department",
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
                margin: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 5,
                  bottom: 5,
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        "Current Department",
                        style: TextStyle(
                          color: Color(0XFF404E8B),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: escalate.cyanColor.withAlpha(70),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedDepartment.toString(),
                            style: TextStyle(
                              color: escalate.blueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                      // child: DropdownButton<String>(
                      //   value: selectedDepartment,
                      //   isDense: true,
                      //   underline: const Text(""),
                      //   style: TextStyle(
                      //     color: escalate.blueColor,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      //   items: dpeartments.map(departemtnDown).toList(),
                      //   isExpanded: true,
                      //   iconSize: 20,
                      //   icon: const Icon(
                      //     Icons.arrow_drop_down,
                      //     color: Colors.black,
                      //   ),
                      //   onChanged: (value) =>
                      //       setState(() => selectedDepartment = value),
                      // ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        "New Department",
                        style: TextStyle(
                          color: Color(0XFF404E8B),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: escalate.cyanColor.withAlpha(70),
                      ),
                      child: DropdownButton<String>(
                        value: newDepartemnt,
                        isDense: true,
                        underline: const Text(""),
                        style: TextStyle(
                          color: escalate.blueColor,
                          fontWeight: FontWeight.bold,
                        ),
                        items: dpeartments.map(departemtnDown).toList(),
                        isExpanded: true,
                        iconSize: 20,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        onChanged: (value) =>
                            setState(() => newDepartemnt = value),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 10,
                  bottom: 10,
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        "Upload Proof",
                        style: TextStyle(
                          color: Color(0XFF404E8B),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pickingImage();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: escalate.cyanColor.withAlpha(70),
                          ),
                          child: imageFile != null
                              ? SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 150,
                                  child: Image(
                                    image: FileImage(imageFile!),
                                  ),
                                )
                              : const Icon(Icons.upload)),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "change department",
                      style: TextStyle(
                        color: Color(0XFF404E8B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        escalate.cyanColor,
                      ),
                      shadowColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      CheckingData();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                        right: 30,
                        left: 30,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Text(
                        "Send",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  // For drop Down Menu
  DropdownMenuItem<String> departemtnDown(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      );

  // DropdownMenuItem<String> newDepartment(String item) => DropdownMenuItem(
  //       value: item,
  //       child: Text(
  //         item,
  //         style: const TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 17,
  //         ),
  //       ),
  //     );

  // // For drop Down Menu
  // DropdownMenuItem<String> currentCollegeDrowDown(String item) =>
  //     DropdownMenuItem(
  //       value: item,
  //       child: Text(
  //         item,
  //         style: const TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 17,
  //         ),
  //       ),
  //     );

  // This is the Publishes Post
  CheckingData() {
    newDepartemnt != null && xFile != null
        // show Errors
        ? GoingNext()
        : showDialog(
            context: context,
            builder: (_) => const errorDialog(
              message: ("Please fill up the form"),
            ),
          );
  }

  // saving Data
  GoingNext() async {
    showDialog(
      context: context,
      builder: (_) => const LoadingAlertDialog(
        message: "Saving Data",
      ),
    );

    if (xFile != null) {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = escalate.firebaseStorage!
          .ref()
          .child("changingDepartement")
          .child(imageName);
      UploadTask uploadTask = reference.putFile(File(xFile!.path));
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      await taskSnapshot.ref.getDownloadURL().then((ImageURL) {
        PaymentIMageUrl = ImageURL;
      });
      savingData();
    }
  }

  savingData() async {
    String currentUser = escalate.auth!.currentUser!.uid;
    await escalate.firebaseFirestore!.collection("editDepartment").add({
      "currentDepartment": selectedDepartment,
      "newDepartment": newDepartemnt,
      "newCollege": "noCollege",
      "registedOn":
          dateFormat.DateFormat('dd-mm-yyyy').format(DateTime.now()).toString(),
      "proofUrl": PaymentIMageUrl,
      "status": "Pending",
      "currentUser": currentUser,
      "fullName": escalate.sharedPreferences!
          .getString(escalate.academicName)
          .toString(),
    }).then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }
}
