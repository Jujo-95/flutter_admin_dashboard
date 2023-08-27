import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData? icon;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = Colors.blueAccent,
    this.isFilled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(BorderSide(
              color: isFilled
                  ? Colors.transparent
                  : ColorsCustom.primaryButtonNotFilled)),
          backgroundColor: MaterialStateProperty.all(
              isFilled ? ColorsCustom.primaryButtonColor : Colors.white)),
      onPressed: () => onPressed(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: icon == null
            ? Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: isFilled
                        ? Colors.white
                        : ColorsCustom.primaryButtonNotFilled,
                    fontWeight: FontWeight.w500),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: isFilled
                        ? Colors.white
                        : ColorsCustom.primaryButtonNotFilled,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 16,
                        color:
                            isFilled ? Colors.white : ColorsCustom.titleColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
      ),
    );
  }
}
