import 'package:admin_dashboard/ui/layouts/auth/widgets/background_manufacture.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_gradient_background.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Scrollbar(
      child: ListView(children: [
        //Desktop
        size.width > 1000
            ? _DesktopBody(child: child)
            : _MobileBody(child: child),
      ]
          //Mobile

          //Linkbar
          ),
    ));
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CustomTitle(),
          SizedBox(height: 600, child: child),
          const SizedBox(height: 400, child: CustomGradientBackground()),
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: Row(
        children: [
          // Background
          const Expanded(child: CustomGradientBackground()),

          // Login Content
          Container(
            width: 600,
            height: size.height + 28,
            color: Colors.black,
            child: Column(
              children: [
                const CustomTitle(),
                const SizedBox(height: 24),
                Expanded(child: child)
              ],
            ),
          )
        ],
      ),
    );
  }
}
