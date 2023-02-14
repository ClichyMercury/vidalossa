import 'package:flutter/material.dart';
import 'package:vidalossa/screens/root/pages/Categories/constant.dart';



class CategoryView extends StatelessWidget {
  final int? column, items;
  final Widget? child;
  final Color? color;
  final double? ratio, height, width;
  final direction, itemBuilder;
  const CategoryView({
    Key? key,
    this.column,
    this.items,
    this.child,
    this.color,
    this.ratio,
    this.height,
    this.width,
    this.direction,
    this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
      child: GridView.builder(
          padding: EdgeInsets.all(kLess),
          scrollDirection: direction,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: column!,
            childAspectRatio: ratio!,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
          ),
          itemCount: items,
          itemBuilder: itemBuilder),
    );
  }
}
