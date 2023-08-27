import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(24),
      physics: ClampingScrollPhysics(),
      children: [
        Center(
            child: Text(
          'Icons View',
          style: CustomLabels.h1,
        ))
      ],
    );
  }
}
