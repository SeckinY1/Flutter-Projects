import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._(); // Kurucuyu bu şekilde oluşturduğumuzda, kodu yazanlar bu sınıfın kurucusunu başka yerde yeniden oluşturamazlar.

  static const String title = "Pokedex";

  static TextStyle getTitleTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(48));
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(20));
  }

  static TextStyle getTypeChipTextStyle() {
    return TextStyle(color: Colors.white, fontSize: _calculateFontSize(18));
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size
          .sp; // Bu yapı telefonun default font size değerine göre hareket eder. Bize font size belirlesek bile bu yapı sayesinde kullanıcının telefon ayarına göre ekran ölçeklendirme yapılır.
    } else {
      return (size * 0.003).sh;
    }
  }

  static getPokeInfoTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(16), color: Colors.black);
  }

  static getPokeLabelInfoTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(18),
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }
}
