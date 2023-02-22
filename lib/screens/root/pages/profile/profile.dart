import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidalossa/screens/root/pages/profile/userDetails.dart';
import 'package:vidalossa/utils/custum_theme.dart';
import '../../../../auth/appState.dart';
import '../../../../coponents/alertDialog.dart';
import '../../../../coponents/elevatedButton.dart';
import 'options.dart';

bool _isLoading = false;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    // Name, email address, and profile photo URL
    final name = user!.displayName;
    final email = user.email;
    final photoUrl = user.photoURL;


    Future<void> _signOut() async {
      try {
        setState(() => _isLoading = true);
        final auth = Provider.of<AuthBase>(context, listen: false);
        await auth.signOut();
      } catch (e) {
        print(e.toString());
      } finally {
        setState(() => _isLoading = false);
      }
    }

    Future<void> _confirmSignOut(BuildContext context) async {
      final didRequestSignOut = await showAlertDialog(
        context,
        title: "Logout",
        content: "Are you sure you want logout ?",
        cancelActionText: 'Cancel',
        defaultActionText: "Logout",
      );
      if (didRequestSignOut == true) {
        _signOut();
      }
    }

    return Scaffold(
      backgroundColor: CustumTheme.BgightTeal,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundImage: /* AssetImage(
                        "assets/images/rdj.jpeg"), */
                        NetworkImage('${photoUrl}'),
                    radius: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => UserDetails()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${name}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        Text(
                          '${email}',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 420,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OptionsProfile(icon: Icons.email, data: "Reception box"),
                  OptionsProfile(icon: Icons.note_add, data: "Reviews"),
                  OptionsProfile(icon: Icons.card_giftcard, data: "Discount"),
                  OptionsProfile(icon: Icons.favorite, data: "Favorites"),
                  OptionsProfile(
                      icon: Icons.business_rounded, data: "Foolowed sellers"),
                ],
              ),
            ),
            SizedBox(height: 15),
            Mainbutton(
              onTap: () {
                _confirmSignOut(context);
              },
              text: "L O G O U T ",
              btnColor: Colors.orange,
              loading: _isLoading,
            )
          ],
        ),
      )),
    );
  }
}
