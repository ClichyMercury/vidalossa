import 'package:flutter/material.dart';
import 'package:vidalossa/coponents/PWtextfield.dart';
import 'package:vidalossa/coponents/elevatedButton.dart';
import 'package:vidalossa/coponents/textfield.dart';
import 'package:vidalossa/screens/connection/register_page.dart';
import 'package:vidalossa/screens/root/root.dart';

import '../../coponents/alertDialog.dart';
import '../../utils/custum_theme.dart';

TextEditingController emailCtrl = TextEditingController();
TextEditingController pwCtrl = TextEditingController();

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
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
                  onPressed: () {},
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  )),
            ),
            SizedBox(height: 13.5),
            Mainbutton(
                onTap: () {
                  if (emailCtrl.text.isNotEmpty && pwCtrl.text.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const BaseApp()));
                  } else {
                    showAlertDialog(context,
                        title: "Email or Password",
                        content:
                            "Make sure Email Field and Password Field is not empty before Submit",
                        defaultActionText: "OK");
                  }
                },
                text: "L  O  G  I  N",
                btnColor: CustumTheme.Teal),
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
                    onTap: () {},
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
