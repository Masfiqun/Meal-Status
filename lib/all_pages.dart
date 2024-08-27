import 'package:flutter/material.dart';
import 'package:meal_status/home_page.dart';

class All_pages extends StatefulWidget {
  const All_pages({super.key});

  @override
  State<All_pages> createState() => _All_pagesState();
}

class _All_pagesState extends State<All_pages> {
  @override
  Widget build(BuildContext context) {
    return Homepage();
  }
}