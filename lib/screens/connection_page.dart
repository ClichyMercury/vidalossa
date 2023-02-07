import 'package:flutter/material.dart';


const Color Teal = Color(0xFF199898);

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Teal,
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(25), child: Column(children: [
          Image.asset("assets/images/LogoSample.png")
        ]),),
      ),
    );
  }
}
