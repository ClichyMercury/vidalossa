import 'package:flutter/material.dart';
import 'package:vidalossa/utils/custum_theme.dart';

class ScrollList extends StatelessWidget {
  const ScrollList({
    super.key,
    required this.string,
    //required this.touch,
  });

  final String string;
  //final Widget touch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => touch )); */
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 15,
        width: 125,
        decoration: BoxDecoration(
          color: CustumTheme.lightTeal,
          border: Border.all(color: CustumTheme.Teal, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            string,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
