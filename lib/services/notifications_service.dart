import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:flutter/material.dart';

class NotificationServices {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static showSnackbar(String message) {
    final snackBar = SnackBar(
        backgroundColor: ColorsCustom.backgroundColor.withOpacity(0.8),
        content: Text(message));

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
