import 'package:flutter/material.dart';

class Meals{
  String day;
  String date;
  String IconPath;
  bool boxIsSelected;
  ValueNotifier<bool> controller;

  Meals({
    required this.date,
    required this.day,
    required this.IconPath,
    required this.boxIsSelected,
    required this.controller
  });

  static List<Meals> getMeals(){
    List<Meals> _meals = [];

    _meals.add(
      Meals(
        date: '22/08/24', 
        day: 'Thursday',
        IconPath: 'assets/Icons/sal.svg',
        boxIsSelected: true,
        controller: ValueNotifier<bool>(false)
      )
    );

    _meals.add(
      Meals(
        date: '23/08/24', 
        day: 'Friday',
        IconPath: 'assets/Icons/sal.svg',
        boxIsSelected: true,
        controller: ValueNotifier<bool>(false)
      )
    );

    _meals.add(
      Meals(
        date: '24/08/24', 
        day: 'Saturday',
        IconPath: 'assets/Icons/sal.svg',
        boxIsSelected: true,
        controller: ValueNotifier<bool>(false)
      )
    );

    _meals.add(
      Meals(
        date: '25/08/24', 
        day: 'Sunday',
        IconPath: 'assets/Icons/sal.svg',
        boxIsSelected: true,
        controller: ValueNotifier<bool>(false)
      )
    );

    _meals.add(
      Meals(
        date: '26/08/24', 
        day: 'Monday',
        IconPath: 'assets/Icons/sal.svg',
        boxIsSelected: true,
        controller: ValueNotifier<bool>(false)
      )
    );

    return _meals;

  }
}