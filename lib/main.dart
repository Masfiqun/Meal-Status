import 'package:flutter/material.dart';
// import 'package:meal_status/home_page.dart';
import 'package:meal_status/all_pages.dart';

void main(){
  runApp(const meal_status());
}


class meal_status extends StatelessWidget {
  const meal_status({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: All_pages(),
    );
  }
}