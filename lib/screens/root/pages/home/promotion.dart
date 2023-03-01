import 'package:flutter/material.dart';
import 'package:vidalossa/utils/custum_theme.dart';

class PrimeLIst extends StatelessWidget {
  const PrimeLIst(
      {super.key,
      required this.data,
      required this.text,
      required this.textColor,
      required this.POurcentage});

  final String data;
  final String text;
  final Color textColor;
  final String POurcentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 125,
      decoration: BoxDecoration(
          border: Border.all(color: CustumTheme.Teal, width: 1),
          borderRadius: BorderRadius.circular(25),
          color: CustumTheme.lightTeal,
          image: DecorationImage(image: AssetImage(data))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 15, color: textColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              POurcentage,
              style: TextStyle(
                  fontSize: 17, color: textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
