import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/ui/views/no_page_found_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandlers {
  static Handler noPageFoundHandler = Handler(handlerFunc: (context, params) {
    Provider.of<SidebarProvider>(context!, listen: false)
        .setCurrentPageUrl('/nondefinedroute');

    return const NoPageFoundView();
  });
}
