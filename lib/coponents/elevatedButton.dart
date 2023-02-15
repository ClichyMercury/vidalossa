import 'package:flutter/material.dart';
import 'package:vidalossa/coponents/loader.dart';

class Mainbutton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String? image;
  final Color? txtColor;
  final Color btnColor;
  final bool loading;
  const Mainbutton({
    Key? key,
    required this.onTap,
    required this.text,
    this.image,
    this.txtColor,
    required this.btnColor, required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onTap,
      child: Container(
        height: 49.0,
        width: 320,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Image.asset(
                'assets/images/$image',
                height: 25.0,
                width: 60.0,
              ),
            loading ? const Loader() : Text(
              text,
              style:
                  TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
