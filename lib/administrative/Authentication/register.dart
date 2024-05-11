import 'package:esclate/DialogBox/errorDialog.dart';
import 'package:esclate/DialogBox/loadingDialog.dart';
import 'package:esclate/Widgets/customTextFieldRegisterPage.dart';
import 'package:esclate/commonAuthentication/login.dart';
import 'package:esclate/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as dateFormat;

class administrativeRegister extends StatefulWidget {
  const administrativeRegister({super.key});

  @override
  State<administrativeRegister> createState() => _administrativeRegister();
}

class _administrativeRegister extends State<administrativeRegister> {
  TextEditingController FullNameAdministrative = TextEditingController();
  TextEditingController EmailAdministrative = TextEditingController();
  TextEditingController PasswordAdministrative = TextEditingController();

  final dpeartments = [
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
  final List<String> sectors = [
    "العابدية",
    "الزاهر",
    "العزيزية",
    "ريع ذاخر",
    "الششة"
  ];
  String? selectedDepartment;
  String? selectedSector;
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
              // child: Image.asset("images/background.png"),
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
                                  textEditingController: FullNameAdministrative,
                                  isSecure: false,
                                  enabledEdit: true,
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
                                  textEditingController: EmailAdministrative,
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
                                  isSecure: false,
                                  enabledEdit: true,
                                  textEditingController: PasswordAdministrative,
                                  textInputType: TextInputType.emailAddress,
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
                                    isExpanded: true,
                                    iconSize: 20,
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
                                // on pressed, on tab
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

// Functions
  ValidateData() async {
    if (FullNameAdministrative.text.isNotEmpty &&
        EmailAdministrative.text.isNotEmpty &&
        PasswordAdministrative.text.isNotEmpty &&
        selectedDepartment!.isNotEmpty &&
        selectedSector!.isNotEmpty) {
      if (EmailAdministrative.text.endsWith("st.uqu.edu.sa")) {
        displayDialogg();
      } else if (EmailAdministrative.text.endsWith("uqu.edu.sa")) {
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
          message: "Registering Admnistrative",
        );
      },
    );
    _registerUser();
  }

  String newUser = '';
  void _registerUser() async {
    await escalate.auth!
        .createUserWithEmailAndPassword(
      email: EmailAdministrative.text.trim(),
      password: PasswordAdministrative.text.trim(),
    )
        .then((currentUid) {
      newUser = currentUid.user!.uid;
      saveUserInfoToFireStor(newUser);
      print("This is done");
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
        "type": "administrative",
        "email": EmailAdministrative.text.trim(),
        "name": FullNameAdministrative.text.trim(),
        "department": selectedDepartment!.trim(),
        "sector": selectedSector!.trim(),
        "status": "active",
        "registedOn": dateFormat.DateFormat('dd-mm-yyyy')
            .format(DateTime.now())
            .toString(),
      },
    ).then((value) {
      Navigator.pop(context);
      Route route = MaterialPageRoute(builder: (_) => loginPage());
      Navigator.pushReplacement(context, route);
    });
  }
}
