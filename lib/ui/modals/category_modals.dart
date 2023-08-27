import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:flutter/material.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? categoria;

  const CategoryModal({super.key, this.categoria});

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String? id;
  String? nombre;

  @override
  initState() {
    super.initState();
    id = widget.categoria?.id ?? '';
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsCustom.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      height: double.infinity,
      width: 500,
    );
  }
}
