import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/custum_theme.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
      decoration: BoxDecoration(
          border: Border.all(color: CustumTheme.Teal, width: 1.0),
          color: CustumTheme.lightTeal,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Center(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Row(
          children: [
            Expanded(
                child: SizedBox(
              width: double.infinity,
              child: Image.network(
                "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                fit: BoxFit.cover,
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Gateau Mirtille",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Qty: 1",
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                        Text(
                          "USD 12.99",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w900),
                        )
                      ]),
                ))
          ],
        ),
      )),
    );
  }
}
