import 'package:flutter/material.dart';
import 'custum_theme.dart';

Widget textFild({
  required String hintTxt,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBordType,
  TextInputAction? textInputAction,
  FocusNode? focusNode,
  String? errorText,
  required bool enabled,
  IconData? prefixIcon,
}) {
  return Container(
    height: 75.0,
    width: 320,
    decoration: BoxDecoration(
      color: CustumTheme.Teal,
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          margin: EdgeInsets.all(20),
          width: 250.0,
          child: TextField(
            showCursor: true,
            focusNode: focusNode,
            textInputAction: textInputAction,
            autocorrect: false,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyBordType,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  prefixIcon,
                  color: Colors.black,
                ),
                enabled: enabled,
                errorText: errorText,
                border: InputBorder.none,
                hintText: hintTxt,
                hintStyle: TextStyle(fontSize: 15, color: Colors.white)),
          ),
        ),
      ],
    ),
  );
}
