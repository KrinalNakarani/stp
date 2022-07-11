import 'package:flutter/material.dart';
import 'package:stp/screen/Home_Page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Home_Page(),
      },
    ),
  );
}
