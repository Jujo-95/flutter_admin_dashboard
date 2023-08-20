import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:admin_dashboard/ui/inputs/custom_input_decoration.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: boxDecorationBuilder(),
      child: TextFormField(
        decoration: CustomInputDecoration.searchInputDecoration(
            hint: 'Buscar', icon: Icons.search_rounded),
      ),
    );
  }

  BoxDecoration boxDecorationBuilder() => BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: ColorsCustom.lineSeparatorColor.withOpacity(0.3));
}
