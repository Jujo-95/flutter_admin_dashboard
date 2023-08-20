import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0, left: 24.0, top: 72),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 50,
                    color: ColorsCustom.titleColor,
                  ),
                  Text(
                    'Real Estate dashboard',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorsCustom.subtitleColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
