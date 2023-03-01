import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vidalossa/coponents/Grid_card.dart';
import 'package:vidalossa/coponents/elevatedButton.dart';
import 'package:vidalossa/screens/product/productScreen.dart';
import 'package:vidalossa/screens/root/pages/home/promotion.dart';
import 'package:vidalossa/utils/custum_theme.dart';
import '../../../../coponents/loader.dart';
import '../../../../models/product.dart';
import 'discount.dart';
import 'viewAll.dart';
import '../../../../coponents/scrollList.dart';

TextEditingController searchCrtl = TextEditingController();
FocusNode searchNode = FocusNode();

class Home extends StatelessWidget {
  Home({super.key});
  Future<List<Product>>? products;
  final data = [1, 2];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: CustumTheme.BgightTeal,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 45.0,
                      width: MediaQuery.of(context).size.width * 0.93,
                      decoration: BoxDecoration(
                        color: CustumTheme.lightTeal,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        height: 45,
                        width: 290.0,
                        child: TextField(
                          showCursor: true,
                          focusNode: searchNode,
                          textInputAction: TextInputAction.search,
                          autocorrect: false,
                          controller: searchCrtl,
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                LineAwesomeIcons.search,
                                color: Colors.black,
                              ),
                              enabled: false,
                              border: InputBorder.none,
                              hintText: "search",
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Discount(
                containerColor: Color(0xFFD17E7E),
                poucentage: " 50 % ",
                image: "assets/images/promo.png",
                promo: "Get the special discount",
                container2Color: Color(0xFFD99B9B),
              ),
              SizedBox(height: 7.7),
              Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Recently views",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
              SizedBox(height: 7.7),
              Container(
                height: 70,
                child: Stack(children: [
                  ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      ScrollList(
                        string: "Phones",
                      ),
                      ScrollList(
                        string: "Electronics",
                      ),
                      ScrollList(
                        string: "Men Style",
                      ),
                      ScrollList(
                        string: "Sport Articles",
                      ),
                    ],
                  )
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => const ViewAll()));
                        },
                        child: Text(
                          'View all',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ))
                  ],
                ),
              ),
              Container(
                height: 130,
                child: Stack(children: [
                  ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      PrimeLIst(
                        data:
                            "assets/images/kisspng-product-design-lighting-angle-philips-bulb-3d-model-free-5b723da22975b3.4917279515342135381698.png",
                        text: 'Reduction for Domotics',
                        textColor: Colors.black,
                        POurcentage: '27%',
                      ),
                      SizedBox(width: 10),
                      PrimeLIst(
                        data:
                            "assets/images/kisspng-oculus-rift-virtual-reality-headset-htc-vive-oculu-vr-headset-5ab9e87a6558e8.9287833015221331144151.png",
                        text: 'Gaming for all',
                        textColor: Colors.white,
                        POurcentage: 'Up to 35%',
                      ),
                      SizedBox(width: 10),
                      PrimeLIst(
                        data:
                            "assets/images/kisspng-laptop-tablet-computer-computer-monitor-smartphone-smartphone-tablet-app-show-5a7db44239bd87.6150444015181875862365.png",
                        text: 'Last electronis ',
                        textColor: Colors.white,
                        POurcentage: 'Up to 35%',
                      ),
                    ],
                  )
                ]),
              ),
              SizedBox(height: 25),
              Mainbutton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => const ViewAll()));
                },
                text: "View all products",
                btnColor: CustumTheme.Teal,
                loading: false,
              ),
              Container(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
