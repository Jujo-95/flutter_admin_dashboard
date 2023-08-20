import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/AuthResponse.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigarion_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum AuthState { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  AuthState authState = AuthState.checking;
  String? _token;
  Usuario? user;

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

  register(String email, String password, String name) {
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };
    print('data: $data');
    CafeApi.httpPost('/usuarios', data).then((data) {
      final authResponse = AuthResponse.fromJson(data);
      user = authResponse.usuario;
      authState = AuthState.authenticated;
      LocalStorage.pref.setString('token', authResponse.token);
      notifyListeners();
    }).catchError((e) {
      print('error en $e  )');
    });

    // TODO: Petición HTTP
    // _token = 'adjkfhadfyiu12y3hjasd.ajskhdaks.kjshdkjas';
    // LocalStorage.pref.setString('token', _token!);

    // authState = AuthState.authenticated;
    // notifyListeners();

    // NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.pref.getString('token');

    if (token == null) {
      authState = AuthState.notAuthenticated;
      notifyListeners();
      return false;
    }

    await Future.delayed(Duration(milliseconds: 10));
    authState = AuthState.authenticated;

    notifyListeners();

    return true;
  }
}
