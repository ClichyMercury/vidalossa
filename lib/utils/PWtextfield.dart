import 'package:flutter/material.dart';
import 'package:vidalossa/utils/custum_theme.dart';

// ignore: must_be_immutable
class PWtextFild extends StatefulWidget {
  PWtextFild({
    Key? key,
    required this.controller,
    required this.enabled,
    required this.hintTxt,
    this.textInputAction,
    required this.keyBordType,
  }) : super(key: key);

  FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  bool isObs = false;
  final TextInputType keyBordType;
  String? errorText;
  final bool enabled;
  final String hintTxt;

  @override
  State<PWtextFild> createState() => _PWtextFildState();
}

class _PWtextFildState extends State<PWtextFild> {
  @override
  Widget build(BuildContext context) {
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
              focusNode: widget.focusNode,
              textInputAction: widget.textInputAction,
              autocorrect: false,
              controller: widget.controller,
              textAlignVertical: TextAlignVertical.center,
              obscureText: widget.isObs,
              keyboardType: widget.keyBordType,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.key,
                    color: Colors.black,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isObs = !widget.isObs;
                      });
                    },
                    child: widget.isObs
                        ? Icon(
                            Icons.visibility,
                            color: CustumTheme.BgightTeal,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: CustumTheme.BgightTeal,
                          ),
                  ),
                  enabled: widget.enabled,
                  errorText: widget.errorText,
                  border: InputBorder.none,
                  hintText: widget.hintTxt,
                  hintStyle: TextStyle(fontSize: 15, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

/* Widget PWtextFild({
  required String hintTxt,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBordType,
  TextInputAction? textInputAction,
  FocusNode? focusNode,
  String? errorText,
  required bool enabled,
  IconData? prefixIcon,
  IconData? suffixIcon,
}) {
  return Container(
    height: 75.0,
    width: 320,
    decoration: BoxDecoration(
      color: AppColors.mainGray,
      boxShadow: const [
        BoxShadow(
            color: Colors.black,
            offset: Offset(2.0, 2.0),
            blurRadius: 10.0,
            spreadRadius: 1.0)
      ],
      borderRadius: BorderRadius.circular(65.0),
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
                prefixIcon: Icon(prefixIcon),
                suffixIcon: GestureDetector(
                  onTap: () {
                  setState() {
                      isObs = !isObs;
                    } 
                  },
                  child: isObs
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
                enabled: enabled,
                errorText: errorText,
                border: InputBorder.none,
                hintText: hintTxt,
                hintStyle: TextStyle(fontSize: 15)),
          ),
        ),
      ],
    ),
  );
}
 */