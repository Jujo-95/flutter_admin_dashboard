import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Splashlayout extends StatelessWidget {
  const Splashlayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 10,
          ),
          Text('Checking')
        ],
      )),
    );
  }
}
