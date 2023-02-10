import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vidalossa/utils/custum_theme.dart';

import '../../../utils/scrollList.dart';

TextEditingController searchCrtl = TextEditingController();
FocusNode searchNode = FocusNode();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustumTheme.BgightTeal,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 45.0,
                      width: 290,
                      decoration: BoxDecoration(
                        color: CustumTheme.lightTeal,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 45,
                            width: 270.0,
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
                                  enabled: true,
                                  border: InputBorder.none,
                                  hintText: "search",
                                  hintStyle: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          LineAwesomeIcons.filter,
                          size: 20,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 175,
                decoration: BoxDecoration(
                    color: Color(0xFFD17E7E),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                              color: Color(0xFFD99B9B),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Get the special discount",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              Text(
                                " 50 % ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              Text(
                                " OFF ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/images/promo.png",
                        height: 160,
                        width: 160,
                      )
                    ]),
              ),
              SizedBox(height: 10),
              Container(
                height: 70,
                child: Stack(children: [
                  ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      ScrollList(
                        string: "Tech",
                        image:
                            "assets/images/kisspng-laptop-tablet-computer-computer-monitor-smartphone-smartphone-tablet-app-show-5a7db44239bd87.6150444015181875862365.png",
                      ),
                      ScrollList(
                        string: "Sport",
                        image:
                            "assets/images/kisspng-physical-fitness-silhouette-physical-exercise-yoga-sports-silhouette-5a84e265373299.0877979515186581492261.png",
                      ),
                      ScrollList(
                        string: "Tech",
                        image:
                            "assets/images/kisspng-laptop-tablet-computer-computer-monitor-smartphone-smartphone-tablet-app-show-5a7db44239bd87.6150444015181875862365.png",
                      ),
                      ScrollList(
                        string: "Sport",
                        image:
                            "assets/images/kisspng-physical-fitness-silhouette-physical-exercise-yoga-sports-silhouette-5a84e265373299.0877979515186581492261.png",
                      ),
                      ScrollList(
                        string: "Tech",
                        image:
                            "assets/images/kisspng-laptop-tablet-computer-computer-monitor-smartphone-smartphone-tablet-app-show-5a7db44239bd87.6150444015181875862365.png",
                      ),
                      ScrollList(
                        string: "Sport",
                        image:
                            "assets/images/kisspng-physical-fitness-silhouette-physical-exercise-yoga-sports-silhouette-5a84e265373299.0877979515186581492261.png",
                      ),
                      ScrollList(
                        string: "Tech",
                        image:
                            "assets/images/kisspng-laptop-tablet-computer-computer-monitor-smartphone-smartphone-tablet-app-show-5a7db44239bd87.6150444015181875862365.png",
                      ),
                      ScrollList(
                        string: "Sport",
                        image:
                            "assets/images/kisspng-physical-fitness-silhouette-physical-exercise-yoga-sports-silhouette-5a84e265373299.0877979515186581492261.png",
                      ),
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
