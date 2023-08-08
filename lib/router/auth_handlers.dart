import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class AuthHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context!, listen: false);

    if (authProvider.authState == AuthState.notAuthenticated) {
      return const LoginView();
    } else {
      return const DashboardView();
    }
  });

  static Handler register = Handler(handlerFunc: (context, params) {
    return const RegisterView();
  });
}
