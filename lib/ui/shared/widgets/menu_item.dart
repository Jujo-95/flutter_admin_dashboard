import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatefulWidget {
  final String text;
  final IconData? icon;
  late bool isActive;
  final Function onPressed;

  MenuItem({
    super.key,
    required this.text,
    this.icon,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedContainer(
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            // color: isHovered
            //     ? Color.fromRGBO(243, 247, 255, 1)
            //     : widget.isActive
            //         ? Color.fromRGBO(243, 247, 255, 1)
            //         : Colors.transparent,
            ),
        duration: Duration(milliseconds: 250),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: isHovered
              ? Color.fromRGBO(243, 247, 255, 1)
              : widget.isActive
                  ? Color.fromRGBO(243, 247, 255, 1)
                  : Colors.transparent,
          //color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: widget.isActive
                ? null
                : () {
                    widget.onPressed();
                  },
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
                    widget.icon != null
                        ? Icon(
                            widget.icon,
                            color: Color.fromRGBO(79, 77, 85, 1),
                          )
                        : SizedBox.shrink(),
                    SizedBox(width: 16),
                    Text(
                      widget.text,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: widget.isActive
                            ? Color.fromRGBO(4, 77, 251, 1)
                            : Color.fromRGBO(79, 77, 85, 1),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
