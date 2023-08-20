import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Icon(Icons.notifications_none_rounded),
          Positioned(
            left: 2,
            child: Container(
              width: 8,
              height: 8,
              decoration: buildDecoration(),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
      color: Colors.red, borderRadius: BorderRadius.circular(100));
}
