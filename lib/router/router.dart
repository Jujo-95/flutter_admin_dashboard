import 'package:admin_dashboard/router/auth_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  //Auth Router
  static String loginRoute = 'auth/login';
  static String registerRoute = 'auth/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    //Auth Routes
    router.define(rootRoute,
        handler: AuthHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AuthHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AuthHandlers.register, transitionType: TransitionType.none);
    //router.define(dashboarRoute, handler: handler);

    // Dashboard
    router.define(dashboardRoute,
        handler: DashboarHandlers.dashboard,
        transitionType: TransitionType.none);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFoundHandler;
  }
}
