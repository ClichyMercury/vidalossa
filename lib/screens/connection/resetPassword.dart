import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidalossa/coponents/elevatedButton.dart';
import 'package:vidalossa/coponents/textfield.dart';

import '../../auth/appState.dart';
import '../../auth/show_exception_alert.dart';
import '../../coponents/alertDialog.dart';
import '../../coponents/resetPasswordAlertDialog.dart';
import '../../utils/custum_theme.dart';

TextEditingController emailCtrl = TextEditingController();
final user = FirebaseAuth.instance.currentUser!;
bool _isLoading = false;

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
/*   @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    Future<void> resetPassword(context) async {
      try {
        setState(() => _isLoading = true);
        final auth = Provider.of<AuthBase>(context, listen: false);
        await auth.resetPassword(emailCtrl.text);
      } on FirebaseAuthException catch (e) {
        print(e.toString());
        showExecptionALertDialog(
          context,
          title: 'reset password failed',
          exception: e,
        );
      } finally {
        setState(() => _isLoading = false);
        resetPasswordCustumAlertDialog(context,
            title: "Check your mailbox",
            content:
                "We have sent you a link in your mailbox to allow you to reset your password",
            defaultActionText: "OK");
        /*  */
      }
    }

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
                    hintTxt: "Email",
                    controller: emailCtrl,
                    keyBordType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    enabled: true,
                    prefixIcon: Icons.login),
                SizedBox(height: 25),
                Mainbutton(
                  onTap: () {
                    if (emailCtrl.text.isNotEmpty) {
                      resetPassword(context);
                    } else {
                      showAlertDialog(context,
                          title: "Email ",
                          content:
                              "Make sure Email Field is not empty before Submit",
                          defaultActionText: "OK");
                    }
                  },
                  text: "Reset Password",
                  btnColor: CustumTheme.Teal,
                  loading: _isLoading,
                ),
              ]),
        ),
      ),
    );
  }
}
