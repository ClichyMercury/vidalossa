import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vidalossa/coponents/elevatedButton.dart';
import 'package:vidalossa/screens/chart/list_card.dart';
import 'package:vidalossa/utils/custum_theme.dart';

class ChartView extends StatefulWidget {
  const ChartView({super.key});

  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  final carts = [1, 2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustumTheme.BgightTeal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Chart",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 30),
            itemCount: carts.length,
            itemBuilder: (context, index) {
              return ListCard();
            },
          ),
          priceFooter(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Mainbutton(
                onTap: () {}, text: "CHECKOUT", btnColor: CustumTheme.Teal),
          )
        ],
      )),
    );
  }

  priceFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            height: 2,
            color: CustumTheme.grey,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Text(
                  "Total : ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "Price(USD)",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
