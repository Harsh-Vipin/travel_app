import 'package:flutter/material.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/navpages/main_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

void main() {
  runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const DetailPage(),
  ));
}
