import 'package:admin_dashboard/ui/shared/fontsStyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileContainer extends StatelessWidget {
  final String name;
  final String role;
  const ProfileContainer({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  role,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Color.fromRGBO(95, 95, 97, 1)),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Icon(Icons.arrow_drop_down_rounded)
        ],
      ),
    );
  }
}
