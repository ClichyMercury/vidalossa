import 'package:flutter/material.dart';
import 'package:vidalossa/utils/custum_theme.dart';
import 'package:vidalossa/coponents/elevatedButton.dart';

import 'card.dart';

bool? loading;

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
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
                  backgroundImage: AssetImage("assets/images/rdj.jpeg"),
                  radius: 100,
                ),
              ),
              SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Robert Downey JR",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "robertdowney@outlook.com",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 30),
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
                  onTap: () {}, text: "Delete account", btnColor: Colors.red)
            ],
          ),
        ),
      ),
    );
  }
}
