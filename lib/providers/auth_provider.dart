import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/html/AuthResponse.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigarion_services.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
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
    final data = {
      'correo': email,
      'password': password,
    };

    CafeApi.httpPost('/auth/login', data).then((data) {
      final authResponse = AuthResponse.fromJson(data);
      user = authResponse.usuario;
      authState = AuthState.authenticated;
      LocalStorage.pref.setString('token', authResponse.token);
      notifyListeners();
    }).catchError((e) {
      NotificationServices.showSnackbar(
          'Usuario / Password no son válidos o ese correo no está registrado');
    });
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
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationServices.showSnackbar(
          'Usuario / Password no son válidos o ese correo ya está registrado');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.pref.getString('token');

    if (token == null) {
      authState = AuthState.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final resp = await CafeApi.httpGet('/auth');

      final authResponse = AuthResponse.fromJson(resp);
      LocalStorage.pref.setString('token', authResponse.token);
      user = authResponse.usuario;
      authState = AuthState.authenticated;
      CafeApi.configureDio();
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authState = AuthState.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.pref.remove('token');
    authState = AuthState.notAuthenticated;
    notifyListeners();
  }
}
