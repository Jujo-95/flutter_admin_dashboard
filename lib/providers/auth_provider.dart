import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigarion_services.dart';
import 'package:flutter/material.dart';

enum AuthState { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  AuthState authState = AuthState.checking;
  String? _token;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // TODO: Petición HTTP
    _token = 'adjkfhadfyiu12y3hjasd.ajskhdaks.kjshdkjas';
    LocalStorage.pref.setString('token', _token!);

    authState = AuthState.authenticated;
    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.pref.getString('token');

    if (token == null) {
      authState = AuthState.notAuthenticated;
      notifyListeners();
      return false;
    }

    await Future.delayed(Duration(seconds: 3));
    authState = AuthState.authenticated;

    notifyListeners();

    return true;
  }
}
