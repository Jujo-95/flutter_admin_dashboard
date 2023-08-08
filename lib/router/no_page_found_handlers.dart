import 'package:admin_dashboard/ui/views/no_page_found_view.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {
  static Handler noPageFoundHandler = Handler(handlerFunc: (context, params) {
    return const NoPageFoundView();
  });
}
