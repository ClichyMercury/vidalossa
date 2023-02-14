import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vidalossa/utils/custum_theme.dart';

import '../root/root.dart';

class flashScreen extends StatefulWidget {
  const flashScreen({Key? key}) : super(key: key);

  @override
  State<flashScreen> createState() => _flashScreenState();
}

class _flashScreenState extends State<flashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), (() {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const BaseApp()));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustumTheme.BgightTeal,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/LogoSample.png",
            height: 215,
            width: 215,
          ),
          SizedBox(
            height: 55,
          ),
          CircularProgressIndicator(color: CustumTheme.Teal)
        ],
      )),
    );
  }
}
