import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  validateForm() {
    return true;
    if (formKey.currentState!.validate()) {
      print('Form valid $email === $password');
      return true;
    } else {
      print('Form ivalid $email === $password');
      return false;
    }
  }
}
