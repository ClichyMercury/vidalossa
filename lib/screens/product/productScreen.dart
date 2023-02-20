import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vidalossa/screens/product/ProductSize.dart';
import 'package:vidalossa/utils/custum_theme.dart';
import 'dart:io' show Platform;

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool favorite = false;
  bool adButtonLoaded = false;

  void onAddToCart() async {
    setState(() {
      adButtonLoaded = true;
    });
    // add to the cart
    setState(() {
      adButtonLoaded = false;
    });
  }

/*   void whatsAppOpen() async {
    await FlutterLaunch.launchWhatsapp(
        phone: "+2550788571346",
        message: "Bonjour J'ai vu votre annonce sur Vidalossa App ");
  } */

  openwhatsapp() async {
    var whatsapp = "+2250788571346";
    final Uri whatsappURl_android = Uri.parse(
        "https://wa.me/$whatsapp?text=${Uri.parse("Bonjour J'ai vu votre annonce sur Vidalossa App ")}");
    final Uri whatappURL_ios = Uri.parse(
        "https://wa.me/$whatsapp?text=${Uri.parse("Bonjour J'ai vu votre annonce sur Vidalossa App ")}");
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(whatappURL_ios)) {
        await launchUrl(whatappURL_ios);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(
        whatsappURl_android,
      )) {
        await launchUrl(whatsappURl_android,
            mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: CustumTheme.BgightTeal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                favorite = !favorite;
              });
            },
            icon: favorite
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(Icons.favorite_border, color: Colors.black),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: Image.network(
                        "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: CustumTheme.Teal),
                        child: IconButton(
                          icon: Icon(
                            LineAwesomeIcons.what_s_app,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            openwhatsapp();
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gateau Mirtille",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  "By MC Delices",
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "USD 12.99",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text(
                                      "4.2 reviews",
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Taste",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Size",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Row(
                          children: [
                            Productsize(data: 'M'),
                            Productsize(data: 'L'),
                            Productsize(data: 'XL'),
                            Productsize(data: 'XXL'),
                            Productsize(data: 'XXXL'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "MC DÉLICES is based in the design of everything that is pastry such as cakes, madeleine, birthday cake, wedding cake, baptism, dowry. From pastry as croissant, chocolate bread, pancake, ice cream like juice ice cream, milk... I also make sweet and salty croquettes, pizzas and sandwiches, Pastel, chawarma, baked bread, chocolate mousse, salted crepe, quiche that's a bit what I do... 😊",
                          ),
                          Container(
                            height: 70,
                          )
                        ]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustumTheme.Teal,
        onPressed: () {},
        tooltip: 'Add To Cart',
        child: const Icon(Icons.add_shopping_cart_sharp),
      ),
    );
  }
}
