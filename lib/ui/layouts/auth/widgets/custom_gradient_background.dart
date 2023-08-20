import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomGradientBackground extends StatelessWidget {
  const CustomGradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.centerLeft,
              begin: Alignment.centerRight,
              colors: [
            ColorsCustom.lineSeparatorColor,
            Color.fromARGB(255, 255, 255, 255)
          ])),
    );
  }
}
