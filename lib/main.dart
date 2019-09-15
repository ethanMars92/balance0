import 'package:balance/asiacell.dart';
import 'package:flutter/material.dart';
import 'korek.dart';
import 'asiacell.dart';
import 'zain.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: Korek.id,
      routes: {
        Korek.id: (context) => Korek(),
        Asiacell.id: (context) => Asiacell(),
        Zain.id: (context) => Zain(),
      },
    ),
  );
}
