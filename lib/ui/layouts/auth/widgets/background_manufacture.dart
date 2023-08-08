import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BackgroundManufacture extends StatelessWidget {
  const BackgroundManufacture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('manufacture_image.jpg'),
          fit: BoxFit.cover,
        ),
      );
}
