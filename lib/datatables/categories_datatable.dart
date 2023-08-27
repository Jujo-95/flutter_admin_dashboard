import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/ui/modals/category_modals.dart';
import 'package:flutter/material.dart';
import 'package:side_sheet/side_sheet.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);

  @override
  DataRow? getRow(int index) {
    Categoria categoria = categorias[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(categoria.id)),
      DataCell(Text(categoria.nombre)),
      DataCell(Text('')),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.edit_outlined,
              color: Colors.blue,
              size: 21,
            ),
            onPressed: () {
              SideSheet.right(
                  width: MediaQuery.of(context).size.width * 0.71,
                  context: context,
                  body: const CategoryModal(
                    categoria: null,
                  ));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.redAccent,
              size: 21,
            ),
            onPressed: () {
              final dialog = AlertDialog(
                content: Text(
                    '¿Estás seguro que deseas eliminar ${categoria.nombre}?'),
                actions: [
                  TextButton(onPressed: () {}, child: Text('Sí, eliminar')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('No')),
                ],
              );
              showDialog(context: context, builder: (_) => dialog);
            },
          ),
        ],
      ))
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => categorias.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
