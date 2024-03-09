import 'package:flutter/material.dart';


TextStyle getTitleStyle(
        {Color color = const Color(0xFFFF7622),
        double? fontSize = 18,
        FontWeight? fontWeight = FontWeight.bold}) =>
    TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);

TextStyle getbodyStyle(
        {Color color = const Color(0xff32343E),
        double? fontSize = 14,
        FontWeight? fontWeight = FontWeight.w400}) =>
   TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: color);

TextStyle getsmallStyle(
        {Color color = const Color(0xFF646982),
        double? fontSize = 12,
        FontWeight? fontWeight = FontWeight.w500}) =>
   TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: color);
TextStyle getappbartextStyle(
        {Color color = const Color(0xff181C2E),
        double? fontSize = 17,
        FontWeight? fontWeight = FontWeight.normal}) =>
   TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: color);
