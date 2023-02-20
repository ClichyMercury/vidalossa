import 'package:flutter/material.dart';

bool isSelected = false;

class Productsize extends StatefulWidget {
  const Productsize({super.key, required this.data});

  final String data;

  @override
  State<Productsize> createState() => _ProductsizeState();
}

class _ProductsizeState extends State<Productsize> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 25,
        width: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isSelected ? Colors.white : Colors.black,
            border: Border.all(
              width: 1.0,
              color: isSelected ? Colors.black : Colors.white,
            )),
        child: Center(
          child: Text(
            widget.data,
            style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
