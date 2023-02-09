import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor greenToDark = const MaterialColor(
    0xFF199898, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff094e53), //10%
      100: const Color(0xff08464a), //20%
      200: const Color(0xff073d40), //30%
      300: const Color(0xff063437), //40%
      400: const Color(0xff052c2e), //50%
      500: const Color(0xff042325), //60%
      600: const Color(0xff031a1c), //70%
      700: const Color(0xff021112), //80%
      800: const Color(0xff010909), //90%
      900: const Color(0xff000000), //100%
    },
  );
}
