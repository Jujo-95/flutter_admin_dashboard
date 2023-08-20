import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration authPageCustomInputBoxDecoration(
      {required String hint, String? label, IconData? icon}) {
    return InputDecoration(
      filled: true,
      fillColor: ColorsCustom.backgroundColor,
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsCustom.lineSeparatorColor),
          borderRadius: BorderRadius.circular(10),
          gapPadding: 2),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsCustom.primaryButtonColor),
          borderRadius: BorderRadius.circular(10)),
      hintText: hint,
      labelText: label,
      //prefixIcon: Icon(icon, color: ColorsCustom.subtitleColor),
      hintStyle: TextStyle(color: ColorsCustom.subtitleColor),
      labelStyle: TextStyle(color: ColorsCustom.subtitleColor),
    );
  }

  static InputDecoration searchInputDecoration(
      {required String hint, required IconData icon}) {
    return InputDecoration(
      border: InputBorder.none,
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.grey),
    );
  }
}
