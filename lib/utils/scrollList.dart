import 'package:flutter/material.dart';
import 'package:vidalossa/utils/custum_theme.dart';

class ScrollList extends StatelessWidget {
  const ScrollList({
    super.key,
    required this.string,
    required this.image,
    //required this.touch,
  });

  final String string;
  final String image;
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
          color: Colors.white,
          border: Border.all(color: CustumTheme.Teal, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              image,
              height: 50,
              width: 50,
            ),
            Text(
              string,
              style: TextStyle(fontSize: 19, color: CustumTheme.Teal),
            ),
          ],
        ),
      ),
    );
  }
}
