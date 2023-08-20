import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:flutter/material.dart';

class LineSeparator extends StatelessWidget {
  const LineSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      color: ColorsCustom.lineSeparatorColor,
      height: 1,
      width: double.infinity,
    );
  }
}
