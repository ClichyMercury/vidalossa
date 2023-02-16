import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidalossa/utils/custum_theme.dart';
import 'package:vidalossa/coponents/elevatedButton.dart';

import '../../../../auth/appState.dart';
import '../../../../coponents/alertDialog.dart';
import 'card.dart';

bool _isLoading = false;

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    // Name, email address, and profile photo URL
    final name = user!.displayName;
    final email = user.email;
    final photoUrl = user.photoURL;

    final emailVerified = user.emailVerified;

    Future<void> _deleteAccount() async {
      try {
        setState(() => _isLoading = true);
        await user.delete();
      } catch (e) {
        print(e.toString());
      } finally {
        setState(() => _isLoading = false);
      }
    }

    Future<void> _confirmDeleteAccount(BuildContext context) async {
      final didRequestSignOut = await showAlertDialog(
        context,
        title: "Logout",
        content: "Are you sure you want delete your account ?",
        cancelActionText: 'Cancel',
        defaultActionText: "DELETE",
      );
      if (didRequestSignOut == true) {
        _deleteAccount();
      }
    }

    final uid = user.uid;
    return Scaffold(
      backgroundColor: CustumTheme.BgightTeal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: CircleAvatar(
                  backgroundImage: NetworkImage('${photoUrl}'),
                  radius: 100,
                ),
              ),
              SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${name}',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${email}',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    uid,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 15,
                children: const [
                  InsuranceCard(
                    data: "Details",
                  ),
                  InsuranceCard(
                    data: "Address",
                  )
                ],
              ),
              SizedBox(height: 15),
              Wrap(
                spacing: 10,
                runSpacing: 15,
                children: const [
                  InsuranceCard(
                    data: "changes Password",
                  ),
                  InsuranceCard(
                    data: "Delete account",
                  )
                ],
              ),
              SizedBox(height: 15),
              Mainbutton(
                onTap: () {
                  _confirmDeleteAccount(context);
                },
                text: "Delete account",
                btnColor: Colors.red,
                loading: _isLoading,
              )
            ],
          ),
        ),
      ),
    );
  }
}
