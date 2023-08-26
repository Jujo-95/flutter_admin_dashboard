import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/categories_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboarHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
    // set the actual route in the provider
    Provider.of<SidebarProvider>(context)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authState == AuthState.notAuthenticated) {
      return const LoginView();
    } else {
      return const DashboardView();
    }
  });

  static Handler icons = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SidebarProvider>(context)
        .setCurrentPageUrl(Flurorouter.iconsRoute);

    if (authProvider.authState == AuthState.notAuthenticated) {
      return const LoginView();
    } else {
      return const IconsView();
    }
  });

  static Handler categories = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SidebarProvider>(context)
        .setCurrentPageUrl(Flurorouter.categoriesRoute);

    if (authProvider.authState == AuthState.notAuthenticated) {
      return const LoginView();
    } else {
      return const CategoriesView();
    }
  });
}
