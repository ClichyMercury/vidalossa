import 'package:flutter/material.dart';

import '../../../../utils/custum_theme.dart';

class OptionsProfile extends StatelessWidget {
  const OptionsProfile({
    super.key,
    required this.icon,
    required this.data,
    /* required this.touch */
  });

  final IconData icon;
  final String data;
  /* final Widget touch; */

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /* onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => touch));
      }, */
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: CustumTheme.Teal,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Icon(
                  icon,
                  color: Colors.black,
                  size: 37,
                ),
              ),
              Text(
                data,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
