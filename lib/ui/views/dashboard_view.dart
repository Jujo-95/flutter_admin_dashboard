import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(24),
      physics: ClampingScrollPhysics(),
      children: [
        Center(
            child: Text(
          'Dasboard view',
          style: CustomLabels.h1,
        ))
      ],
    );
  }
}
