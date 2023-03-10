import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vidalossa/screens/root/pages/Categories/category%20copy.dart';
import 'package:vidalossa/screens/root/pages/commades.dart';
import 'package:vidalossa/screens/root/pages/home/home.dart';
import 'package:vidalossa/screens/root/pages/profile/profile.dart';
import 'package:vidalossa/utils/custum_theme.dart';
import '../../auth/appState.dart';
import '../../coponents/alertDialog.dart';
import '../chart/chart_view.dart';

class BaseApp extends StatefulWidget {
  const BaseApp({
    Key? key,
  }) : super(key: key);

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  int currentIndex = 0;

  final screens = [Home(), Category(), Commandes(), Profile()];

  void _setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _signOut() async {
      try {
        final auth = Provider.of<AuthBase>(context, listen: false);
        await auth.signOut();
      } catch (e) {
        print(e.toString());
      }
    }

    Future<void> _confirmSignOut(BuildContext context) async {
      final didRequestSignOut = await showAlertDialog(
        context,
        title: "Logout",
        content: "Are you sure you want logout ?",
        cancelActionText: 'Cancel',
        defaultActionText: "Logout",
      );
      if (didRequestSignOut == true) {
        _signOut();
      }
    }

    final items = <Widget>[
      const Icon(LineAwesomeIcons.home, size: 30),
      const Icon(Icons.list, size: 30),
      const Icon(
        LineAwesomeIcons.people_carry,
        size: 30,
      ),
      const Icon(Icons.person, size: 30),
    ];
    return Container(
      color: CustumTheme.BgightTeal,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    _confirmSignOut(context);
                  },
                  icon: Icon(Icons.logout)),
              title: Image.asset(
                  "assets/images/LogoSample_ByTailorBrands-removebg-preview (1).png"),
              centerTitle: true,
              backgroundColor: CustumTheme.BgightTeal,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const ChartView()));
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ))
              ],
            ),
            body: IndexedStack(
              index: currentIndex,
              children: screens,
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(color: Colors.black),
              ),
              child: CurvedNavigationBar(
                key: navigationKey,
                color: CustumTheme.Teal,
                buttonBackgroundColor: CustumTheme.lightTeal,
                backgroundColor: Colors.transparent,
                height: 60,
                animationCurve: Curves.decelerate,
                animationDuration: const Duration(milliseconds: 350),
                index: currentIndex,
                items: items,
                onTap: (index) => _setIndex(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
