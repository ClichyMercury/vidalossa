import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidalossa/coponents/PWtextfield.dart';
import 'package:vidalossa/coponents/elevatedButton.dart';
import 'package:vidalossa/coponents/textfield.dart';
import 'package:vidalossa/screens/connection/connection_page.dart';
import '../../auth/appState.dart';
import '../../auth/landing_page.dart';
import '../../auth/show_exception_alert.dart';
import '../../coponents/alertDialog.dart';
import '../../utils/custum_theme.dart';

TextEditingController emailCtrl = TextEditingController();
TextEditingController pwCtrl = TextEditingController();
TextEditingController nameCtrl = TextEditingController();
TextEditingController numCtrl = TextEditingController();
final user = FirebaseAuth.instance.currentUser!;
bool _isLoading = false;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  void _submit(context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.createUserWithEmailAndPassword(emailCtrl.text, pwCtrl.text);
      await user.sendEmailVerification();
      print(user.uid);
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => LandingPage()));
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      showExecptionALertDialog(
        context,
        title: 'Sign in failed',
        exception: e,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustumTheme.BgightTeal,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(child: Image.asset("assets/images/LogoSample.png")),
                SizedBox(height: 25),
                textFild(
                    hintTxt: "Name",
                    controller: nameCtrl,
                    keyBordType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    enabled: true,
                    prefixIcon: Icons.person),
                SizedBox(height: 20),
                textFild(
                    hintTxt: "Number",
                    controller: numCtrl,
                    keyBordType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    enabled: true,
                    prefixIcon: Icons.numbers),
                SizedBox(height: 20),
                textFild(
                    hintTxt: "Email",
                    controller: emailCtrl,
                    keyBordType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    enabled: true,
                    prefixIcon: Icons.login),
                SizedBox(height: 20),
                PWtextFild(
                    controller: pwCtrl,
                    enabled: true,
                    textInputAction: TextInputAction.done,
                    hintTxt: "password",
                    keyBordType: TextInputType.visiblePassword),
                SizedBox(height: 25),
                Mainbutton(
                  onTap: () {
                    if (emailCtrl.text.isNotEmpty && pwCtrl.text.isNotEmpty) {
                      _submit(context);
                    } else {
                      showAlertDialog(context,
                          title: "Email or Password",
                          content:
                              "Make sure Email Field and Password Field is not empty before Submit",
                          defaultActionText: "OK");
                    }
                  },
                  text: "S I G N   U P",
                  btnColor: CustumTheme.Teal,
                  loading: _isLoading,
                ),
                const SizedBox(height: 25),
                const Text(
                  "By creating your account you accept the conditions of use of your data as part of the improvement of our services",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already an account ?  ",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const ConnectionPage()));
                      },
                      child: const Text(
                        "Login here",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: CustumTheme.Teal),
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
