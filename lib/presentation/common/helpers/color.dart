import 'package:flutter/material.dart';

hexStringToColor(String hexcolor) {
  hexcolor = hexcolor.toUpperCase().replaceAll("#", "");
  if (hexcolor.length == 6) {
    hexcolor = "FF$hexcolor";
  }
  return Color(int.parse(hexcolor, radix: 16));
}
