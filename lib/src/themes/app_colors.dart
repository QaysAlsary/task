import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Colors.deepPurple;
  static const Color secondaryColor = Color(0xff51eec2);
  static const Color black = Colors.black;
  static const Color darkest = Color(0xff252525);
  static const Color dark = Color(0xff676767);
  static const Color medium = Color(0xff9A9A9A);
  static const Color light = Color(0xffCDCDCD);
  static const Color lightest = Color(0xffECECEC);
  static const Color white = Color(0xffffffff);


  static get enable => lightest;

  static get disable => lightest;

  static get error => Colors.redAccent;


  static get focusError => Colors.red;
}
