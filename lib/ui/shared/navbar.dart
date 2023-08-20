import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:admin_dashboard/ui/shared/widgets/notification_indicator.dart';
import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 50,
      decoration: buildDecoration(),
      child: Row(children: [
        if (size.width < 700)
          IconButton(
            icon: Icon(Icons.menu_rounded),
            onPressed: () {
              SidebarProvider.openSidebar();
            },
          ),
        SizedBox(
          width: 5,
        ),
        if (size.width > 400)
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250),
            child: SearchText(),
          ),
        Spacer(),
        NotificationsIndicator()
      ]),
    );
  }

  BoxDecoration buildDecoration() =>
      BoxDecoration(color: ColorsCustom.backgroundSideColor);
}
