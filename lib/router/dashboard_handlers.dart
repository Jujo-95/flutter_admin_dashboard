import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:fluro/fluro.dart';

class DashboarHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    return const DashboardView();
  });
}
