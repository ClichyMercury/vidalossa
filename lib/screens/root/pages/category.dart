import 'package:flutter/material.dart';
import 'package:vidalossa/utils/custum_theme.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustumTheme.BgightTeal,
      body: Center(
          child: Text(
        "Categories",
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}
