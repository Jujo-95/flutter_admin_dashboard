import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;

  const MenuItem({
    super.key,
    required this.text,
    required this.icon,
    this.isActive = false,
    required this.onPressed,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      color: isHovered
          ? Color.fromRGBO(245, 248, 253, 1)
          : widget.isActive
              ? Color.fromRGBO(245, 248, 253, 1)
              : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : () => widget.onPressed(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: MouseRegion(
              onEnter: (_) => setState(() {
                () => isHovered = true;
              }),
              onExit: (_) => setState(() {
                () => isHovered = false;
              }),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    color: Color.fromRGBO(79, 77, 85, 1),
                  ),
                  SizedBox(width: 16),
                  Text(
                    widget.text,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color.fromRGBO(79, 77, 85, 1),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
