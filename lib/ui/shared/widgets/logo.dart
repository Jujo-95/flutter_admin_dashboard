import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 1),
        child: Image.asset('estrategia_inmobiliaria_logo.png'),
      ),
    );
  }
}
