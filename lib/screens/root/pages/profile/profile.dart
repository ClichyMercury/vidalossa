import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vidalossa/screens/root/pages/profile/userDetails.dart';
import 'package:vidalossa/utils/custum_theme.dart';

import 'options.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
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
                    backgroundImage: AssetImage("assets/images/rdj.jpeg"),
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
                    height: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Robert Downey JR",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        Text(
                          "robertdowney@outlook.com",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        Text("+225 07 68 70 73 74",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black))
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
          ],
        ),
      )),
    );
  }
}
