import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:vidalossa/screens/connection_page.dart';
import 'package:vidalossa/utils/palette.dart';
import 'firebase_options.dart';

void main() async {
  // firebase initialaze
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Strip setup
  final String response =
      await rootBundle.loadString("assets/config/stripe.json");
  final data = await jsonDecode(response);
  Stripe.publishableKey = data["publishableKey"];

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'vidalossa',
      theme: ThemeData(
        fontFamily: 'Inder',
        primarySwatch: Palette.greenToDark,
      ),
      home: ConnectionPage(),
    );
  }
}
