import 'package:flutter/material.dart';
import 'package:vidalossa/utils/custum_theme.dart';

import '../models/product.dart';

class Gridcard extends StatefulWidget {
  const Gridcard(
      {super.key,
      required this.index,
      required this.onpressed,
      required this.product});

  final int index;
  final void Function() onpressed;
  final Product product;

  @override
  State<Gridcard> createState() => _GridcardState();
}

class _GridcardState extends State<Gridcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.index % 2 == 0
          ? const EdgeInsets.only(left: 12)
          : const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          border: Border.all(color: CustumTheme.Teal, width: 1.0),
          color: CustumTheme.lightTeal,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: GestureDetector(
        onTap: widget.onpressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Column(children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  widget.product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      widget.product.title,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    widget.product.price.toString(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
