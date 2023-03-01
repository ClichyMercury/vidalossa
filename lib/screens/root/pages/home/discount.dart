import 'package:flutter/material.dart';

class Discount extends StatelessWidget {
  const Discount({
    super.key, required this.containerColor, required this.image, required this.promo, required this.poucentage, required this.container2Color,
  });

  final Color containerColor;
  final Color container2Color;
  final String image;
  final String promo;
  final String poucentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 125,
            width: 125,
            decoration: BoxDecoration(
                color: container2Color,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  promo,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                Text(
                  poucentage,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  " OFF ",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          image,
          height: 160,
          width: 160,
        )
      ]),
    );
  }
}
