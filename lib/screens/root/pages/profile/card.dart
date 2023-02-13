import 'package:flutter/material.dart';
import 'package:vidalossa/utils/custum_theme.dart';

class InsuranceCard extends StatelessWidget {
  final String data;
  //final Widget touch;
  const InsuranceCard({
    super.key,
    required this.data,
    //required this.touch
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*    Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => touch),
          ) */
        ;
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(5),
        height: 130,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: CustumTheme.Teal),
        child: Center(
          child: Text(
            data,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
