import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SidebarProvider.menuController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsCustom.backgroundColor,
      body: Stack(
        children: [
          Row(children: [
            if (size.width > 700) Sidebar(),
            Expanded(
              child: Column(
                children: [
                  Navbar(),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(child: widget.child),
                  )),
                ],
              ),
            ),
          ]),
          if (size.width < 700)
            AnimatedBuilder(
              animation: SidebarProvider.menuController,
              builder: (context, _) => Stack(
                children: [
                  if (SidebarProvider.isOpen)
                    Opacity(
                      opacity: SidebarProvider.opacity.value,
                      child: GestureDetector(
                        onTap: () => SidebarProvider.closeSidebar(),
                        child: Container(
                          height: size.height,
                          width: size.width,
                          color: ColorsCustom.backgroundColor.withOpacity(0.6),
                        ),
                      ),
                    ),
                  Transform.translate(
                    offset: Offset(SidebarProvider.movement.value, 0),
                    child: Sidebar(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
