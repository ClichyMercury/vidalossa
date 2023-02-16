import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidalossa/coponents/PWtextfield.dart';
import 'package:vidalossa/coponents/elevatedButton.dart';
import 'package:vidalossa/coponents/textfield.dart';
import 'package:vidalossa/screens/connection/register_page.dart';
import 'package:vidalossa/screens/connection/resetPassword.dart';
import '../../auth/appState.dart';
import '../../auth/show_exception_alert.dart';
import '../../coponents/alertDialog.dart';
import '../../utils/custum_theme.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController pwCtrl = TextEditingController();
  bool _isLoading = false;

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExecptionALertDialog(
      context,
      title: 'Sign in failed',
      exception: exception,
    );
  }

  void _submit(context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithEmailAndPassword(emailCtrl.text, pwCtrl.text);
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

  Future<void> _signInWithGoogle(context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
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
          child: Column(children: [
            Center(child: Image.asset("assets/images/LogoSample.png")),
            SizedBox(height: 25),
            textFild(
                hintTxt: "Email",
                controller: emailCtrl,
                enabled: true,
                keyBordType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.login),
            SizedBox(height: 20),
            PWtextFild(
                controller: pwCtrl,
                enabled: true,
                hintTxt: "password",
                textInputAction: TextInputAction.done,
                keyBordType: TextInputType.visiblePassword),
            SizedBox(height: 13.5),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const ResetPassword()));
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  )),
            ),
            SizedBox(height: 13.5),
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
              text: "L  O  G  I  N",
              btnColor: CustumTheme.Teal,
              loading: _isLoading,
            ),
            SizedBox(height: 20.5),
            Text(
              "or",
              style: TextStyle(fontSize: 17),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _signInWithGoogle(context),
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset("assets/images/Google.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                      child: Image.asset("assets/images/apple.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 60,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Image.asset("assets/images/facebook.png"),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account ?  ",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const RegisterPage()));
                  },
                  child: const Text(
                    "Create here",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: CustumTheme.Teal),
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
