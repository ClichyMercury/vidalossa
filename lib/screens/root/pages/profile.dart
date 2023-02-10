import 'package:flutter/material.dart';
import 'package:vidalossa/utils/custum_theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustumTheme.BgightTeal,
      body: Center(
          child: Text(
        "Profile",
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}
