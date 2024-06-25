import 'package:flutter/material.dart';

class EcoTaxiColorPalette {
  final Color background;
  final Color text;
  final Color highlight1;
  final Color highlight2;
  final Color highlight3;
  final Color highlight4;
  final Color highlight5;
  final Color highlight6;
  final Brightness brightness;

  const EcoTaxiColorPalette({
    required this.background,
    required this.text,
    required this.highlight1,
    required this.highlight2,
    required this.highlight3,
    required this.highlight4,
    required this.highlight5,
    required this.highlight6,
    required this.brightness,
  });
}

const EcoTaxiColorPalette lightColorPalette = EcoTaxiColorPalette(
  background: Color(0xffeafdf8),
  text: Color(0xff2e2e3a),
  highlight1: Color(0xffA36200),
  highlight2: Color(0xff064700),
  highlight3: Color(0xff800200),
  highlight4: Color(0xff003E6B),
  highlight5: Color(0xff1B0FC7),
  highlight6: Color(0xffBE3D9F),
  brightness: Brightness.light,
);

const EcoTaxiColorPalette darkColorPalette = EcoTaxiColorPalette(
  background: Color(0xff141514),
  text: Color(0xffFFFCFF),
  highlight1: Color(0xffFFA400),
  highlight2: Color(0xff23CE6B),
  highlight3: Color(0xffF1B1B7),
  highlight4: Color(0xff70CBFF),
  highlight5: Color(0xffD2FF28),
  highlight6: Color(0xffDB5ABA),
  brightness: Brightness.dark,
);
