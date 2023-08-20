import 'package:flutter/material.dart';

class SidebarProvider extends ChangeNotifier {
  static late AnimationController menuController;
  static bool isOpen = false;
  String _currentPage = '';

  String get currentPage {
    return _currentPage;
  }

  void setCurrentPageUrl(routeName) {
    _currentPage = routeName;
    Future.delayed(
      const Duration(milliseconds: 100),
      () => notifyListeners(),
    );
  }

  static Animation<double> movement = Tween<double>(begin: -300, end: 0)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOutCirc));

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: menuController, curve: Curves.easeInOutCirc));

  static void openSidebar() {
    isOpen = true;
    menuController.forward();
  }

  static void closeSidebar() {
    isOpen = false;
    menuController.reverse();
  }

  static void toogle() {
    (isOpen) ? menuController.reverse() : menuController.forward();

    isOpen = !isOpen;
  }
}
