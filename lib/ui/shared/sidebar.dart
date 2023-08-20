import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:admin_dashboard/services/navigarion_services.dart';
import 'package:admin_dashboard/ui/shared/widgets/line_separator.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widgets/profile_container.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateTo(route) {
      NavigationService.navigateTo(route);
      SidebarProvider.closeSidebar();
    }

    final SidebarProvider sidebarProvider =
        Provider.of<SidebarProvider>(context);

    return Container(
      width: 300,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        children: [
          //Logo(),
          ProfileContainer(
            name: 'Juan José García',
            role: 'Standard Account',
          ),
          LineSeparator(),
          TextSeparator(text: 'Main'),
          MenuItem(
            isActive: sidebarProvider.currentPage == Flurorouter.dashboardRoute,
            text: 'Dashboard',
            //icon: Icons.compass_calibration_rounded,
            onPressed: () {
              navigateTo(Flurorouter.dashboardRoute);
            },
          ),
          MenuItem(
            text: 'Analitycs',
            //icon: Icons.compass_calibration_rounded,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Categories',
            //icon: Icons.compass_calibration_rounded,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Products',
            //icon: Icons.compass_calibration_rounded,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Discount',
            //icon: Icons.compass_calibration_rounded,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Customer',
            //icon: Icons.compass_calibration_rounded,
            onPressed: () {},
          ),
          MenuItem(
            isActive: sidebarProvider.currentPage == Flurorouter.iconsRoute,
            text: 'Icons',
            //icon: Icons.compass_calibration_rounded,
            onPressed: () {
              NavigationService.navigateTo(Flurorouter.iconsRoute);
            },
          ),

          LineSeparator(),
          TextSeparator(text: 'Exit'),
          MenuItem(
            text: 'Logout',
            //icon: Icons.compass_calibration_rounded,
            onPressed: () {
              navigateTo(Flurorouter.iconsRoute);
            },
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.centerLeft,
              begin: Alignment.centerRight,
              colors: [
            ColorsCustom.backgroundSideColor,
            ColorsCustom.backgroundSideColor
          ]));
}
