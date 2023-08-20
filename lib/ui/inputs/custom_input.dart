import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final onChanged;
  final validator;
  final TextStyle style;
  final InputDecoration? decoration;
  final bool obscureText;
  final height;

  const CustomInput({
    super.key,
    required this.onChanged,
    required this.validator,
    required this.style,
    required this.decoration,
    this.obscureText = false,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorsCustom.lineSeparatorColor,
                  spreadRadius: 0.2,
                  blurRadius: 5,
                )
              ]),
        ),
        TextFormField(
          onChanged: (_) => onChanged(_),
          validator: (_) => validator(_),
          style: style,
          decoration: decoration,
          obscureText: obscureText,
        )
      ],
    );
  }
}
