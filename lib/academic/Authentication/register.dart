import 'dart:ui';
import 'package:esclate/DialogBox/errorDialog.dart';
import 'package:esclate/DialogBox/loadingDialog.dart';
import 'package:esclate/Widgets/customTextFieldRegisterPage.dart';
import 'package:esclate/commonAuthentication/login.dart';
import 'package:esclate/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as dateFormat;

class registerAcademic extends StatefulWidget {
  const registerAcademic({super.key});

  @override
  State<registerAcademic> createState() => _registerAcademic();
}

class _registerAcademic extends State<registerAcademic> {
  TextEditingController FullNameAcademic = TextEditingController();
  TextEditingController EmailAcademic = TextEditingController();
  TextEditingController PasswordAcademic = TextEditingController();

  final List<String> dpeartments = [
    "الشريعة",
    "التاريخ والحضارة الاسلامية",
    "علم الأحياء",
    "العلوم الرياضية",
    "الكيمياء",
    "الفيزياء",
    "العمارة الإسلامية",
    "الهندسة الكهربائية",
    "الهندسة المدنية",
    "الهندسة الميكانيكية",
    "القرآءات",
    "الكتاب والسنة",
    "العقيدة",
    "علوم الحاسب",
    "نظم المعلومات",
    "هندسة الحاسب الآلي",
    "علم المعلومات",
    "الدراسات القضائية",
    "الانطمة",
    "طب الأطفال",
    "طب النساء و الولادة",
    "لطب والجراحة",
    "علم الطفيليات",
    "التشريح",
    "علم الكائنات الدقيقة",
    "علم الأمراض",
    "علم الأدوية والسموم",
    "طب المجتمع والرعاية الصحية للحجيج",
    "علم الدم والمناعة",
    "الطب الباطني",
    "الجراحة العامة",
    "تعليم طبي",
    "علم الوراثة الطبية",
    "علم وظائف الأعضاء",
    "الكيمياء الحيوية",
    "جراحة العظام",
    "جراحة الأنف والأذن والحنجرة والعيون",
    "الاقتصاد",
    "المصارف والاسوتق المالية",
    "التمويل",
    "التأمين",
    "طب المختبرات",
    "العلاج الطبيعي",
    "التغذية الاكلينيكية",
    "التقنية السريرية",
    "الصحة المهنية",
    "إدارة المرافق الصحية",
    "الوبائيات",
    "صحة البيئة",
    "التوعية والتعزيز الصحي",
    "ادارة الخدمات الصحية",
    "احصاء طبي",
    "إدارة وتقنية المعلومات الصحية",
    "ممارسات التمريض",
    "علوم وابحاث التمريض",
    "تمريض المجتمع والرعاية الصحية",
    "وقاية الأسنان",
    "العلاج التحفظي وإصحاح الأسنان",
    "جراحة الوجه والفكين وعلوم التشخيص",
    "علوم الفم الأساسية والسريرية",
    "الادوية والسموم",
    "الصيدلانيات",
    "الصيدلة الاكلينيكية",
    "الكيمياء الصيدلية",
    "العقاقير",
    "اللغة والنحو والصرف",
    "الأدب",
    "البلاغة والنقد",
    "دراسات لغات الشعوب الإسلامية وآدابها",
    "اللغة الانجليزية",
    "الجغرافيا",
    "الخدمة الاجتماعية",
    "الاعلام",
    "التربية الخاصة",
    "المناهج وطرق التدريس",
    "التربية الإسلامية",
    "التربية البدنية",
    "الادارة التربوية",
    "علم النفس",
    "التربية الاسرية",
    "الطفولة المبكرة",
    "رياض الأطفال",
    "تصميم الازياء",
    "الفنون البصرية",
    "التصميم الداخلي",
    "التصميم الجرافيكي",
    "السكن وادارة المنزل",
    "ادارة الاعمال",
    "التسويق",
    "المحاسبة",
    "السياحة والفندقة",
    "ادارة اعمال الحج والعمرة",
    "اللغة والنحو والصرف",
    "الأدب",
    "البلاغة والنقد",
    "دراسات لغات الشعوب الإسلامية وآدابها",
    "الدراسات العليا العربية"
  ];
  final List<String> sectors = [
    "العابدية",
    "الزاهر",
    "العزيزية",
    "ريع ذاخر",
    "الششة"
  ];

  final List<String> colleges = [
    "كليات الشريعة",
    "كلية العلوم التطبيقية",
    "كلية الهندسة والعمارة الإسلامية",
    "كلية الدعوة واصول الدين",
    "كلية الحاسب الآلي ونظم المعلومات",
    "كلية الدراسات القضائية",
    "كلية الطب",
    "كلية الاقتصاد",
    "كلية الطبية التطبيقية",
    "كلية الصحة العامة والمعلوماتية الصحية",
    "كلية التمريض",
    "كلية طب الاسنان",
    "كلية الصيدلة",
    "كلية اللغة العربية",
    "كلية العلوم الاجتماعية",
    "كلية التربية",
    "كلية التصاميم والفنون",
    "كلية ادارة الاعمال",
    "كلية اللغة العربية"
  ];

  String? selectedDepartment;
  String? selectedSector;
  String? selectedCollege;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                "images/up.svg",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: escalate.blueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                "Create a new Account",
                                style: TextStyle(
                                  color: escalate.cyanColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Name",
                                    style: TextStyle(
                                      color: escalate.blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                customTextFieldRegsiterPage(
                                  isSecure: false,
                                  enabledEdit: true,
                                  textEditingController: FullNameAcademic,
                                  textInputType: TextInputType.text,
                                  hint: "Name",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Email",
                                    style: TextStyle(
                                      color: escalate.blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                customTextFieldRegsiterPage(
                                  isSecure: false,
                                  enabledEdit: true,
                                  textEditingController: EmailAcademic,
                                  textInputType: TextInputType.emailAddress,
                                  hint: "Email",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Password",
                                    style: TextStyle(
                                      color: escalate.blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                customTextFieldRegsiterPage(
                                  isSecure: true,
                                  enabledEdit: true,
                                  textEditingController: PasswordAcademic,
                                  textInputType: TextInputType.text,
                                  hint: "Password",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Select your department",
                                    style: TextStyle(
                                      color: escalate.blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: escalate.cyanColor.withAlpha(70),
                                  ),
                                  child: DropdownButton<String>(
                                    value: selectedDepartment,
                                    isDense: true,
                                    underline: const Text(""),
                                    style: TextStyle(
                                      color: escalate.blueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    items: dpeartments
                                        .map(departemtnDown)
                                        .toList(),
                                    iconSize: 20,
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: escalate.blueColor,
                                    ),
                                    onChanged: (value) => setState(
                                        () => selectedDepartment = value),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Select your Sector",
                                    style: TextStyle(
                                      color: escalate.blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: escalate.cyanColor.withAlpha(70),
                                  ),
                                  child: DropdownButton<String>(
                                    value: selectedSector,
                                    isDense: true,
                                    style: TextStyle(
                                      color: escalate.blueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    items:
                                        sectors.map(sectorDepartments).toList(),
                                    isExpanded: true,
                                    underline: const Text(""),
                                    iconSize: 20,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: escalate.blueColor,
                                    ),
                                    onChanged: (value) =>
                                        setState(() => selectedSector = value),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Select your College",
                                    style: TextStyle(
                                      color: escalate.blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: escalate.cyanColor.withAlpha(70),
                                  ),
                                  child: DropdownButton<String>(
                                    value: selectedCollege,
                                    isDense: true,
                                    underline: const Text(""),
                                    style: TextStyle(
                                      color: escalate.blueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    items:
                                        colleges.map(collegeDropDown).toList(),
                                    isExpanded: true,
                                    iconSize: 20,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: escalate.blueColor,
                                    ),
                                    onChanged: (value) =>
                                        setState(() => selectedCollege = value),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
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
                                  ValidateData();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 30,
                                    left: 30,
                                    bottom: 10,
                                    top: 10,
                                  ),
                                  child: Text(
                                    "signup",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: escalate.blueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Already have account?"),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (_) => const loginPage(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.zero,
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                        const Size(0, 0),
                                      ),
                                    ),
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Color(0XFF1F64FF),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
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

  // For drop Down Menu
  DropdownMenuItem<String> sectorDepartments(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      );

  // For the College Drop Down
  DropdownMenuItem<String> collegeDropDown(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      );

  ValidateData() async {
    if (FullNameAcademic.text.isNotEmpty &&
        EmailAcademic.text.isNotEmpty &&
        PasswordAcademic.text.isNotEmpty &&
        selectedDepartment!.isNotEmpty &&
        selectedSector!.isNotEmpty &&
        selectedCollege!.isNotEmpty) {
      if (EmailAcademic.text.endsWith("st.uqu.edu.sa")) {
        displayDialogg();
      } else if (EmailAcademic.text.endsWith("uqu.edu.sa")) {
        displayDialogg();
      } else {
        showDialog(
          context: context,
          builder: (_) => const errorDialog(
            message: "The email should ends @st.uqu.edu.sa or uqu.edu.sa",
          ),
        );
      }
    } else {
      displayDialog();
    }
  }

  displayDialog() {
    showDialog(
      context: context,
      builder: (_) => const errorDialog(
        message: "Please fill up the form",
      ),
    );
  }

  displayDialogg() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return const LoadingAlertDialog(
          message: "Registering User",
        );
      },
    );
    _registerUser();
  }

  String newUser = '';

  void _registerUser() async {
    await escalate.auth!
        // this to make new account
        .createUserWithEmailAndPassword(
      email: EmailAcademic.text.trim(),
      password: PasswordAcademic.text.trim(),
    )
        .then((currentUid) {
      newUser = currentUid.user!.uid;
      saveUserInfoToFireStor(newUser);
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return errorDialog(
              message: error.message.toString(),
            );
          });
    });
  }

  Future saveUserInfoToFireStor(fUser) async {
    await escalate.firebaseFirestore!
        .collection("users")
        .doc(fUser.toString())
        .set(
      {
        "uid": fUser.toString(),
        "type": "academic",
        "email": EmailAcademic.text.trim(),
        "name": FullNameAcademic.text.trim(),
        "department": selectedDepartment!.trim(),
        "sector": selectedSector!.trim(),
        "college": selectedCollege!.trim(),
        "status": "active",
        "registedOn": dateFormat.DateFormat('dd-mm-yyyy')
            .format(DateTime.now())
            .toString(),
      },
    ).then((value) {
      Navigator.pop(context);
      Route route = MaterialPageRoute(builder: (_) => const loginPage());
      Navigator.pushReplacement(context, route);
    });
  }
}
