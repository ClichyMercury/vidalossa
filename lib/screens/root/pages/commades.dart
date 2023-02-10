import 'package:flutter/material.dart';
import 'package:vidalossa/utils/custum_theme.dart';

class Commandes extends StatelessWidget {
  const Commandes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustumTheme.BgightTeal,
      body: Center(
          child: Text(
        "Commandes",
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}
